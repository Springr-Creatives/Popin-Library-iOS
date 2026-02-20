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

public class Popin: PopinPusherDelegate {

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

    private var pusherConnected: Bool = false
    private var sellerToken: Int = 0

    // MARK: - Domain Services

    private lazy var orchestrator = CallOrchestrator(popinPresenter: popinPresenter)
    private let permissionService = PermissionService()
    #if canImport(UIKit)
    private let uiCoordinator = CallUICoordinator()
    #endif

    // MARK: - Initialization (matches Android Popin.init)

    @discardableResult
    public static func initialize(token: Int, config: PopinConfig) -> Popin {
        PopinLogger.shared.log("Popin.initialize() called, token=\(token), isSupported=\(isSupported)")

        guard isSupported else {
            PopinLogger.shared.log("Popin.initialize() FAILED - iOS version not supported")
            config.initListener?.onInitFailed(reason: "PopinCall SDK requires iOS \(minimumIOSVersion) or later.")
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

        #if canImport(UIKit)
        _ = CallManager.shared
        if config.enableIncomingCalls {
            CallManager.shared.registerForVoIPPushes()
            PopinLogger.shared.log("setup() VoIP pushes registered, voipToken=\(CallManager.shared.voipToken ?? "nil")")
        } else {
            PopinLogger.shared.log("setup() Incoming calls disabled, skipping VoIP push registration")
        }
        wireCallbacks()
        #endif

        if !config.persistenceMode {
            Utilities.shared.saveUser(user: nil)
        }

        let savedPushToken = Utilities.shared.getPushToken()
        PopinLogger.shared.log("setup() savedPushToken=\(savedPushToken.isEmpty ? "empty" : savedPushToken)")
        PopinLogger.shared.log("setup() isUserRegistered=\(popinPresenter.isUserRegistered())")

        if !popinPresenter.isUserRegistered() {
            PopinLogger.shared.log("setup() registering user...")
            popinPresenter.registerUser(seller_id: sellerToken, name: config.userName, contactInfo: config.contactInfo, campaign: getEnhancedMeta(), onSucess: { [self] userId in
                PopinLogger.shared.log("setup() registerUser SUCCESS, userId=\(userId)")
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

    // MARK: - Callback Wiring (breaks circular dependencies)

    #if canImport(UIKit)
    private func wireCallbacks() {
        // Break circular dep: CallManager → Popin.shared
        CallManager.shared.onCallAnswered = { [weak self] in
            self?.onIncomingCallAnswered()
        }

        // Break circular dep: PopinCallManager → Popin.shared
        PopinCallManager.shared.onPresentIncomingCallUI = { [weak self] in
            guard let self = self else { return }
            PopinLogger.shared.log("Popin.onPresentIncomingCallUI: hideFlipCameraButton=\(self.config.hideFlipCameraButton)")
            self.uiCoordinator.presentIncomingCallUI(config: self.config)
        }

        // Orchestrator → events listener
        orchestrator.onCallStart = { [weak self] in self?.eventsListener?.onCallStart() }
        orchestrator.onCallConnected = { [weak self] in self?.eventsListener?.onCallConnected() }
        orchestrator.onCallFailed = { [weak self] in self?.eventsListener?.onCallFailed() }
        orchestrator.onCallWasMissed = { [weak self] in self?.eventsListener?.onCallMissed() }
        orchestrator.onQueuePositionDidChange = { [weak self] pos in
            self?.eventsListener?.onQueuePositionChanged(position: pos)
        }

        // Orchestrator → UI coordinator
        orchestrator.onPresentOutgoingVC = { [weak self] in
            guard let self = self else { return }
            self.uiCoordinator.presentOutgoingCallVC(config: self.config)
        }
        orchestrator.onUpdateCallQueueId = { [weak self] queueId in
            self?.uiCoordinator.updateCallQueueId(queueId)
        }
        orchestrator.onLoadCallInExistingVC = { [weak self] talkModel in
            self?.uiCoordinator.loadCallInCurrentVC(talkModel)
        }
        orchestrator.onPresentNewCallVC = { [weak self] talkModel in
            guard let self = self else { return }
            self.uiCoordinator.presentCallVC(talkModel: talkModel, config: self.config)
        }
        orchestrator.onCloseCurrentVC = { [weak self] message in
            self?.uiCoordinator.closeCurrentVC(message: message)
        }
        orchestrator.onUpdateQueuePosition = { [weak self] pos in
            self?.uiCoordinator.updateQueuePosition(pos)
        }
        orchestrator.onCallMissedInVC = { [weak self] in
            self?.uiCoordinator.handleCallMissed()
        }
        orchestrator.currentCallVCExists = { [weak self] in
            self?.uiCoordinator.hasActiveVC() ?? false
        }

        // UI coordinator → events listener
        uiCoordinator.onCallEnd = { [weak self] in
            self?.orchestrator.cleanUp()
            self?.eventsListener?.onCallEnd()
            PopinLogger.shared.log("Popin: call ended, state reset")
        }
        uiCoordinator.onNetworkFailure = { [weak self] participant in
            PopinLogger.shared.log("Popin: onNetworkFailure — notifying eventsListener (participant=\(participant))")
            self?.eventsListener?.onCallNetworkFailure(participant: participant)
        }
        uiCoordinator.onCallAbandoned = { [weak self] in
            self?.eventsListener?.onCallAbandoned()
        }
        uiCoordinator.onCallCancelled = { [weak self] _ in
            self?.orchestrator.cancelCall()
        }
    }
    #endif

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

    /// Logs out the current user: calls POST /v1/user/logout, clears all stored data, and destroys the SDK instance.
    public static func deinitialize() {
        guard let instance = shared else {
            PopinLogger.shared.log("Popin.deinitialize() called but no instance exists")
            return
        }

        PopinLogger.shared.log("Popin.deinitialize() start")
        let logoutURL = serverURL + "/user/logout"
        instance.popinPresenter.logout(url: logoutURL)
        shared = nil
        PopinLogger.shared.log("Popin.deinitialize() complete, SDK instance destroyed")
    }

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

        PopinLogger.shared.log("startCall() called, pusherConnected=\(pusherConnected)")
        self.eventsListener = config.eventsListener

        if !pusherConnected {
            connectPusher(seller_id: sellerToken)
        }

        #if canImport(UIKit)
        permissionService.requestForOutgoingCall(
            audioOnly: config.audioOnlyMode,
            onGranted: { [weak self] in
                guard let self = self else { return }
                self.eventsListener?.onPermissionGiven()
                self.orchestrator.startCall(sellerToken: self.sellerToken, meta: self.getEnhancedMeta())
            },
            onDenied: { [weak self] in
                self?.eventsListener?.onPermissionDenied()
            }
        )
        #endif
    }

    public func cancelCall() {
        PopinLogger.shared.log("cancelCall()")
        orchestrator.cancelCall()
        #if canImport(UIKit)
        uiCoordinator.cancelPendingVC()
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
        Utilities.shared.saveSeller(seller_id: token)

        if !popinPresenter.isUserRegistered() {
            popinPresenter.registerUser(seller_id: token, name: config.userName, contactInfo: config.contactInfo, campaign: getEnhancedMeta(), onSucess: { [weak self] _ in
                guard let self = self else { return }
                self.connectPusher(seller_id: token)
                self.permissionService.requestForOutgoingCall(
                    audioOnly: self.config.audioOnlyMode,
                    onGranted: { [weak self] in
                        guard let self = self else { return }
                        self.eventsListener?.onPermissionGiven()
                        self.orchestrator.startCall(sellerToken: self.sellerToken, meta: self.getEnhancedMeta())
                    },
                    onDenied: { [weak self] in
                        self?.eventsListener?.onPermissionDenied()
                    }
                )
            }, onFailure: { [weak self] reason in
                self?.eventsListener?.onCallFailed()
                self?.config.initListener?.onInitFailed(reason: reason)
            })
        } else {
            connectPusher(seller_id: token)
            permissionService.requestForOutgoingCall(
                audioOnly: config.audioOnlyMode,
                onGranted: { [weak self] in
                    guard let self = self else { return }
                    self.eventsListener?.onPermissionGiven()
                    self.orchestrator.startCall(sellerToken: self.sellerToken, meta: self.getEnhancedMeta())
                },
                onDenied: { [weak self] in
                    self?.eventsListener?.onPermissionDenied()
                }
            )
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

    // MARK: - Incoming Call Handling (called via CallManager.onCallAnswered callback)

    #if canImport(UIKit)
    private func onIncomingCallAnswered() {
        guard let callData = PopinCallManager.shared.callData else {
            PopinLogger.shared.log("onIncomingCallAnswered: No callData found, cannot connect.")
            return
        }

        PopinLogger.shared.log("onIncomingCallAnswered: callId=\(callData.callId), hideFlipCameraButton=\(config.hideFlipCameraButton), hasActiveVC=\(uiCoordinator.hasActiveVC())")
        self.eventsListener = config.eventsListener

        PopinCallManager.shared.callAnswered()

        if !uiCoordinator.hasActiveVC() {
            PopinLogger.shared.log("onIncomingCallAnswered: No active VC — presenting incoming call UI")
            uiCoordinator.presentIncomingCallUI(config: config)
        }

        uiCoordinator.handleCallKitAnswer()

        let presenter = VideoCallPresenter(videoCallInteractor: VideoCallInteractor())
        presenter.acceptCall(callId: callData.callId)

        if !pusherConnected {
            connectPusher(seller_id: sellerToken)
        }

        permissionService.requestForIncomingCall(
            audioOnly: config.audioOnlyMode,
            onGranted: { [weak self] in
                self?.eventsListener?.onPermissionGiven()
                self?.orchestrator.connectToCall(callId: callData.callId)
            },
            onDenied: { [weak self] message in
                self?.eventsListener?.onPermissionDenied()
                DispatchQueue.main.async {
                    CallManager.shared.endCall()
                    self?.uiCoordinator.closeCurrentVC(message: message)
                }
            }
        )
    }
    #endif

    // MARK: - PopinPusherDelegate

    func onAgentConnected() {
        self.eventsListener?.onCallStart()
    }

    func onAllExpertsBusy() {
        self.eventsListener?.onCallMissed()
    }

    func onCallConnected() {}

    func onCallDisconnected() {
        PopinLogger.shared.log("onCallDisconnected() - remote cancel")
        #if canImport(UIKit)
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }

            guard self.uiCoordinator.hasActiveVC() else {
                PopinLogger.shared.log("onCallDisconnected: No active VC, ignoring stale event")
                return
            }

            if self.uiCoordinator.currentVCIsOutgoingAndNotConnected() {
                PopinLogger.shared.log("onCallDisconnected: Ignoring stale disconnect - outgoing call not yet connected")
                return
            }

            self.uiCoordinator.handleRemoteCancel()
        }
        #endif
    }

    func onCallFail() {
        self.eventsListener?.onCallNetworkFailure(participant: "agent")
    }
}
