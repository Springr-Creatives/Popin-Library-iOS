//
//  CallUICoordinator.swift
//  PopinCall
//

import Foundation

#if canImport(UIKit)
import UIKit

/// Owns all call VC presentation and lifecycle.
/// Communicates upward via callbacks — never references Popin.shared.
class CallUICoordinator {

    // MARK: - State

    private(set) weak var currentCallViewController: PopinCallViewController?
    private var pendingCallViewController: PopinCallViewController?

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

    func presentOutgoingCallVC(callQueueId: Int, config: PopinConfig) {
        PopinLogger.shared.log("CallUICoordinator.presentOutgoingCallVC: queueId=\(callQueueId)")
        let callVC = buildCallVC(config: config, isOutgoing: true)
        callVC.callQueueId = callQueueId
        callVC.isOutgoingCall = true
        currentCallViewController = callVC
        pendingCallViewController = callVC
        presentCallVCFromRoot(callVC)
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
    }

    func hasActiveVC() -> Bool {
        return currentCallViewController != nil
    }

    func currentVCIsOutgoingAndNotConnected() -> Bool {
        guard let vc = currentCallViewController else { return false }
        return vc.isOutgoingCall && !vc.callConnected
    }

    // MARK: - Cleanup

    func cleanupAfterCallEnd() {
        currentCallViewController = nil
        pendingCallViewController = nil
        Utilities.shared.clearConnected()
        onCallEnd?()
        PopinLogger.shared.log("CallUICoordinator.cleanupAfterCallEnd: State reset complete")
    }

    // MARK: - Private

    private func buildCallVC(config: PopinConfig, isOutgoing: Bool) -> PopinCallViewController {
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
        guard let rootVC = UIApplication.shared.connectedScenes
            .compactMap({ ($0 as? UIWindowScene)?.keyWindow?.rootViewController })
            .first else {
            PopinLogger.shared.log("CallUICoordinator.presentCallVCFromRoot: No root VC found")
            pendingCallViewController = nil
            return
        }

        if rootVC.presentedViewController != nil {
            PopinLogger.shared.log("CallUICoordinator.presentCallVCFromRoot: Dismissing existing VC first")
            rootVC.dismiss(animated: false) { [weak self] in
                rootVC.present(callVC, animated: true) {
                    self?.pendingCallViewController = nil
                    completion?()
                }
            }
        } else {
            PopinLogger.shared.log("CallUICoordinator.presentCallVCFromRoot: Presenting directly")
            rootVC.present(callVC, animated: true) { [weak self] in
                self?.pendingCallViewController = nil
                completion?()
            }
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
