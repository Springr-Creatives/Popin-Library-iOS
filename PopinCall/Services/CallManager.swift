//
//  CallManager.swift
//  Popin
//
//  Created by Ashwin Nath on 25/05/25.
//

import Foundation

#if canImport(UIKit)
import CallKit
import AVFoundation
import LiveKitWebRTC
import LiveKit
import PushKit
import UIKit

// MARK: - Call State

enum CallState {
    case idle
    case ringing(UUID)
    case connecting(UUID)
    case connected(UUID)
    case ended
}

// MARK: - CallManager Delegate

protocol CallManagerDelegate: AnyObject {
    func callManager(_ manager: CallManager, didReceiveIncomingCall callUUID: UUID, callerName: String)
    func callManager(_ manager: CallManager, didAnswerCall callUUID: UUID)
    func callManager(_ manager: CallManager, didEndCall callUUID: UUID)
    func callManager(_ manager: CallManager, didHoldCall callUUID: UUID, isOnHold: Bool)
    func callManager(_ manager: CallManager, didActivateAudioSession session: AVAudioSession)
    func callManager(_ manager: CallManager, didDeactivateAudioSession session: AVAudioSession)
}

// MARK: - CallManager

class CallManager: NSObject {

    // MARK: - Singleton

    static let shared = CallManager()

    // MARK: - Properties

    // CallKit
    private let callController = CXCallController()
    private let provider: CXProvider
    private let callObserver = CXCallObserver()

    // PushKit
    private let pushRegistry = PKPushRegistry(queue: .main)

    // State
    private(set) var callState: CallState = .idle
    private(set) var currentCallUUID: UUID?
    private(set) var voipToken: String?
    private(set) var callWasAnswered: Bool = false
    var callEndedByTimeout: Bool = false

    weak var delegate: CallManagerDelegate?
    var onCallAnswered: (() -> Void)?
    /// Fired when a call ends via CallKit before the in-app VC ever became delegate
    /// (e.g. user rejects from the lock-screen CallKit UI while the app is backgrounded).
    /// Lets the UI layer cancel any deferred/pending VC presentation.
    var onCallEndedBeforeAnswer: (() -> Void)?

    // MARK: - Initialization

    private(set) var voipRegistered = false

    private override init() {
        PopinLogger.shared.log("CallManager.init() START")

        // Setup CallKit provider
        let configuration = CXProviderConfiguration(localizedName: "Popin Seller")
        configuration.supportsVideo = true
        configuration.maximumCallsPerCallGroup = 1
        configuration.maximumCallGroups = 1
        configuration.supportedHandleTypes = [.generic]
        configuration.iconTemplateImageData = UIImage(named: "AppIcon")?.pngData()
        configuration.includesCallsInRecents = false

        provider = CXProvider(configuration: configuration)
        PopinLogger.shared.log("CallManager: CXProvider created")

        super.init()

        // Setup delegates
        provider.setDelegate(self, queue: .main)
        callObserver.setDelegate(self, queue: nil)
        PopinLogger.shared.log("CallManager: CallKit delegates set")

        // Disable LiveKit's automatic audio-session configuration globally.
        // All calls (incoming + outgoing) go through CallKit, so audio is managed
        // exclusively via didActivateAudioSession / didDeactivateAudioSession.
        // Per LiveKit: https://github.com/livekit-examples/swift-example-collection/tree/main/callkit
        AudioManager.shared.audioSession.isAutomaticConfigurationEnabled = false
        do {
            try AudioManager.shared.setEngineAvailability(.none)
        } catch {
            PopinLogger.shared.log("CallManager: Failed to disable audio engine at init: \(error)")
        }

        PopinLogger.shared.log("CallManager.init() END")
    }

    /// Register for VoIP pushes. Only call this when incoming calls are enabled.
    func registerForVoIPPushes() {
        guard !voipRegistered else {
            PopinLogger.shared.log("CallManager: VoIP pushes already registered, skipping")
            return
        }
        voipRegistered = true

        PopinLogger.shared.log("CallManager: Setting up PushKit registry, desiredPushTypes = [.voIP]")
        pushRegistry.delegate = self
        pushRegistry.desiredPushTypes = [.voIP]

        let existingToken = pushRegistry.pushToken(for: .voIP)
        PopinLogger.shared.log("CallManager: PushKit existing cached token = \(existingToken != nil ? "YES (\(existingToken!.count) bytes)" : "nil")")
    }

