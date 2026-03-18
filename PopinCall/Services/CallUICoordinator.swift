//
//  CallUICoordinator.swift
//  PopinCall
//

import Foundation
import UserNotifications

#if canImport(UIKit)
import UIKit

/// Owns all call VC presentation and lifecycle.
/// Communicates upward via callbacks — never references Popin.shared.
class CallUICoordinator {

    // MARK: - Constants

    private static let videoCallNotificationId = "popin_video_call_notification"

    // MARK: - State

    private(set) weak var currentCallViewController: PopinCallViewController?
    private var pendingCallViewController: PopinCallViewController?

    /// Deferred presentation stored when the app is backgrounded (e.g. lock-screen answer).
    /// Replayed once the app becomes active.
    private var deferredPresentation: (callVC: PopinCallViewController, completion: (() -> Void)?)?
    private var foregroundObserver: NSObjectProtocol?

    // MARK: - Upward callbacks (set by Popin facade)

    /// Called when a call ends and state should be cleaned up.
    var onCallEnd: (() -> Void)?
    /// Called when the room reports a network failure.
    var onNetworkFailure: ((String) -> Void)?
    /// Called when the user abandons a waiting outgoing call.
    var onCallAbandoned: (() -> Void)?
    /// Called when the user cancels a waiting outgoing call. Passes the callQueueId.
    var onCallCancelled: ((Int?) -> Void)?

    // MARK: - Present Outgoing Call VC

    func presentOutgoingCallVC(config: PopinConfig) {
        PopinLogger.shared.log("CallUICoordinator.presentOutgoingCallVC")
        let callVC = buildCallVC(config: config, isOutgoing: true)
        callVC.isOutgoingCall = true
        currentCallViewController = callVC
        pendingCallViewController = callVC
        presentCallVCFromRoot(callVC)
    }

    func updateCallQueueId(_ id: Int) {
        currentCallViewController?.callQueueId = id
    }

    // MARK: - Present Incoming Call UI

    func presentIncomingCallUI(config: PopinConfig) {
        guard let pushData = PopinCallManager.shared.callData,
              let callUUID = PopinCallManager.shared.callUUID else { return }
        guard currentCallViewController == nil else { return }

        PopinLogger.shared.log("CallUICoordinator.presentIncomingCallUI")
        let callVC = buildCallVC(config: config, isOutgoing: false)
        callVC.pushCallData = pushData
        callVC.callUUID = callUUID
        currentCallViewController = callVC
        pendingCallViewController = callVC
        presentCallVCFromRoot(callVC)
    }

    // MARK: - Present New Call VC (fallback for incoming without existing UI)

    func presentCallVC(talkModel: TalkModel, config: PopinConfig) {
        PopinLogger.shared.log("CallUICoordinator.presentCallVC: callId=\(talkModel.id ?? -1)")
        let callVC = buildCallVC(config: config, isOutgoing: false)
        currentCallViewController = callVC
        pendingCallViewController = callVC
        presentCallVCFromRoot(callVC) {
            callVC.loadCall(call: talkModel)
        }
    }

    // MARK: - VC Operations

    func loadCallInCurrentVC(_ talkModel: TalkModel) {
        currentCallViewController?.loadCall(call: talkModel)
    }

    func closeCurrentVC(message: String) {
        currentCallViewController?.closeCall(message: message)
    }

    func updateQueuePosition(_ position: Int) {
        currentCallViewController?.updateQueuePosition(position)
    }

    func handleCallMissed() {
        currentCallViewController?.handleCallMissed()
        currentCallViewController = nil
        pendingCallViewController = nil
        cancelDeferredPresentation()
    }

    func handleRemoteCancel() {
        currentCallViewController?.handleRemoteCancel()
    }

    func handleCallKitAnswer() {
        currentCallViewController?.handleCallKitAnswerCall()
    }

    func cancelPendingVC() {
        currentCallViewController = nil
        pendingCallViewController = nil
        cancelDeferredPresentation()
    }

    func hasActiveVC() -> Bool {
        return currentCallViewController != nil
    }

    func currentVCIsOutgoingAndNotConnected() -> Bool {
        guard let vc = currentCallViewController else { return false }
        return vc.isOutgoingCall && !vc.callConnected
    }

    // MARK: - Video Call Notification

    /// Posts a local notification prompting the user to tap to open the video call.
    /// Used when the call is answered via CallKit but the video UI can't be shown
    /// immediately (e.g. "Hold & Accept" while on a GSM call keeps CallKit's audio UI visible).
    func postVideoCallNotification(callerName: String) {
        let center = UNUserNotificationCenter.current()

        // Request authorization (best-effort — if already granted this is a no-op).
        center.requestAuthorization(options: [.alert, .sound]) { granted, _ in
            guard granted else {
                PopinLogger.shared.log("CallUICoordinator: Notification permission not granted — skipping video call notification")
                return
            }

            let content = UNMutableNotificationContent()
            content.title = callerName
            content.body = "Tap to open video call"
            content.sound = nil

            // Fire immediately
            let request = UNNotificationRequest(
                identifier: Self.videoCallNotificationId,
                content: content,
                trigger: nil
            )

            center.add(request) { error in
                if let error = error {
                    PopinLogger.shared.log("CallUICoordinator: Failed to post video call notification: \(error.localizedDescription)")
                } else {
                    PopinLogger.shared.log("CallUICoordinator: Video call notification posted")
                }
            }
        }
    }

