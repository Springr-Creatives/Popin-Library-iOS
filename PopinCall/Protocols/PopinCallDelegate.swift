//
//  PopinCallDelegate.swift
//  PopinCall
//
//  Created by Ashwin Nath on 15/11/22.
//

import Foundation

public protocol PopinEventsListener: AnyObject {
    func onPermissionGiven()
    func onPermissionDenied()
    func onCallStart()
    func onCallCancel()
    func onQueuePositionChanged(position: Int)
    func onCallMissed()
    func onCallNetworkFailure()
    func onCallConnected()
    func onCallFailed()
    func onCallEnd()
}
