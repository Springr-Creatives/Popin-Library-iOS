//
//  VideoCallSwiftUIView.swift
//  Popin
//
//  Created by VideoCall Migration
//

import SwiftUI
#if canImport(UIKit)
import LiveKit
import LiveKitComponents
import Combine
import UIKit
import AVFAudio
import Foundation
// MARK: - SwiftUI VideoCall View

struct VideoCallSwiftUIView: View {
    @EnvironmentObject private var _room: Room
    @EnvironmentObject private var configHolder: PopinConfigHolder
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: VideoCallViewModel

    let callId: Int
    let callComponentId: Int
    let callUUID: UUID?
    let callRole: Int
    let customerName: String
    let artifact: String

    @State private var videoCallId: Int?
    @State private var videoUserId: Int?

    init(viewModel: VideoCallViewModel,
         callId: Int,
         callComponentId: Int,
         callUUID: UUID?,
         callRole: Int,
         customerName: String,
         artifact: String) {
        self.viewModel = viewModel
        self.callId = callId
        self.callComponentId = callComponentId
        self.callUUID = callUUID
        self.callRole = callRole
        self.customerName = customerName
        self.artifact = artifact
    }
    
    var body: some View {
        PopinCallStateView(callId: videoCallId, userId: videoUserId)
            .environmentObject(viewModel)
            .onReceive(viewModel.$call.compactMap { $0 }) { call in
                // Update call data for the UI
                videoCallId = call.id
                videoUserId = call.user_id

                // Configure ChatManager for this call
                if let callId = call.id {
                    ChatManager.shared.configure(callId: callId, sellerId: Utilities.shared.getSeller())
                }

                Task {
                    guard let websocket = call.websocket,
                          let token = call.access_token else { return }
                    do {
                        try await _room.connect(url: websocket, token: token)
                        try await _room.localParticipant.setMicrophone(enabled: viewModel.preCallMicEnabled)
                        let cameraEnabled = configHolder.config.audioOnlyMode ? false : viewModel.preCallCameraEnabled
                        try await _room.localParticipant.setCamera(enabled: cameraEnabled)

//                        // Enable multitasking camera access for PiP immediately after enabling camera
//                        // This must be set before the AVCaptureSession starts
//                        if let videoTrack = _room.localParticipant.firstCameraVideoTrack as? LocalVideoTrack,
//                           let cameraCapturer = videoTrack.capturer as? CameraCapturer {
//                            cameraCapturer.isMultitaskingAccessEnabled = true
//                        }
                        
                        if let localVideoTrack = _room.localParticipant.trackPublications.first(where: {
                            $0.value.kind == Track.Kind.video
                        })?.value.track as? LocalVideoTrack  {
                            
                            if let cameraCapturer = localVideoTrack.capturer as? CameraCapturer {
                                if #available(iOS 16.0, *) {
                                    if cameraCapturer.captureSession.isMultitaskingCameraAccessSupported {
                                        cameraCapturer.captureSession.beginConfiguration()
                                        cameraCapturer.captureSession.isMultitaskingCameraAccessEnabled = true
                                        cameraCapturer.captureSession.commitConfiguration()
                                    }
                                }
                            }
                        }


                        

                    } catch {
                    }
                }
            }
            .onReceive(NotificationCenter.default.publisher(for: NSNotification.Name("DataShared"))) { notification in
                guard let userInfo = notification.userInfo,
                      let data = userInfo["data"] as? [String: Any] else {
                    return
                }
                
                Task {
                    do {
                        let jsonData = try JSONSerialization.data(withJSONObject: data, options: [])
                        try await _room.localParticipant.publish(data: jsonData)
                    } catch {
                    }
                }
            }
            .onReceive(viewModel.$isOnHold) { isOnHold in
                Task {
                    do {
                        // Toggle camera and microphone based on hold status
                        // If on hold, disable (mute). If not on hold, enable (unmute).
                        let shouldEnable = !isOnHold

                        if !configHolder.config.audioOnlyMode {
                            if _room.localParticipant.firstCameraVideoTrack != nil || shouldEnable {
                                 try await _room.localParticipant.setCamera(enabled: shouldEnable)
                            }
                        }

                        if _room.localParticipant.firstAudioTrack != nil || shouldEnable {
                            try await _room.localParticipant.setMicrophone(enabled: shouldEnable)
                        }

                    } catch {
                    }
                }
            }
    }
}


#if DEBUG
#Preview("Disconnected") {
    RoomScope(roomOptions: RoomOptions(
        defaultCameraCaptureOptions: CameraCaptureOptions(dimensions: .h720_169),
        defaultScreenShareCaptureOptions: ScreenShareCaptureOptions(dimensions: .h720_169, useBroadcastExtension: true),
        defaultAudioCaptureOptions: AudioCaptureOptions(
            echoCancellation: true,
            autoGainControl: true,
            noiseSuppression: true,
            highpassFilter: true,
            typingNoiseDetection: true
        )
    )) {
        VideoCallSwiftUIView(
            viewModel: VideoCallViewModel(),
            callId: 0,
            callComponentId: 0,
            callUUID: nil,
            callRole: 0,
            customerName: "Preview User",
            artifact: "Sample"
        )
    }
}
#endif
#endif

