//
//  VideoCallViewModel.swift
//  Popin
//
//  Created by Assistant on 10/09/25.
//

import Foundation
import Combine

final class VideoCallViewModel: ObservableObject {
    @Published var call: TalkModel?
    @Published var callAccepted: Bool = false
    @Published var isUserEndingCall: Bool = false
    @Published var isOnHold: Bool = false

    /// For outgoing calls: true when waiting for the call to be accepted
    @Published var isWaitingForAcceptance: Bool = false

    /// Queue position for outgoing calls (0 means position not yet known)
    @Published var queuePosition: Int = 0

    var onEndCall: (() -> Void)?
    var onRoomDisconnected: (() -> Void)?

    /// Called when user cancels during the "Connecting..." phase
    var onCancelCall: (() -> Void)?
}