    // MARK: - Public Methods

    /// Report an incoming call to CallKit
    func reportIncomingCall(
        uuid: UUID,
        handle: String,
        hasVideo: Bool = true,
        completion: ((Error?) -> Void)? = nil
    ) {
        PopinLogger.shared.log("CallManager: reportIncomingCall: uuid=\(uuid), handle=\(handle)")
        currentCallUUID = uuid
        callState = .ringing(uuid)
        callWasAnswered = false
        callEndedByTimeout = false

        let update = CXCallUpdate()
        update.remoteHandle = CXHandle(type: .generic, value: handle)
        update.hasVideo = hasVideo
        update.supportsHolding = true
        update.supportsDTMF = false
        update.supportsGrouping = false
        update.supportsUngrouping = false

        provider.reportNewIncomingCall(with: uuid, update: update) { [weak self] error in
            if let error = error {
                PopinLogger.shared.log("CallManager: reportNewIncomingCall failed: \(error.localizedDescription)")
                self?.callState = .idle
                self?.currentCallUUID = nil
            } else {
                PopinLogger.shared.log("CallManager: reportNewIncomingCall success")
            }
            completion?(error)
        }
    }

    /// Start an outgoing call via CallKit.
    /// This triggers `CXStartCallAction` → `didActivateAudioSession` so the audio
    /// engine is ready before `room.connect()` is called later.
    func startOutgoingCall(handle: String = "Popin Call") {
        let callUUID = UUID()
        PopinLogger.shared.log("CallManager: startOutgoingCall: uuid=\(callUUID), handle=\(handle)")

        currentCallUUID = callUUID
        callState = .connecting(callUUID)
        callWasAnswered = false
        callEndedByTimeout = false

        let handle = CXHandle(type: .generic, value: handle)
        let startCallAction = CXStartCallAction(call: callUUID, handle: handle)
        startCallAction.isVideo = true
        let transaction = CXTransaction(action: startCallAction)

        callController.request(transaction) { [weak self] error in
            if let error = error {
                PopinLogger.shared.log("CallManager: startOutgoingCall FAILED: \(error.localizedDescription)")
                self?.callState = .idle
                self?.currentCallUUID = nil
            } else {
                PopinLogger.shared.log("CallManager: startOutgoingCall transaction accepted")
            }
        }
    }

    /// Report that an outgoing call has connected (e.g. room joined).
    /// Updates the CallKit UI with the connected timestamp.
    func reportOutgoingCallConnected() {
        guard let uuid = currentCallUUID else { return }
        PopinLogger.shared.log("CallManager: reportOutgoingCallConnected uuid=\(uuid)")
        provider.reportOutgoingCall(with: uuid, connectedAt: Date())
        callState = .connected(uuid)
    }

    /// Answer the current call
    func answerCall() {
        guard let uuid = currentCallUUID else {
            PopinLogger.shared.log("CallManager: answerCall failed: no currentCallUUID")
            return
        }

        PopinLogger.shared.log("CallManager: answerCall: requesting transaction for \(uuid)")
        let answerAction = CXAnswerCallAction(call: uuid)
        let transaction = CXTransaction(action: answerAction)
        requestTransaction(transaction)
    }

    /// End the current call
    func endCall() {
        guard let uuid = currentCallUUID else {
            PopinLogger.shared.log("CallManager: endCall failed: no currentCallUUID")
            return
        }

        PopinLogger.shared.log("CallManager: endCall: requesting transaction for \(uuid)")
        let endAction = CXEndCallAction(call: uuid)
        let transaction = CXTransaction(action: endAction)
        requestTransaction(transaction)
    }

    /// Clear the current call state
    func clearCurrentCall() {
        currentCallUUID = nil
        callState = .idle
        callWasAnswered = false
        callEndedByTimeout = false
    }

    // MARK: - Private Methods

    private func requestTransaction(_ transaction: CXTransaction) {
        callController.request(transaction) { [weak self] error in
        }
    }
}

// MARK: - CXProviderDelegate

extension CallManager: CXProviderDelegate {

    func providerDidReset(_ provider: CXProvider) {
        PopinLogger.shared.log("CallManager: providerDidReset")
        if let uuid = currentCallUUID {
            callState = .ended
            delegate?.callManager(self, didEndCall: uuid)
        }

        clearCurrentCall()
    }

