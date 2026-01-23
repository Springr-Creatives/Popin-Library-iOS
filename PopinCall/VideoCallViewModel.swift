//
//  VideoCallViewModel.swift
//  Popin
//
//  Created by Assistant on 10/09/25.
//

import Foundation
import Combine

public final class VideoCallViewModel: ObservableObject {
    @Published var call: VideoCall?
    @Published var callAccepted: Bool = false
    @Published var isUserEndingCall: Bool = false
    @Published var isOnHold: Bool = false
    var onEndCall: (() -> Void)?
    var onRoomDisconnected: (() -> Void)?
    
}


