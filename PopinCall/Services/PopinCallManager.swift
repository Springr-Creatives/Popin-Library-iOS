//
//  PopinCallManager.swift
//  PopinCall
//

import Foundation

#if canImport(UIKit)
import PushKit

// MARK: - PopinCallManager

/// Manages incoming push call state.
/// Communicates upward via callbacks — never references Popin.shared.
public class PopinCallManager {
    public static let shared = PopinCallManager()

    public var callData: PushCallData?
    public var callUUID: UUID?
    private var timeoutTimer: Timer?

    /// Called when an incoming call UI should be presented.
    /// Set by Popin.setup() to break the circular dependency.
    var onPresentIncomingCallUI: (() -> Void)?

    private init() {}

    public func handleIncomingPush(payload: [AnyHashable: Any], completion: @escaping () -> Void) {
        // PushKit REQUIRES reporting an incoming call for every VoIP push.
        // We MUST call reportIncomingCall before completion(), otherwise iOS kills the app.

        let uuid = UUID()
        self.callUUID = uuid

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

        CallManager.shared.reportIncomingCall(uuid: uuid, handle: handle) { [weak self] error in
            if let error = error {
                PopinLogger.shared.log("PopinCallManager: reportIncomingCall error: \(error.localizedDescription)")
            }

            if error == nil && isValidCall {
                DispatchQueue.main.async {
                    // Fire upward callback instead of referencing Popin.shared directly
                    self?.onPresentIncomingCallUI?()

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

    public func stopStatusChecking() {}
    public func enterPiPMode() {}
    public func exitPiPMode() {}
}
#endif