    func provider(_ provider: CXProvider, perform action: CXStartCallAction) {
        PopinLogger.shared.log("CallManager: CXStartCallAction for \(action.callUUID)")
        callState = .connecting(action.callUUID)

        // Report the outgoing call as started so CallKit activates the audio session.
        // The actual room connection happens later when the agent accepts and room details arrive.
        provider.reportOutgoingCall(with: action.callUUID, startedConnectingAt: Date())

        action.fulfill()
    }

    func provider(_ provider: CXProvider, perform action: CXAnswerCallAction) {
        PopinLogger.shared.log("CallManager: CXAnswerCallAction for \(action.callUUID)")
        callState = .connecting(action.callUUID)
        callWasAnswered = true

        delegate?.callManager(self, didAnswerCall: action.callUUID)

        // Notify SDK to handle incoming call answer (present UI if needed, fetch call details)
        if PopinCallManager.shared.callData != nil {
            DispatchQueue.main.async {
                self.onCallAnswered?()
            }
        }

        action.fulfill(withDateConnected: Date())
        callState = .connected(action.callUUID)
    }

    func provider(_ provider: CXProvider, perform action: CXEndCallAction) {
        PopinLogger.shared.log("CallManager: CXEndCallAction for \(action.callUUID)")
        callState = .ended

        // Stop guarding — the call is ending
        AudioSessionGuard.shared.stopGuarding()

        // Explicitly disable audio engine to ensure clean cleanup.
        // This is important for "End & Accept" scenarios where didDeactivate might be skipped/delayed.
        try? AudioManager.shared.setEngineAvailability(.none)

        delegate?.callManager(self, didEndCall: action.callUUID)

        // If no delegate (VC not yet presented) and call was never answered, reject via API and clean up.
        // Skip reject if call was already answered — the end API was already called through the normal flow.
        // Skip reject if call ended due to timeout — the caller already knows the call wasn't picked up.
        if delegate == nil, !callWasAnswered {
            print("[Popin][CallManager] CXEndCallAction with no delegate — call rejected/ended before VC took over (callData=\(PopinCallManager.shared.callData != nil ? "present" : "nil"), endedByTimeout=\(callEndedByTimeout))")
            if let callData = PopinCallManager.shared.callData, !callEndedByTimeout {
                PopinLogger.shared.log("CallManager: CXEndCallAction: No delegate, rejecting call via API")
                let presenter = VideoCallPresenter(videoCallInteractor: VideoCallInteractor())
                presenter.rejectCall(callId: callData.callId)
            }
            PopinCallManager.shared.clearCallState()
            // Notify UI layer to cancel any deferred/pending VC presentation so we don't
            // present NotConnectedView when the user later foregrounds the app.
            onCallEndedBeforeAnswer?()
        }

        action.fulfill()
        clearCurrentCall()
    }

    func provider(_ provider: CXProvider, perform action: CXSetMutedCallAction) {
        PopinLogger.shared.log("CallManager: CXSetMutedCallAction muted=\(action.isMuted)")
        action.fulfill()
    }

    func provider(_ provider: CXProvider, perform action: CXSetHeldCallAction) {
        PopinLogger.shared.log("CallManager: CXSetHeldCallAction onHold=\(action.isOnHold)")
        delegate?.callManager(self, didHoldCall: action.callUUID, isOnHold: action.isOnHold)
        action.fulfill()
    }

    func provider(_ provider: CXProvider, didActivate audioSession: AVAudioSession) {
        PopinLogger.shared.log("CallManager: didActivateAudioSession")

        // Tell the guard that CallKit now owns the session
        AudioSessionGuard.shared.sessionDidActivate()

        // Configure audio session for LiveKit video calls.
        // We do NOT call setActive(true) — CallKit already activated it.
        do {
            try audioSession.setPreferredSampleRate(48000.0)
            try audioSession.setCategory(.playAndRecord, mode: .videoChat, options: [.allowBluetooth, .allowBluetoothA2DP, .defaultToSpeaker, .allowAirPlay])
            try audioSession.overrideOutputAudioPort(.speaker)

            // Enable LiveKit audio engine
            try AudioManager.shared.setEngineAvailability(.default)

            // Start guarding against hijacks now that the session is fully configured
            AudioSessionGuard.shared.startGuarding()

            delegate?.callManager(self, didActivateAudioSession: audioSession)
        } catch {
            PopinLogger.shared.log("CallManager: Failed to configure audio session: \(error)")
        }
    }

