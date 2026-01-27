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


let serverURL = "https://widget01.popin-sandbox.com/api/v1";

public class Popin : PopinPusherDelegate, CallAcceptanceListener {

    public static let shared = Popin()

    private var eventsListener : PopinEventsListener?

    private init() {}

    private let popinPresenter = PopinPresenter(popinInteractor: PopinInteractor())

    private let popinPusher = PopinPusher()

    private var startCall : Bool = false;

    private var sellerToken : Int = 0;

    private var waitHandler: CallAcceptanceWaitHandler?

    public func connect(token: Int, popinDelegate: PopinEventsListener) {
        self.eventsListener = popinDelegate;
        Utilities.shared.saveSeller(seller_id: token);
        if (!self.popinPresenter.isUserRegistered()) {
            popinPresenter.registerUser(seller_id: token, onSucess: {
                self.connectPusher(seller_id: token)
            })
        } else {
            self.connectPusher(seller_id: token)
        }
    }

    func connectPusher(seller_id: Int) {
        startCall = true;
        sellerToken = seller_id;
        popinPusher.delegate = self;
        popinPusher.connect()
    }

    public func cancelCall() {
        waitHandler?.stopWaitingForAcceptance()
        waitHandler = nil
    }

    public func getAvailableSchedules() {
        // TODO: Not yet implemented
    }

    public func setScheduledCall(scheduleTime: String) {
        // TODO: Not yet implemented
    }

    public func setRating(rating: Int) {
        // TODO: Not yet implemented
    }

    func onPusherConnected() {
        print("PUSHER CONNECTED");
        if (startCall && sellerToken > 0) {
            if (Utilities.shared.isConnected()) {
                print("AGENT_ALEADY CONNECTED");
                self.eventsListener?.onCallStart()
                return;
            }
            print("ATTEMPT AGENT CONNECT");
            popinPresenter.startConnection(seller_id: sellerToken, onSuccess: { [weak self] callQueueId in
                print("Connection started, call_queue_id=\(callQueueId)")
                self?.eventsListener?.onCallStart()
                self?.startWaitingForAcceptance(callQueueId: callQueueId)
            }, onFailure: { [weak self] in
                print("Connection failed")
                self?.eventsListener?.onCallFailed()
            });
        }
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
                self?.presentCallViewController(talkModel: talkModel)
            }
        }, onFailure: { [weak self] in
            print("Failed to get call details")
            self?.eventsListener?.onCallFailed()
        })
    }

    #if canImport(UIKit)
    private func presentCallViewController(talkModel: TalkModel) {
        let callVC = PopinCallViewController()
        callVC.modalPresentationStyle = .fullScreen
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
        self.eventsListener?.onCallEnd()
    }

    func onCallFail() {
        self.eventsListener?.onCallNetworkFailure()
    }
}
