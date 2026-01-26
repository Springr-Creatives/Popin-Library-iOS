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

    private override init() {
        // Setup CallKit provider
        let configuration = CXProviderConfiguration(localizedName: "Popin Seller")
        configuration.supportsVideo = true
        configuration.maximumCallsPerCallGroup = 1
        configuration.maximumCallGroups = 1
        configuration.supportedHandleTypes = [.generic]
        configuration.iconTemplateImageData = UIImage(named: "AppIcon")?.pngData()
        configuration.includesCallsInRecents = false

        provider = CXProvider(configuration: configuration)

        super.init()

        // Setup delegates
        provider.setDelegate(self, queue: .main)
        callObserver.setDelegate(self, queue: nil)

        // Setup PushKit
        pushRegistry.delegate = self
        pushRegistry.desiredPushTypes = [.voIP]
    }

    // MARK: - Public Methods

    /// Report an incoming call to CallKit
    func reportIncomingCall(
        uuid: UUID,
        handle: String,
        hasVideo: Bool = true,
        completion: ((Error?) -> Void)? = nil
    ) {
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
                self?.callState = .idle
                self?.currentCallUUID = nil
            }
            completion?(error)
        }
    }

    /// Answer the current call
    func answerCall() {
        guard let uuid = currentCallUUID else {
            return
        }

        let answerAction = CXAnswerCallAction(call: uuid)
        let transaction = CXTransaction(action: answerAction)
        requestTransaction(transaction)
    }

    /// End the current call
    func endCall() {
        guard let uuid = currentCallUUID else {
            return
        }

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
        if let uuid = currentCallUUID {
            callState = .ended
            delegate?.callManager(self, didEndCall: uuid)
        }

        clearCurrentCall()
    }

    func provider(_ provider: CXProvider, perform action: CXAnswerCallAction) {
        callState = .connecting(action.callUUID)

        delegate?.callManager(self, didAnswerCall: action.callUUID)

        action.fulfill(withDateConnected: Date())
        callState = .connected(action.callUUID)
    }

    func provider(_ provider: CXProvider, perform action: CXEndCallAction) {
        callState = .ended
        
        // Explicitly disable audio session to ensure clean cleanup
        // This is important for "End & Accept" scenarios where didDeactivate might be skipped/delayed
        try? AudioManager.shared.setEngineAvailability(.none)
        
        // Attempt to deactivate the system audio session
        // Commenting out manual deactivation to prevent cutting off session during "End & Accept" transitions
        /*
        do {
            try AVAudioSession.sharedInstance().setActive(false, options: .notifyOthersOnDeactivation)
        } catch {
             print("CallManager: Failed to deactivate audio session on end: \(error)")
        }
        */

        delegate?.callManager(self, didEndCall: action.callUUID)

        action.fulfill()
        clearCurrentCall()
    }

    func provider(_ provider: CXProvider, perform action: CXSetMutedCallAction) {
        action.fulfill()
    }

    func provider(_ provider: CXProvider, perform action: CXSetHeldCallAction) {
        delegate?.callManager(self, didHoldCall: action.callUUID, isOnHold: action.isOnHold)
        action.fulfill()
    }

    func provider(_ provider: CXProvider, didActivate audioSession: AVAudioSession) {
        // Configure audio session for LiveKit video calls
        do {
            print("did_activate_audio_session")
            print("AudioSession Category: \(audioSession.category.rawValue), Mode: \(audioSession.mode.rawValue), Options: \(audioSession.categoryOptions.rawValue)")
            
            // WebRTC generally prefers 48kHz and NO mixWithOthers for VoiceProcessingIO
            try audioSession.setPreferredSampleRate(48000.0)
            try audioSession.setCategory(.playAndRecord, mode: .videoChat, options: [.allowBluetooth, .allowBluetoothA2DP, .defaultToSpeaker, .allowAirPlay])
            // CallKit activates the session for us, but we set the category.
            
            print("AudioSession Configured - Category: \(audioSession.category.rawValue), Mode: \(audioSession.mode.rawValue), Options: \(audioSession.categoryOptions.rawValue)")

            // Enable speaker by default for video calls
            try audioSession.overrideOutputAudioPort(.speaker)
            print("AudioSession overrideOutputAudioPort(.speaker) success")

            // Activate LiveKit audio engine
            try AudioManager.shared.setEngineAvailability(.default)
            print("AudioManager engine availability set to .default")

            delegate?.callManager(self, didActivateAudioSession: audioSession)
        } catch {
            print("CallManager: Failed to activate audio session: \(error)")
        }
    }

    func provider(_ provider: CXProvider, didDeactivate audioSession: AVAudioSession) {
        print("did_deactivate_audio_session")
        // Deactivate LiveKit audio session
        do {
            try AudioManager.shared.setEngineAvailability(.none)
            print("AudioManager engine availability set to .none")
        } catch {
             print("CallManager: Failed to deactivate audio session: \(error)")
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
        guard type == .voIP else { return }

        let token = pushCredentials.token.map { String(format: "%02x", $0) }.joined()
        voipToken = token

        // Save and send token to server
        Utilities.shared.savePushToken(token: token)
        if Utilities.shared.getUser() != nil {
            Utilities.shared.sendPushToken(token: token)
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
        guard type == .voIP else { return }

        voipToken = nil
    }

    func pushRegistry(
        _ registry: PKPushRegistry,
        didReceiveIncomingPushWith payload: PKPushPayload,
        for type: PKPushType,
        completion: @escaping () -> Void
    ) {
        guard type == .voIP else {
            completion()
            return
        }

        // Ensure user is logged in
        guard Utilities.shared.getUser() != nil else {
            completion()
            return
        }

        // Configure audio session early (workaround for mic initialization issue)
        print("AVSESSION_CONFIGURE")
        do {
            let session = AVAudioSession.sharedInstance()
            try session.setCategory(.playAndRecord, mode: .videoChat, options: [.mixWithOthers, .allowBluetooth, .allowBluetoothA2DP, .defaultToSpeaker, .allowAirPlay])
            try session.overrideOutputAudioPort(.speaker)
            
        } catch {
        }

        // Forward to PopinCallManager for handling
        PopinCallManager.shared.handleIncomingPush(payload: payload.dictionaryPayload, completion: completion)
    }
}

// MARK: - CXCallObserverDelegate

extension CallManager: CXCallObserverDelegate {
    func callObserver(_ callObserver: CXCallObserver, callChanged call: CXCall) {
        guard let currentUUID = currentCallUUID else { return }
        
        // Check if this is a different call (e.g. GSM call) and if it has ended
        if call.uuid != currentUUID && call.hasEnded {
            print("CallManager: Detected other call ended, attempting to unhold current call")
            
            // Construct request to unhold the current call
            let setHeldAction = CXSetHeldCallAction(call: currentUUID, onHold: false)
            let transaction = CXTransaction(action: setHeldAction)
            
            callController.request(transaction) { error in
                if let error = error {
                    print("CallManager: Failed to unhold call: \(error.localizedDescription)")
                } else {
                    print("CallManager: Successfully requested unhold")
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
    public let callComponentId: Int
    public let role: Int
    public let displayName: String
    public let primaryProductInfo: String
    public let artifact: String?
    public let productId: String?
    public let productName: String?
    public let productImage: String?
    public let product: Product?
    public let timeout: Int?
    public let start: Int?
    
    enum CodingKeys: String, CodingKey {
        case callId = "call_id"
        case callComponentId = "component_id"
        case role
        case displayName = "display_name"
        case primaryProductInfo = "primary_product_info"
        case artifact
        case productId = "product_id"
        case productName = "product_name"
        case productImage = "product_image"
        case product
        case timeout
        case start
    }
}

// MARK: - PopinCallManager

public class PopinCallManager {
    public static let shared = PopinCallManager()
    
    public var callData: PushCallData?
    public var callUUID: UUID?
    
    private init() {}
    
    public func handleIncomingPush(payload: [AnyHashable: Any], completion: @escaping () -> Void) {
        // Attempt to decode the payload into PushCallData
        // Note: Payload structure from PushKit/APNs might differ from internal JSON.
        // We'll try to convert the dictionary to JSON data and decode it.
        
        do {
            let data = try JSONSerialization.data(withJSONObject: payload, options: [])
            let decoder = JSONDecoder()
            self.callData = try decoder.decode(PushCallData.self, from: data)
            
            // Generate a UUID for this call
            let uuid = UUID()
            self.callUUID = uuid
            
            // Report to CallManager (CallKit)
            let handle = self.callData?.displayName ?? "Incoming Call"
            CallManager.shared.reportIncomingCall(uuid: uuid, handle: handle) { error in
                if let error = error {
                    print("Error reporting incoming call: \(error)")
                }
                completion()
            }
        } catch {
            print("Failed to decode push payload: \(error)")
            // Fallback manual parsing if needed, or just fail
            completion()
        }
    }
    
    public func clearCallState() {
        self.callData = nil
        self.callUUID = nil
    }
    
    public func callAnswered() {
        print("PopinCallManager: Call answered")
    }
    
    public func stopStatusChecking() {
        print("PopinCallManager: Stop status checking")
    }
    
    public func enterPiPMode() {
        print("PopinCallManager: Enter PiP Mode")
    }
    
    public func exitPiPMode() {
        print("PopinCallManager: Exit PiP Mode")
    }
}
#endif
