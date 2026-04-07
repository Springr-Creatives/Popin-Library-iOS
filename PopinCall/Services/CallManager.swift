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

    // MARK: - Initialization

    private(set) var voipRegistered = false

    private override init() {
        PopinLogger.shared.log("CallManager.init() 1.123 START")

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

    /// Configure the shared AVAudioSession and arm LiveKit's audio engine for an
    /// outgoing call that does NOT go through CallKit.
    ///
    /// For incoming calls, CallKit invokes `provider(_:didActivate:)` which handles
    /// this same setup. Outgoing calls started via `Popin.startCall()` never reach
    /// CallKit, so without this method the LiveKit audio engine's render side stays
    /// in whatever state the previous call left it in — symptom: local mic publishes
    /// fine but the user cannot hear the remote party.
    ///
    /// Safe to call multiple times; both `setCategory` and `setEngineAvailability`
    /// are idempotent.
    func configureAudioSessionForOutgoingCall() {
        PopinLogger.shared.log("CallManager: configureAudioSessionForOutgoingCall")
        do {
            let session = AVAudioSession.sharedInstance()
            try session.setPreferredSampleRate(48000.0)
            try session.setCategory(.playAndRecord, mode: .videoChat, options: [.allowBluetooth, .allowBluetoothA2DP, .defaultToSpeaker, .allowAirPlay])
            try session.setActive(true, options: [])
            try session.overrideOutputAudioPort(.speaker)

            // Arm LiveKit's audio engine so remote audio is rendered to the output.
            try AudioManager.shared.setEngineAvailability(.default)
            PopinLogger.shared.log("CallManager: configureAudioSessionForOutgoingCall OK — category=\(session.category.rawValue) mode=\(session.mode.rawValue) outputs=\(session.currentRoute.outputs.map { $0.portType.rawValue })")
        } catch {
            PopinLogger.shared.log("CallManager: configureAudioSessionForOutgoingCall FAILED — error=\(error)")
        }
    }

    /// Dumps a full snapshot of the current `AVAudioSession` state for debugging.
    ///
    /// Use this at every audio-session transition point in the incoming-call flow
    /// (push received, CXAnswer, didActivate, didDeactivate). The log lines are
    /// tagged with `tag` so you can grep for e.g. `AudioDiag[didActivate:pre]`.
    ///
    /// Fields logged:
    /// - category / mode / categoryOptions rawValue
    /// - sampleRate / preferredSampleRate / ioBufferDuration
    /// - inputs/outputs (port type + name + uid)
    /// - isInputAvailable, isOtherAudioPlaying, secondaryAudioShouldBeSilencedHint
    /// - recordPermission
    func logAudioSessionSnapshot(tag: String) {
        let s = AVAudioSession.sharedInstance()
        let route = s.currentRoute
        let inputs = route.inputs.map { "\($0.portType.rawValue):\($0.portName)" }.joined(separator: ",")
        let outputs = route.outputs.map { "\($0.portType.rawValue):\($0.portName)" }.joined(separator: ",")
        let perm: String = {
            switch s.recordPermission {
            case .granted: return "granted"
            case .denied: return "denied"
            case .undetermined: return "undetermined"
            @unknown default: return "unknown"
            }
        }()
        PopinLogger.shared.log("CallManager: AudioDiag[\(tag)] category=\(s.category.rawValue) mode=\(s.mode.rawValue) options=0x\(String(s.categoryOptions.rawValue, radix: 16)) sampleRate=\(s.sampleRate) preferredSampleRate=\(s.preferredSampleRate) ioBufferDuration=\(s.ioBufferDuration) inputs=[\(inputs)] outputs=[\(outputs)] isInputAvailable=\(s.isInputAvailable) isOtherAudioPlaying=\(s.isOtherAudioPlaying) secondaryAudioHint=\(s.secondaryAudioShouldBeSilencedHint) recordPermission=\(perm)")
    }

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

    func provider(_ provider: CXProvider, perform action: CXAnswerCallAction) {
        PopinLogger.shared.log("CallManager: CXAnswerCallAction for \(action.callUUID)")
        logAudioSessionSnapshot(tag: "answer:pre")
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

        // Defensive fallback: arm the LiveKit audio engine explicitly in case
        // provider(_:didActivate:) never fires (e.g. if the AVAudioSession was
        // configured with options incompatible with VoiceProcessingIO, CallKit
        // silently skips activation). Without this, setMicrophone fails with
        // Core Audio error -3010. setEngineAvailability is idempotent, so this
        // is safe even when didActivate does fire normally.
        do {
            try AudioManager.shared.setEngineAvailability(.default)
            PopinLogger.shared.log("CallManager: CXAnswerCallAction: LiveKit audio engine armed defensively")
        } catch {
            PopinLogger.shared.log("CallManager: CXAnswerCallAction: failed to arm LiveKit audio engine: \(error) nsError=\((error as NSError).domain)#\((error as NSError).code)")
        }
        logAudioSessionSnapshot(tag: "answer:post")
    }

    func provider(_ provider: CXProvider, perform action: CXEndCallAction) {
        PopinLogger.shared.log("CallManager: CXEndCallAction for \(action.callUUID)")
        callState = .ended

        // Explicitly disable audio session to ensure clean cleanup
        // This is important for "End & Accept" scenarios where didDeactivate might be skipped/delayed
        try? AudioManager.shared.setEngineAvailability(.none)

        delegate?.callManager(self, didEndCall: action.callUUID)

        // If no delegate (VC not yet presented) and call was never answered, reject via API and clean up.
        // Skip reject if call was already answered — the end API was already called through the normal flow.
        // Skip reject if call ended due to timeout — the caller already knows the call wasn't picked up.
        if delegate == nil, let callData = PopinCallManager.shared.callData, !callWasAnswered, !callEndedByTimeout {
            PopinLogger.shared.log("CallManager: CXEndCallAction: No delegate, rejecting call via API")
            let presenter = VideoCallPresenter(videoCallInteractor: VideoCallInteractor())
            presenter.rejectCall(callId: callData.callId)
            PopinCallManager.shared.clearCallState()
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
        PopinLogger.shared.log("CallManager: didActivateAudioSession — callState=\(callState) currentCallUUID=\(currentCallUUID?.uuidString ?? "nil")")
        logAudioSessionSnapshot(tag: "didActivate:pre")
        // Configure audio session for LiveKit video calls
        do {
            // WebRTC generally prefers 48kHz and NO mixWithOthers for VoiceProcessingIO
            PopinLogger.shared.log("CallManager: didActivate: setPreferredSampleRate(48000)")
            try audioSession.setPreferredSampleRate(48000.0)
            PopinLogger.shared.log("CallManager: didActivate: setCategory(.playAndRecord, .videoChat, [allowBluetooth, allowBluetoothA2DP, defaultToSpeaker, allowAirPlay])")
            try audioSession.setCategory(.playAndRecord, mode: .videoChat, options: [.allowBluetooth, .allowBluetoothA2DP, .defaultToSpeaker, .allowAirPlay])
            // CallKit activates the session for us, but we set the category.

            // Enable speaker by default for video calls
            PopinLogger.shared.log("CallManager: didActivate: overrideOutputAudioPort(.speaker)")
            try audioSession.overrideOutputAudioPort(.speaker)

            logAudioSessionSnapshot(tag: "didActivate:beforeLiveKitArm")

            // Activate LiveKit audio engine
            PopinLogger.shared.log("CallManager: didActivate: AudioManager.setEngineAvailability(.default)")
            try AudioManager.shared.setEngineAvailability(.default)

            logAudioSessionSnapshot(tag: "didActivate:post")
            PopinLogger.shared.log("CallManager: didActivate: configuration complete, notifying delegate")
            delegate?.callManager(self, didActivateAudioSession: audioSession)
        } catch {
            PopinLogger.shared.log("CallManager: Failed to configure audio session: \(error) nsError=\((error as NSError).domain)#\((error as NSError).code) userInfo=\((error as NSError).userInfo)")
            logAudioSessionSnapshot(tag: "didActivate:error")
        }
    }

    func provider(_ provider: CXProvider, didDeactivate audioSession: AVAudioSession) {
        PopinLogger.shared.log("CallManager: didDeactivateAudioSession — callState=\(callState)")
        logAudioSessionSnapshot(tag: "didDeactivate:pre")
        // Deactivate LiveKit audio session
        do {
            PopinLogger.shared.log("CallManager: didDeactivate: AudioManager.setEngineAvailability(.none)")
            try AudioManager.shared.setEngineAvailability(.none)
        } catch {
            PopinLogger.shared.log("CallManager: Failed to deactivate audio session: \(error) nsError=\((error as NSError).domain)#\((error as NSError).code)")
        }
        logAudioSessionSnapshot(tag: "didDeactivate:post")

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

        // Do NOT touch AVAudioSession here. Apple's CallKit docs are explicit:
        // "Don't activate your audio session. CallKit activates it at the
        // appropriate time." Pre-activating the session in this delegate causes
        // provider(_:didActivate:) to be silently skipped, which in turn means
        // the LiveKit audio engine is never armed — resulting in setMicrophone
        // failing with Core Audio error -3010. The session will be configured
        // in provider(_:didActivate:) after CXAnswerCallAction.fulfill().
        logAudioSessionSnapshot(tag: "push:entry")

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