    func provider(_ provider: CXProvider, didDeactivate audioSession: AVAudioSession) {
        PopinLogger.shared.log("CallManager: didDeactivateAudioSession")

        // Stop guarding and mark CallKit as no longer managing
        AudioSessionGuard.shared.stopGuarding()
        AudioSessionGuard.shared.sessionDidDeactivate()

        // Deactivate LiveKit audio engine
        do {
            try AudioManager.shared.setEngineAvailability(.none)
        } catch {
            PopinLogger.shared.log("CallManager: Failed to deactivate audio session: \(error)")
        }

        delegate?.callManager(self, didDeactivateAudioSession: audioSession)
    }
}

// MARK: - PKPushRegistryDelegate

extension CallManager: PKPushRegistryDelegate {

    func pushRegistry(
        _ registry: PKPushRegistry,
        didUpdate pushCredentials: PKPushCredentials,
        for type: PKPushType
    ) {
        PopinLogger.shared.log("CallManager: pushRegistry didUpdate pushCredentials, type=\(type.rawValue)")
        guard type == .voIP else { return }

        let token = pushCredentials.token.map { String(format: "%02x", $0) }.joined()
        PopinLogger.shared.log("CallManager: VoIP push token received: \(token)")
        voipToken = token

        // Save and send token to server
        Utilities.shared.savePushToken(token: token)
        if Utilities.shared.getUser() != nil {
            PopinLogger.shared.log("CallManager: User exists, sending push token to server")
            Utilities.shared.sendPushToken(token: token)
        } else {
            PopinLogger.shared.log("CallManager: No user yet, token saved locally but not sent to server")
        }
    }

    func savePushToken(token: String) {
          UserDefaults.standard.set(token, forKey: "push_token")
      }

      func getPushToken() -> String {
          return UserDefaults.standard.string(forKey: "push_token") ?? ""
      }


    func pushRegistry(
        _ registry: PKPushRegistry,
        didInvalidatePushTokenFor type: PKPushType
    ) {
        PopinLogger.shared.log("CallManager: pushRegistry didInvalidatePushToken, type=\(type.rawValue)")
        guard type == .voIP else { return }

        voipToken = nil
    }

    func pushRegistry(
        _ registry: PKPushRegistry,
        didReceiveIncomingPushWith payload: PKPushPayload,
        for type: PKPushType,
        completion: @escaping () -> Void
    ) {
        PopinLogger.shared.log("CallManager: PKPushRegistry: didReceiveIncomingPushWith payload=\(payload.dictionaryPayload)")
        guard type == .voIP else {
            completion()
            return
        }

        // Configure audio session early (workaround for mic initialization issue).
        // Must set .playAndRecord BEFORE reportNewIncomingCall when woken from background.
        do {
            let session = AVAudioSession.sharedInstance()
            try session.setCategory(.playAndRecord, mode: .videoChat, options: [.mixWithOthers, .allowBluetooth, .allowBluetoothA2DP, .defaultToSpeaker, .allowAirPlay])
            try session.overrideOutputAudioPort(.speaker)
        } catch {
            PopinLogger.shared.log("CallManager: PKPushRegistry: Early audio configuration failed: \(error)")
        }

        // PushKit REQUIRES reporting an incoming call for every VoIP push.
        // Always forward to handleIncomingPush which guarantees a reportIncomingCall.
        PopinCallManager.shared.handleIncomingPush(payload: payload.dictionaryPayload, completion: completion)
    }
}

// MARK: - CXCallObserverDelegate

extension CallManager: CXCallObserverDelegate {
    func callObserver(_ callObserver: CXCallObserver, callChanged call: CXCall) {
        PopinLogger.shared.log("CallManager: CXCallObserver: callChanged uuid=\(call.uuid), hasEnded=\(call.hasEnded), isOutgoing=\(call.isOutgoing)")
        guard let currentUUID = currentCallUUID else { return }

        // Check if this is a different call (e.g. GSM call) and if it has ended
        if call.uuid != currentUUID && call.hasEnded {
            PopinLogger.shared.log("CallManager: CXCallObserver: External call ended, unholding current call \(currentUUID)")

            // Construct request to unhold the current call
            let setHeldAction = CXSetHeldCallAction(call: currentUUID, onHold: false)
            let transaction = CXTransaction(action: setHeldAction)

            callController.request(transaction) { error in
                if let error = error {
                    PopinLogger.shared.log("CallManager: CXCallObserver: Failed to unhold call: \(error.localizedDescription)")
                }
            }
        }
    }
}

#endif
