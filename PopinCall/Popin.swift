//
//  Popin.swift
//  PopinCall
//
//  Created by Ashwin Nath on 15/11/22.
//

import Foundation
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

    private weak var eventsListener: PopinEventsListener?
    private var config: PopinConfig

    private let popinPresenter = PopinPresenter(popinInteractor: PopinInteractor())
    private let popinPusher = PopinPusher()

    private var callStarted: Bool = false
    private var pusherConnected: Bool = false
    private var sellerToken: Int = 0
    private var waitHandler: CallAcceptanceWaitHandler?

    #if canImport(UIKit)
    private weak var currentCallViewController: PopinCallViewController?
    #endif

    // MARK: - Initialization (matches Android Popin.init)

    @discardableResult
    public static func initialize(token: Int, config: PopinConfig) -> Popin {
        if let existing = shared {
            existing.config = config
            if !existing.config.persistenceMode {
                let newInstance = Popin(token: token, config: config)
                shared = newInstance
                newInstance.setup()
            } else {
                config.initListener?.onInitComplete()
            }
        } else {
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
        if !config.persistenceMode {
            // Non-persistence mode: clear saved session and always re-register
            Utilities.shared.saveUser(user: nil)
        }

        if !popinPresenter.isUserRegistered() {
            popinPresenter.registerUser(seller_id: sellerToken, name: config.userName, contactInfo: config.contactInfo, campaign: config.meta, onSucess: { [self] in
                self.connectPusher(seller_id: sellerToken)
            })
        } else {
            connectPusher(seller_id: sellerToken)
        }
    }

    // MARK: - Public API (matches Android Popin methods)

    public func getConfig() -> PopinConfig {
        return config
    }

    public func startCall() {
        print("START_CALLL")
        self.eventsListener = config.eventsListener
        callStarted = true

        if Utilities.shared.isConnected() {
            self.eventsListener?.onCallStart()
            return
        }

        if !pusherConnected {
            print("Pusher not connected yet, waiting...")
            return
        }

        popinPresenter.startConnection(seller_id: sellerToken, onSuccess: { [weak self] callQueueId in
            print("Connection started, call_queue_id=\(callQueueId)")
            self?.eventsListener?.onCallStart()

            // Present call UI immediately with "Connecting..." state
            DispatchQueue.main.async {
                self?.presentOutgoingCallViewController(callQueueId: callQueueId)
            }

            self?.startWaitingForAcceptance(callQueueId: callQueueId)
        }, onFailure: { [weak self] in
            print("Connection failed")
            self?.eventsListener?.onCallFailed()
        })
    }

    public func cancelCall() {
        waitHandler?.stopWaitingForAcceptance()
        waitHandler = nil

        #if canImport(UIKit)
        currentCallViewController = nil
        #endif
    }

    // MARK: - Legacy convenience (init + startCall in one step)

    public func connect(token: Int, popinDelegate: PopinEventsListener) {
        self.eventsListener = popinDelegate
        self.sellerToken = token
        Utilities.shared.saveSeller(seller_id: token)

        if !popinPresenter.isUserRegistered() {
            popinPresenter.registerUser(seller_id: token, name: config.userName, contactInfo: config.contactInfo, campaign: config.meta, onSucess: {
                self.connectPusher(seller_id: token)
            })
        } else {
            self.connectPusher(seller_id: token)
        }
    }

    // MARK: - Internal

    func connectPusher(seller_id: Int) {
        callStarted = true
        sellerToken = seller_id
        popinPusher.delegate = self
        popinPusher.connect()
    }

    func onPusherConnected() {
        print("PUSHER CONNECTED")
        pusherConnected = true

        // Notify init listener that initialization is complete
        config.initListener?.onInitComplete()
    }

    private func startWaitingForAcceptance(callQueueId: Int) {
        waitHandler?.stopWaitingForAcceptance()
        waitHandler = CallAcceptanceWaitHandler(callQueueId: callQueueId, listener: self)
        waitHandler?.startWaitingForAcceptance()
    }

    // MARK: - CallAcceptanceListener

    func onQueuePositionChange(position: Int) {
        print("Queue position changed: \(position)")
        self.eventsListener?.onQueuePositionChanged(position: position)

        #if canImport(UIKit)
        DispatchQueue.main.async { [weak self] in
            self?.currentCallViewController?.updateQueuePosition(position)
        }
        #endif
    }

    func onCallAccepted(callId: Int) {
        print("Call accepted: \(callId)")
        waitHandler = nil
        connectToCall(callId: callId)
    }

    private func connectToCall(callId: Int) {
        popinPresenter.getCallDetails(callId: callId, onSuccess: { [weak self] talkModel in
            print("Call details received: token=\(talkModel.token ?? "nil"), websocket=\(talkModel.websocket ?? "nil")")
            self?.eventsListener?.onCallConnected()
            DispatchQueue.main.async {
                #if canImport(UIKit)
                // If we already have a call VC (outgoing call), just load the call data
                if let existingVC = self?.currentCallViewController {
                    existingVC.loadCall(call: talkModel)
                } else {
                    // For incoming calls or fallback, present a new VC
                    self?.presentCallViewController(talkModel: talkModel)
                }
                #endif
            }
        }, onFailure: { [weak self] in
            print("Failed to get call details")
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
        let callVC = PopinCallViewController()
        self.currentCallViewController = callVC
        callVC.modalPresentationStyle = .overFullScreen
        callVC.popinConfig = config
        callVC.callQueueId = callQueueId
        callVC.isOutgoingCall = true
        callVC.onCallEnd = { [weak self] in
            self?.eventsListener?.onCallEnd()
        }

        guard let topVC = Self.topViewController() else {
            print("No top view controller found to present call")
            return
        }

        topVC.present(callVC, animated: true)
    }

    /// Present call view controller for incoming calls (legacy flow)
    private func presentCallViewController(talkModel: TalkModel) {
        let callVC = PopinCallViewController()
        self.currentCallViewController = callVC
        callVC.modalPresentationStyle = .overFullScreen
        callVC.popinConfig = config
        callVC.onCallEnd = { [weak self] in
            self?.eventsListener?.onCallEnd()
        }

        guard let topVC = Self.topViewController() else {
            print("No top view controller found to present call")
            return
        }

        topVC.present(callVC, animated: true) {
            callVC.loadCall(call: talkModel)
        }
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
        print("UIKit not available - cannot present call view controller")
    }
    #endif

    func onCallMissed() {
        print("Call missed")
        waitHandler = nil
        self.eventsListener?.onCallMissed()

        #if canImport(UIKit)
        DispatchQueue.main.async { [weak self] in
            self?.currentCallViewController?.handleCallMissed()
            self?.currentCallViewController = nil
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
        #if canImport(UIKit)
        DispatchQueue.main.async {
             self.currentCallViewController?.handleRemoteCancel()
        }
        #endif
        self.eventsListener?.onCallEnd()
    }

    func onCallFail() {
        self.eventsListener?.onCallNetworkFailure()
    }
}
