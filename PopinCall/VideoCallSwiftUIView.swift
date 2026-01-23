//
//  VideoCallSwiftUIView.swift
//  Popin
//
//  Created by VideoCall Migration
//

import SwiftUI
import LiveKit
import LiveKitComponents
import Combine
import UIKit
import AVFAudio
import Foundation

// MARK: - SwiftUI VideoCall View

public struct VideoCallSwiftUIView: View {
    @EnvironmentObject private var _room: Room
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: VideoCallViewModel

    public let callId: Int
    public let callComponentId: Int
    public let callUUID: UUID?
    public let callRole: Int
    public let customerName: String
    public let artifact: String

    @State private var videoCallId: Int?
    @State private var videoUserId: Int?
    
    public init(viewModel: VideoCallViewModel,
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
    
    public var body: some View {
        PopinConference(callId: videoCallId, userId: videoUserId)
            .environmentObject(viewModel)
            .onReceive(viewModel.$call.compactMap { $0 }) { call in
                // Update call data for the UI
                videoCallId = call.connect_request_id
                videoUserId = call.user_id

                Task {
                    guard let websocket = call.websocket,
                          let token = call.access_token else { return }
                    do {
                        try await _room.connect(url: websocket, token: token)
                        bfprint("Connected to room")
                        try await _room.localParticipant.setMicrophone(enabled: true)
                        bfprint("Microphone enabled")
                        try await _room.localParticipant.setCamera(enabled: true)
                        bfprint("Camera enabled")

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
                                        bfprint("Enabled multitasking camera access via AVCaptureSession")
                                    }
                                }
                            }
                        }


                        

                    } catch {
                        bfprint("Failed to connect or set media: \(error.localizedDescription)")
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
                        print("Data published via LiveKit")
                    } catch {
                        print("Failed to publish data: \(error)")
                    }
                }
            }
            .onReceive(viewModel.$isOnHold) { isOnHold in
                print("VideoCallSwiftUIView: isOnHold changed to \(isOnHold)")
                Task {
                    do {
                        // Toggle camera and microphone based on hold status
                        // If on hold, disable (mute). If not on hold, enable (unmute).
                        let shouldEnable = !isOnHold
                        
                        // Check if we have tracks before trying to set them
                        // Note: In a real app we might want to respect previous state (e.g. if user had muted self)
                        // For now we assume we want to restore audio/video when unholding
                        
                        if _room.localParticipant.firstCameraVideoTrack != nil || shouldEnable {
                             try await _room.localParticipant.setCamera(enabled: shouldEnable)
                        }
                        
                        if _room.localParticipant.firstAudioTrack != nil || shouldEnable {
                            try await _room.localParticipant.setMicrophone(enabled: shouldEnable)
                        }
                        
                        print("VideoCallSwiftUIView: Media tracks updated for hold status: \(isOnHold)")
                    } catch {
                        print("VideoCallSwiftUIView: Failed to update media tracks for hold: \(error)")
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

