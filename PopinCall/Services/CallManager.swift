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

    weak var delegate: CallManagerDelegate?

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
        callState = .connecting(action.callUUID)

        delegate?.callManager(self, didAnswerCall: action.callUUID)

        // Notify SDK to handle incoming call answer (present UI if needed, fetch call details)
        if PopinCallManager.shared.callData != nil {
            DispatchQueue.main.async {
                Popin.shared?.onIncomingCallAnswered()
            }
        }

        action.fulfill(withDateConnected: Date())
        callState = .connected(action.callUUID)
    }

    func provider(_ provider: CXProvider, perform action: CXEndCallAction) {
        PopinLogger.shared.log("CallManager: CXEndCallAction for \(action.callUUID)")
        callState = .ended

        // Explicitly disable audio session to ensure clean cleanup
        // This is important for "End & Accept" scenarios where didDeactivate might be skipped/delayed
        try? AudioManager.shared.setEngineAvailability(.none)

        delegate?.callManager(self, didEndCall: action.callUUID)

        // If no delegate (VC not yet presented), reject via API and clean up
        if delegate == nil, let callData = PopinCallManager.shared.callData {
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
        PopinLogger.shared.log("CallManager: didActivateAudioSession")
        // Configure audio session for LiveKit video calls
        do {
            // WebRTC generally prefers 48kHz and NO mixWithOthers for VoiceProcessingIO
            try audioSession.setPreferredSampleRate(48000.0)
            try audioSession.setCategory(.playAndRecord, mode: .videoChat, options: [.allowBluetooth, .allowBluetoothA2DP, .defaultToSpeaker, .allowAirPlay])
            // CallKit activates the session for us, but we set the category.
            
            // Enable speaker by default for video calls
            try audioSession.overrideOutputAudioPort(.speaker)

            // Activate LiveKit audio engine
            try AudioManager.shared.setEngineAvailability(.default)

            delegate?.callManager(self, didActivateAudioSession: audioSession)
        } catch {
            PopinLogger.shared.log("CallManager: Failed to configure audio session: \(error)")
        }
    }

    func provider(_ provider: CXProvider, didDeactivate audioSession: AVAudioSession) {
        PopinLogger.shared.log("CallManager: didDeactivateAudioSession")
        // Deactivate LiveKit audio session
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

        // Configure audio session early (workaround for mic initialization issue)
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

// MARK: - Models

public struct Product: Codable {
    public let id: Int?
    public let externalId: String?
    public let name: String?
    public let image: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case externalId = "external_id"
        case name
        case image
    }
}

public struct PushCallData: Codable {
    public let callId: Int
    public let callComponentId: Int?
    public let role: Int?
    public let displayName: String
    public let primaryProductInfo: String?
    public let artifact: String?
    public let productId: String?
    public let productName: String?
    public let productImage: String?
    public let product: Product?
    public let timeout: Int?
    public let start: Int?
    public let type: String?

    enum CodingKeys: String, CodingKey {
        case callId = "call_id"
        case callComponentId = "component_id"
        case role
        case displayName = "name"
        case primaryProductInfo = "primary_product_info"
        case artifact
        case productId = "product_id"
        case productName = "product_name"
        case productImage = "product_image"
        case product
        case timeout
        case start
        case type
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        // Handle callId as both Int and String
        if let intValue = try? container.decode(Int.self, forKey: .callId) {
            callId = intValue
        } else if let strValue = try? container.decode(String.self, forKey: .callId), let intValue = Int(strValue) {
            callId = intValue
        } else {
            // Fallback or throw if call_id is missing/invalid
            callId = try container.decode(Int.self, forKey: .callId)
        }

        callComponentId = try container.decodeIfPresent(Int.self, forKey: .callComponentId)
        role = try container.decodeIfPresent(Int.self, forKey: .role)
        displayName = try container.decode(String.self, forKey: .displayName)
        primaryProductInfo = try container.decodeIfPresent(String.self, forKey: .primaryProductInfo)
        artifact = try container.decodeIfPresent(String.self, forKey: .artifact)
        productId = try container.decodeIfPresent(String.self, forKey: .productId)
        productName = try container.decodeIfPresent(String.self, forKey: .productName)
        productImage = try container.decodeIfPresent(String.self, forKey: .productImage)
        product = try container.decodeIfPresent(Product.self, forKey: .product)
        type = try container.decodeIfPresent(String.self, forKey: .type)

        // Handle timeout as both Int and String
        if let intValue = try? container.decodeIfPresent(Int.self, forKey: .timeout) {
            timeout = intValue
        } else if let strValue = try? container.decodeIfPresent(String.self, forKey: .timeout) {
            timeout = Int(strValue)
        } else {
            timeout = nil
        }

        // Server sends `start` as a string — handle both Int and String
        if let intValue = try? container.decodeIfPresent(Int.self, forKey: .start) {
            start = intValue
        } else if let strValue = try? container.decodeIfPresent(String.self, forKey: .start) {
            start = Int(strValue)
        } else {
            start = nil
        }
    }
}

// MARK: - PopinCallManager

public class PopinCallManager {
    public static let shared = PopinCallManager()
    
    public var callData: PushCallData?
    public var callUUID: UUID?
    private var timeoutTimer: Timer?
    
    private init() {}
    
    public func handleIncomingPush(payload: [AnyHashable: Any], completion: @escaping () -> Void) {
        // PushKit REQUIRES reporting an incoming call for every VoIP push.
        // We MUST call reportIncomingCall before completion(), otherwise iOS kills the app.

        let uuid = UUID()
        self.callUUID = uuid

        // Attempt to decode the payload into PushCallData
        do {
            let data = try JSONSerialization.data(withJSONObject: payload, options: [])
            let decoder = JSONDecoder()
            self.callData = try decoder.decode(PushCallData.self, from: data)
            PopinLogger.shared.log("PopinCallManager: Decoded push data: \(self.callData!)")
        } catch {
            PopinLogger.shared.log("PopinCallManager: Failed to decode push data: \(error)")
            self.callData = nil
        }

        let handle = self.callData?.displayName ?? "Incoming Call"
        let user = Utilities.shared.getUser()
        let isValidCall = self.callData != nil && user != nil
        
        if !isValidCall {
            PopinLogger.shared.log("PopinCallManager: Invalid call. Data present: \(self.callData != nil), User present: \(user != nil)")
        }

        // Always report to CallKit (mandatory for PushKit)
        CallManager.shared.reportIncomingCall(uuid: uuid, handle: handle) { [weak self] error in
            if let error = error {
                PopinLogger.shared.log("PopinCallManager: reportIncomingCall error: \(error.localizedDescription)")
            }
            
            if error == nil && isValidCall {
                // Present the incoming call UI (NotConnectedView)
                DispatchQueue.main.async {
                    Popin.shared?.presentIncomingCallUI()
                    
                    // Start timeout timer if specified
                    if let timeout = self?.callData?.timeout, timeout > 0 {
                        self?.timeoutTimer?.invalidate()
                        self?.timeoutTimer = Timer.scheduledTimer(withTimeInterval: TimeInterval(timeout), repeats: false) { _ in
                            if CallManager.shared.currentCallUUID == uuid {
                                PopinLogger.shared.log("PopinCallManager: Call timed out after \(timeout) seconds")
                                CallManager.shared.endCall()
                            }
                        }
                    }
                }
            } else if error == nil {
                // Invalid call data or user not logged in — end the call immediately
                CallManager.shared.endCall()
            }
            completion()
        }
    }
    
    public func clearCallState() {
        self.callData = nil
        self.callUUID = nil
        self.timeoutTimer?.invalidate()
        self.timeoutTimer = nil
    }
    
    public func callAnswered() {
        self.timeoutTimer?.invalidate()
        self.timeoutTimer = nil
    }
    
    public func stopStatusChecking() {
    }
    
    public func enterPiPMode() {
    }
    
    public func exitPiPMode() {
    }
}
#endif
