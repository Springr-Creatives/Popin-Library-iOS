//
//  Popin.swift
//  PopinCall
//
//  Created by Ashwin Nath on 15/11/22.
//

import Foundation
import AVFoundation
#if canImport(UIKit)
import UIKit
#endif


let sandboxServerURL = "https://widget01.popin-sandbox.com/api/v1"
let productionServerURL = "https://widget01.popin.to/api/v1"

var serverURL: String {
    Popin.shared?.getConfig().sandboxMode == true ? sandboxServerURL : productionServerURL
}

public class Popin : PopinPusherDelegate, CallAcceptanceListener {

    public private(set) static var shared: Popin?

    /// SDK version
    public static let sdkVersion = "1.0.40"

    /// Minimum iOS version required for SDK functionality
    public static let minimumIOSVersion = 17

    /// Returns true if the current iOS version meets the minimum requirement
    public static var isSupported: Bool {
        if #available(iOS 17.0, *) {
            return true
        }
        return false
    }

    private weak var eventsListener: PopinEventsListener?
    private var config: PopinConfig

    private let popinPresenter = PopinPresenter(popinInteractor: PopinInteractor())
    private let popinPusher = PopinPusher()

    private var callStarted: Bool = false
    private var pusherConnected: Bool = false
    private var sellerToken: Int = 0
    private var waitHandler: CallAcceptanceWaitHandler?

    /// Tracks camera permission result from pre-call check; applied to VC's viewModel
    private var preCallCameraGranted: Bool = true

    #if canImport(UIKit)
    private weak var currentCallViewController: PopinCallViewController?
    /// Strong reference to keep the call VC alive until it's successfully presented
    private var pendingCallViewController: PopinCallViewController?
    #endif

    // MARK: - Initialization (matches Android Popin.init)

    @discardableResult
    public static func initialize(token: Int, config: PopinConfig) -> Popin {
        PopinLogger.shared.log("Popin.initialize() called, token=\(token), isSupported=\(isSupported)")

        // Check iOS version requirement
        guard isSupported else {
            PopinLogger.shared.log("Popin.initialize() FAILED - iOS version not supported")
            config.initListener?.onInitFailed(reason: "PopinCall SDK requires iOS \(minimumIOSVersion) or later.")
            // Return a non-functional instance
            let instance = Popin(token: token, config: config)
            shared = instance
            return instance
        }

        if let existing = shared {
            PopinLogger.shared.log("Popin.initialize() existing instance found, persistenceMode=\(existing.config.persistenceMode)")
            existing.config = config
            if !existing.config.persistenceMode {
                let newInstance = Popin(token: token, config: config)
                shared = newInstance
                newInstance.setup()
            } else {
                config.initListener?.onInitComplete(userId: Utilities.shared.getUser()?.user_id ?? 0)
            }
        } else {
            PopinLogger.shared.log("Popin.initialize() creating new instance")
            let newInstance = Popin(token: token, config: config)
            shared = newInstance
            newInstance.setup()
        }
        return shared!
    }

    @discardableResult
    public static func initialize(token: Int) -> Popin {
        return initialize(token: token, config: PopinConfig.Builder().build())
    }

    private init(token: Int, config: PopinConfig) {
        self.config = config
        self.sellerToken = token
        Utilities.shared.saveSeller(seller_id: token)
    }

    private func setup() {
        PopinLogger.shared.log("setup() START - debugMode=\(config.enableDebugMode), persistenceMode=\(config.persistenceMode)")
        PopinLogger.shared.isEnabled = config.enableDebugMode

        // Initialize CallManager for CallKit; only register VoIP pushes if incoming calls are enabled
        #if canImport(UIKit)
        _ = CallManager.shared
        if config.enableIncomingCalls {
            CallManager.shared.registerForVoIPPushes()
            PopinLogger.shared.log("setup() VoIP pushes registered, voipToken=\(CallManager.shared.voipToken ?? "nil")")
        } else {
            PopinLogger.shared.log("setup() Incoming calls disabled, skipping VoIP push registration")
        }
        #endif

        if !config.persistenceMode {
            // Non-persistence mode: clear saved session and always re-register
            Utilities.shared.saveUser(user: nil)
        }

        let savedPushToken = Utilities.shared.getPushToken()
        PopinLogger.shared.log("setup() savedPushToken=\(savedPushToken.isEmpty ? "empty" : savedPushToken)")
        PopinLogger.shared.log("setup() isUserRegistered=\(popinPresenter.isUserRegistered())")

        if !popinPresenter.isUserRegistered() {
            PopinLogger.shared.log("setup() registering user...")
            popinPresenter.registerUser(seller_id: sellerToken, name: config.userName, contactInfo: config.contactInfo, campaign: getEnhancedMeta(), onSucess: { [self] userId in
                PopinLogger.shared.log("setup() registerUser SUCCESS, userId=\(userId)")
                // Send saved push token now that user is registered
                let token = Utilities.shared.getPushToken()
                if !token.isEmpty {
                    PopinLogger.shared.log("setup() sending saved push token to server after registration")
                    Utilities.shared.sendPushToken(token: token)
                }
                self.config.initListener?.onInitComplete(userId: userId)
            }, onFailure: { [weak self] reason in
                PopinLogger.shared.log("setup() registerUser FAILED: \(reason)")
                self?.config.initListener?.onInitFailed(reason: reason)
            })
        } else {
            PopinLogger.shared.log("setup() user already registered")
            config.initListener?.onInitComplete(userId: Utilities.shared.getUser()?.user_id ?? 0)
        }
    }

    // MARK: - Incoming Calls (PushKit)

    /// Register for VoIP pushes early, before `initialize()` is called.
    /// Call this in `application(_:didFinishLaunchingWithOptions:)` to ensure
    /// PushKit is ready to receive tokens and incoming pushes on cold launch.
    /// Safe to call multiple times — subsequent calls are no-ops.
    public static func registerForVoIPPushes() {
        PopinLogger.shared.log("registerForVoIPPushes called, initializing CallManager for PushKit")
        #if canImport(UIKit)
        CallManager.shared.registerForVoIPPushes()
        PopinLogger.shared.log("CallManager initialized, PushKit registry active")
        #endif
    }

    // MARK: - Public API

    public func getConfig() -> PopinConfig {
        return config
    }

    public func setGroup(identifier: String, onSuccess: @escaping () -> Void, onFailure: @escaping (String) -> Void) {
        guard popinPresenter.isUserRegistered() else {
            onFailure("Not initialised yet")
            return
        }
        popinPresenter.setGroup(identifier: identifier, onSuccess: onSuccess, onFailure: onFailure)
    }

    public func startCall() {
        guard Self.isSupported else {
            config.eventsListener?.onCallFailed()
            return
        }

        PopinLogger.shared.log("startCall() called, callStarted=\(callStarted), pusherConnected=\(pusherConnected), isConnected=\(Utilities.shared.isConnected())")

        self.eventsListener = config.eventsListener
        callStarted = true

        // Connect Pusher if not already connected
        if !pusherConnected {
            connectPusher(seller_id: sellerToken)
        }

        requestPermissionsAndStartCall()
    }

    private func requestPermissionsAndStartCall() {
        AVCaptureDevice.requestAccess(for: .audio) { [weak self] micGranted in
            guard let self = self else { return }

            if !micGranted {
                PopinLogger.shared.log("requestPermissions: Microphone denied, aborting call")
                DispatchQueue.main.async {
                    self.eventsListener?.onCallFailed()
                }
                return
            }

            AVCaptureDevice.requestAccess(for: .video) { [weak self] cameraGranted in
                guard let self = self else { return }
                PopinLogger.shared.log("requestPermissions: mic=granted, camera=\(cameraGranted)")

                self.preCallCameraGranted = cameraGranted

                DispatchQueue.main.async {
                    self.initiateCall()
                }
            }
        }
    }

    private func initiateCall() {
        PopinLogger.shared.log("initiateCall() - starting connection API call")
        popinPresenter.startConnection(seller_id: sellerToken, campaign: getEnhancedMeta(), onSuccess: { [weak self] callQueueId in
            PopinLogger.shared.log("initiateCall() - API success, callQueueId=\(callQueueId)")
            self?.eventsListener?.onCallStart()

            // Present call UI immediately with "Connecting..." state
            DispatchQueue.main.async {
                self?.presentOutgoingCallViewController(callQueueId: callQueueId)
            }

            self?.startWaitingForAcceptance(callQueueId: callQueueId)
        }, onFailure: { [weak self] in
            PopinLogger.shared.log("initiateCall() - API failed")
            self?.eventsListener?.onCallFailed()
        })
    }

    public func cancelCall() {
        PopinLogger.shared.log("cancelCall()")
        waitHandler?.stopWaitingForAcceptance()
        waitHandler = nil

        #if canImport(UIKit)
        currentCallViewController = nil
        pendingCallViewController = nil
        #endif
    }

    // MARK: - Legacy convenience (init + startCall in one step)

    public func connect(token: Int, popinDelegate: PopinEventsListener) {
        guard Self.isSupported else {
            popinDelegate.onCallFailed()
            return
        }

        self.eventsListener = popinDelegate
        self.sellerToken = token
        self.callStarted = true
        Utilities.shared.saveSeller(seller_id: token)

        if !popinPresenter.isUserRegistered() {
            popinPresenter.registerUser(seller_id: token, name: config.userName, contactInfo: config.contactInfo, campaign: getEnhancedMeta(), onSucess: { _ in
                self.connectPusher(seller_id: token)
                self.requestPermissionsAndStartCall()
            }, onFailure: { reason in
                self.eventsListener?.onCallFailed()
                self.config.initListener?.onInitFailed(reason: reason)
            })
        } else {
            self.connectPusher(seller_id: token)
            self.requestPermissionsAndStartCall()
        }
    }

    // MARK: - Internal

    private func getEnhancedMeta() -> [String: String] {
        var meta = config.meta
        
        if let callerId = config.callerId, !callerId.isEmpty {
            meta["callerId"] = callerId
        }
        
        if let product = config.product {
            var productMap: [String: String] = [:]
            if let id = product.id { productMap["id"] = id }
            if let url = product.url { productMap["url"] = url }
            if let image = product.image { productMap["image"] = image }
            if let name = product.name { productMap["name"] = name }
            if let description = product.description { productMap["description"] = description }
            if let extra = product.extra { productMap["registrationNumber"] = extra }
            
            if let jsonData = try? JSONSerialization.data(withJSONObject: productMap, options: []),
               let jsonString = String(data: jsonData, encoding: .utf8) {
                meta["product"] = jsonString
            }
        }
        
        return meta
    }

    private func connectPusher(seller_id: Int) {
        sellerToken = seller_id
        popinPusher.delegate = self
        popinPusher.connect()
    }

    func onPusherConnected() {
        pusherConnected = true
    }

    private func startWaitingForAcceptance(callQueueId: Int) {
        waitHandler?.stopWaitingForAcceptance()
        waitHandler = CallAcceptanceWaitHandler(callQueueId: callQueueId, listener: self)
        waitHandler?.startWaitingForAcceptance()
    }

    // MARK: - CallAcceptanceListener

    func onQueuePositionChange(position: Int) {
        self.eventsListener?.onQueuePositionChanged(position: position)

        #if canImport(UIKit)
        DispatchQueue.main.async { [weak self] in
            self?.currentCallViewController?.updateQueuePosition(position)
        }
        #endif
    }

    func onCallAccepted(callId: Int) {
        PopinLogger.shared.log("onCallAccepted: callId=\(callId), currentCallVC=\(currentCallViewController != nil ? "exists" : "nil")")
        waitHandler = nil
        connectToCall(callId: callId)
    }

    private func connectToCall(callId: Int) {
        PopinLogger.shared.log("connectToCall: callId=\(callId)")
        popinPresenter.getCallDetails(callId: callId, onSuccess: { [weak self] talkModel in
            PopinLogger.shared.log("connectToCall: Got call details, currentCallVC=\(self?.currentCallViewController != nil ? "exists" : "nil")")
            self?.eventsListener?.onCallConnected()
            DispatchQueue.main.async {
                #if canImport(UIKit)
                // If we already have a call VC (outgoing call), just load the call data
                if let existingVC = self?.currentCallViewController {
                    PopinLogger.shared.log("connectToCall: Loading call into existing VC")
                    existingVC.loadCall(call: talkModel)
                } else {
                    // For incoming calls or fallback, present a new VC
                    PopinLogger.shared.log("connectToCall: No existing VC, presenting new one")
                    self?.presentCallViewController(talkModel: talkModel)
                }
                #endif
            }
        }, onFailure: { [weak self] in
            PopinLogger.shared.log("connectToCall: Failed to get call details")
            self?.eventsListener?.onCallFailed()
            #if canImport(UIKit)
            DispatchQueue.main.async {
                self?.currentCallViewController?.closeCall(message: "Failed to connect to call")
            }
            #endif
        })
    }

    #if canImport(UIKit)
    /// Present call view controller for outgoing calls (with "Connecting..." state)
    private func presentOutgoingCallViewController(callQueueId: Int) {
        PopinLogger.shared.log("presentOutgoingCallViewController: queueId=\(callQueueId)")
        let callVC = PopinCallViewController()
        callVC.initialCameraPermissionGranted = preCallCameraGranted
        self.currentCallViewController = callVC
        self.pendingCallViewController = callVC  // Strong ref to prevent deallocation
        callVC.modalPresentationStyle = .overFullScreen
        callVC.popinConfig = config
        callVC.callQueueId = callQueueId
        callVC.isOutgoingCall = true
        callVC.onCallEnd = { [weak self] in
            PopinLogger.shared.log("onCallEnd callback fired (outgoing)")
            self?.cleanupAfterCallEnd()
        }

        presentCallVCFromRoot(callVC)
    }

    /// Present the incoming call UI (NotConnectedView) when a VoIP push is received
    func presentIncomingCallUI() {
        guard let pushData = PopinCallManager.shared.callData,
              let callUUID = PopinCallManager.shared.callUUID else { return }

        // Don't present if already showing a call
        guard currentCallViewController == nil else { return }

        let callVC = PopinCallViewController()
        callVC.pushCallData = pushData
        callVC.callUUID = callUUID
        callVC.modalPresentationStyle = .overFullScreen
        callVC.popinConfig = config
        callVC.isOutgoingCall = false
        callVC.onCallEnd = { [weak self] in
            self?.cleanupAfterCallEnd()
        }

        self.currentCallViewController = callVC
        self.pendingCallViewController = callVC

        presentCallVCFromRoot(callVC)
    }

    /// Called when an incoming call is answered (via CallKit native UI or NotConnectedView Accept button)
    func onIncomingCallAnswered() {
        guard let callData = PopinCallManager.shared.callData else {
            PopinLogger.shared.log("onIncomingCallAnswered: No callData found, cannot connect.")
            return
        }

        PopinLogger.shared.log("onIncomingCallAnswered: callId=\(callData.callId)")
        self.eventsListener = config.eventsListener

        // Notify PopinCallManager immediately to stop timers
        PopinCallManager.shared.callAnswered()

        // If VC not yet presented (background answer), present it now
        if currentCallViewController == nil {
            presentIncomingCallUI()
        }

        // Mark call as accepted in the VC
        currentCallViewController?.handleCallKitAnswerCall()

        // Notify server that the call was accepted
        let presenter = VideoCallPresenter(videoCallInteractor: VideoCallInteractor())
        presenter.acceptCall(callId: callData.callId)

        // Connect pusher if not already
        if !pusherConnected {
            connectPusher(seller_id: sellerToken)
        }

        // Request permissions before connecting
        requestPermissionsAndConnectIncoming(callId: callData.callId)
    }

    private func requestPermissionsAndConnectIncoming(callId: Int) {
        AVCaptureDevice.requestAccess(for: .audio) { [weak self] micGranted in
            guard let self = self else { return }

            if !micGranted {
                PopinLogger.shared.log("requestPermissionsIncoming: Microphone denied, ending call")
                DispatchQueue.main.async {
                    CallManager.shared.endCall()
                    self.currentCallViewController?.closeCall(message: "Microphone access is required for calls. Please enable it in Settings.")
                }
                return
            }

            AVCaptureDevice.requestAccess(for: .video) { [weak self] cameraGranted in
                guard let self = self else { return }
                PopinLogger.shared.log("requestPermissionsIncoming: mic=granted, camera=\(cameraGranted)")

                DispatchQueue.main.async {
                    self.currentCallViewController?.updateCameraPermission(cameraGranted)
                    self.connectToCall(callId: callId)
                }
            }
        }
    }

    /// Present call view controller for incoming calls (legacy flow)
    private func presentCallViewController(talkModel: TalkModel) {
        PopinLogger.shared.log("presentCallViewController: incoming/fallback, callId=\(talkModel.id ?? -1)")
        let callVC = PopinCallViewController()
        self.currentCallViewController = callVC
        self.pendingCallViewController = callVC  // Strong ref to prevent deallocation
        callVC.modalPresentationStyle = .overFullScreen
        callVC.popinConfig = config
        callVC.onCallEnd = { [weak self] in
            PopinLogger.shared.log("onCallEnd callback fired (incoming)")
            self?.cleanupAfterCallEnd()
        }

        presentCallVCFromRoot(callVC) {
            callVC.loadCall(call: talkModel)
        }
    }

    /// Safely present a call VC from the root, dismissing any existing presented VC first
    private func presentCallVCFromRoot(_ callVC: PopinCallViewController, completion: (() -> Void)? = nil) {
        guard let rootVC = UIApplication.shared.connectedScenes
            .compactMap({ ($0 as? UIWindowScene)?.keyWindow?.rootViewController })
            .first else {
            PopinLogger.shared.log("presentCallVCFromRoot: Could not find root view controller")
            self.pendingCallViewController = nil
            return
        }

        // If there's already a presented VC (e.g. old call still dismissing), dismiss it first
        if rootVC.presentedViewController != nil {
            PopinLogger.shared.log("presentCallVCFromRoot: Existing presented VC found, dismissing first")
            rootVC.dismiss(animated: false) { [weak self] in
                PopinLogger.shared.log("presentCallVCFromRoot: Dismissed old VC, now presenting new call VC")
                rootVC.present(callVC, animated: true) {
                    self?.pendingCallViewController = nil
                    completion?()
                }
            }
        } else {
            PopinLogger.shared.log("presentCallVCFromRoot: Presenting call VC directly")
            rootVC.present(callVC, animated: true) { [weak self] in
                self?.pendingCallViewController = nil
                completion?()
            }
        }
    }

    /// Clean up state after a call ends
    private func cleanupAfterCallEnd() {
        callStarted = false
        currentCallViewController = nil
        pendingCallViewController = nil
        Utilities.shared.clearConnected()
        eventsListener?.onCallEnd()
        PopinLogger.shared.log("cleanupAfterCallEnd: State reset complete")
    }

    private static func topViewController(base: UIViewController? = nil) -> UIViewController? {
        let base = base ?? UIApplication.shared.connectedScenes
            .compactMap { ($0 as? UIWindowScene)?.keyWindow?.rootViewController }
            .first

        if let nav = base as? UINavigationController {
            return topViewController(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController, let selected = tab.selectedViewController {
            return topViewController(base: selected)
        }
        if let presented = base?.presentedViewController {
            return topViewController(base: presented)
        }
        return base
    }
    #else
    private func presentCallViewController(talkModel: TalkModel) {
    }
    #endif

    func onCallMissed() {
        PopinLogger.shared.log("onCallMissed()")
        waitHandler = nil
        self.eventsListener?.onCallMissed()

        #if canImport(UIKit)
        DispatchQueue.main.async { [weak self] in
            self?.currentCallViewController?.handleCallMissed()
            self?.currentCallViewController = nil
            self?.pendingCallViewController = nil
            Utilities.shared.clearConnected()
        }
        #endif
    }

    // MARK: - PopinPusherDelegate

    func onAgentConnected() {
        self.eventsListener?.onCallStart()
    }

    func onAllExpertsBusy() {
        self.eventsListener?.onCallCancel()
    }

    func onCallConnected() {

    }

    func onCallDisconnected() {
        PopinLogger.shared.log("onCallDisconnected() - remote cancel")
        #if canImport(UIKit)
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }

            // Ignore stale Pusher disconnect from a previous call if we're
            // currently waiting for a new outgoing call to be accepted
            if let vc = self.currentCallViewController, vc.isOutgoingCall && !vc.callConnected {
                PopinLogger.shared.log("onCallDisconnected: Ignoring stale disconnect - outgoing call not yet connected (queueId=\(vc.callQueueId ?? -1))")
                return
            }

            self.currentCallViewController?.handleRemoteCancel()
            Utilities.shared.clearConnected()
            self.eventsListener?.onCallEnd()
        }
        #endif
    }

    func onCallFail() {
        self.eventsListener?.onCallNetworkFailure()
    }
}