    /// Removes the video-call notification (e.g. when the video UI is presented or the call ends).
    func removeVideoCallNotification() {
        let center = UNUserNotificationCenter.current()
        center.removeDeliveredNotifications(withIdentifiers: [Self.videoCallNotificationId])
        center.removePendingNotificationRequests(withIdentifiers: [Self.videoCallNotificationId])
        PopinLogger.shared.log("CallUICoordinator: Video call notification removed")
    }

    // MARK: - Cleanup

    func cleanupAfterCallEnd() {
        currentCallViewController = nil
        pendingCallViewController = nil
        cancelDeferredPresentation()
        removeVideoCallNotification()
        Utilities.shared.clearConnected()
        onCallEnd?()
        PopinLogger.shared.log("CallUICoordinator.cleanupAfterCallEnd: State reset complete")
    }

    // MARK: - Private

    private func buildCallVC(config: PopinConfig, isOutgoing: Bool) -> PopinCallViewController {
        PopinLogger.shared.log("CallUICoordinator.buildCallVC: isOutgoing=\(isOutgoing), hideFlipCameraButton=\(config.hideFlipCameraButton)")
        let callVC = PopinCallViewController()
        callVC.modalPresentationStyle = .overFullScreen
        callVC.popinConfig = config
        callVC.isOutgoingCall = isOutgoing
        callVC.onCallEnd = { [weak self] in
            PopinLogger.shared.log("CallUICoordinator: onCallEnd fired (isOutgoing=\(isOutgoing))")
            self?.cleanupAfterCallEnd()
        }
        callVC.onNetworkFailure = { [weak self] participant in
            PopinLogger.shared.log("CallUICoordinator: onNetworkFailure fired (participant=\(participant))")
            self?.onNetworkFailure?(participant)
        }
        callVC.onCallAbandoned = { [weak self] in
            self?.onCallAbandoned?()
        }
        callVC.onCallCancelled = { [weak self] queueId in
            self?.onCallCancelled?(queueId)
        }
        return callVC
    }

    private func presentCallVCFromRoot(_ callVC: PopinCallViewController, completion: (() -> Void)? = nil) {
        // When the app is backgrounded (e.g. user answered on the lock screen),
        // UIKit silently drops present/dismiss completion blocks.
        // Defer the presentation until the app is foregrounded.
        if UIApplication.shared.applicationState != .active {
            PopinLogger.shared.log("CallUICoordinator.presentCallVCFromRoot: App not active (state=\(UIApplication.shared.applicationState.rawValue)) — deferring presentation until foreground")
            deferredPresentation = (callVC: callVC, completion: completion)
            observeForeground()
            return
        }

        performPresentation(callVC, completion: completion)
    }

    private func performPresentation(_ callVC: PopinCallViewController, completion: (() -> Void)? = nil) {
        guard let rootVC = UIApplication.shared.connectedScenes
            .compactMap({ ($0 as? UIWindowScene)?.keyWindow?.rootViewController })
            .first else {
            PopinLogger.shared.log("CallUICoordinator.performPresentation: No root VC found — clearing state to allow retry")
            currentCallViewController = nil
            pendingCallViewController = nil
            return
        }

        // Video UI is about to appear — dismiss the "tap to open" notification
        removeVideoCallNotification()

        if rootVC.presentedViewController != nil {
            PopinLogger.shared.log("CallUICoordinator.performPresentation: Dismissing existing VC first")
            rootVC.dismiss(animated: false) { [weak self] in
                rootVC.present(callVC, animated: true) {
                    self?.pendingCallViewController = nil
                    completion?()
                }
            }
        } else {
            PopinLogger.shared.log("CallUICoordinator.performPresentation: Presenting directly")
            rootVC.present(callVC, animated: true) { [weak self] in
                self?.pendingCallViewController = nil
                completion?()
            }
        }
    }

    private func observeForeground() {
        // Avoid duplicate observers
        guard foregroundObserver == nil else { return }
        foregroundObserver = NotificationCenter.default.addObserver(
            forName: UIApplication.didBecomeActiveNotification,
            object: nil,
            queue: .main
        ) { [weak self] _ in
            self?.replayDeferredPresentation()
        }
    }

    private func replayDeferredPresentation() {
        // Remove observer first to avoid re-entry
        if let observer = foregroundObserver {
            NotificationCenter.default.removeObserver(observer)
            foregroundObserver = nil
        }

        guard let deferred = deferredPresentation else { return }
        deferredPresentation = nil

        PopinLogger.shared.log("CallUICoordinator.replayDeferredPresentation: App became active — presenting deferred call VC")
        performPresentation(deferred.callVC, completion: deferred.completion)
    }

    private func cancelDeferredPresentation() {
        deferredPresentation = nil
        if let observer = foregroundObserver {
            NotificationCenter.default.removeObserver(observer)
            foregroundObserver = nil
        }
    }

    static func topViewController(base: UIViewController? = nil) -> UIViewController? {
        let base = base ?? UIApplication.shared.connectedScenes
            .compactMap { ($0 as? UIWindowScene)?.keyWindow?.rootViewController }
            .first
        if let nav = base as? UINavigationController { return topViewController(base: nav.visibleViewController) }
        if let tab = base as? UITabBarController, let selected = tab.selectedViewController { return topViewController(base: selected) }
        if let presented = base?.presentedViewController { return topViewController(base: presented) }
        return base
    }
}

#endif
