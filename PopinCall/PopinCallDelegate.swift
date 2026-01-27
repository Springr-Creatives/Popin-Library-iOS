//
//  PopinCallDelegate.swift
//  PopinCall
//
//  Created by Ashwin Nath on 15/11/22.
//

import Foundation

public protocol PopinCallDelegate {
    func onConnectionEstablished();
    func onAllExpertsBusy();
    func onQueuePositionChanged(position: Int);
    func onCallAccepted(callId: Int);
    func onCallMissed();
    func onCallConnected();
    func onCallDisconnected();
    func onCallFail();
}
