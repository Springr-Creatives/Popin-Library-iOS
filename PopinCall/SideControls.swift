#if canImport(UIKit)
//
//  SideControls.swift
//  Popin
//
//  Created by Ashwin on 09/09/25.
//

import SwiftUI
import LiveKit
import LiveKitComponents

struct SideControls: View {
    @EnvironmentObject private var room: Room
    @EnvironmentObject private var configHolder: PopinConfigHolder

    var body: some View {
        VStack(spacing: 12) {
            // Swap Camera Button
            if !configHolder.config.hideFlipCameraButton {
                Button {
                    Task {
                        let videoTrack = room.localParticipant.firstCameraVideoTrack as? LocalVideoTrack
                        let cameraCapturer = videoTrack?.capturer as? CameraCapturer
                        try await cameraCapturer?.switchCameraPosition()
                    }
                } label: {
                    ZStack {
                        Circle()
                            .fill(Color(hex: "433F40").opacity(0.8))
                            .frame(width: 44, height: 44)

                        Image(systemName: "arrow.triangle.2.circlepath.camera.fill")
                            .font(.system(size: 18))
                            .foregroundColor(.white)
                    }
                }
                .frame(width: 44, height: 44)
            }

            // Mute Video Button
            if !configHolder.config.hideMuteVideoButton {
                CameraToggleButton {
                    ZStack {
                        Circle()
                            .fill(Color(hex: "433F40").opacity(0.8))
                            .frame(width: 44, height: 44)

                        Image(systemName: "video.slash.fill")
                            .font(.system(size: 18))
                            .foregroundColor(.white)
                    }
                } published: {
                    ZStack {
                        Circle()
                            .fill(Color(hex: "433F40").opacity(0.8))
                            .frame(width: 44, height: 44)

                        Image(systemName: "video.fill")
                            .font(.system(size: 18))
                            .foregroundColor(.white)
                    }
                }
                .frame(width: 44, height: 44)
            }

            // Mute Audio Button
            if !configHolder.config.hideMuteAudioButton {
                MicrophoneToggleButton {
                    ZStack {
                        Circle()
                            .fill(Color(hex: "433F40").opacity(0.8))
                            .frame(width: 44, height: 44)

                        Image(systemName: "mic.slash.fill")
                            .font(.system(size: 18))
                            .foregroundColor(.white)
                    }
                } published: {
                    ZStack {
                        Circle()
                            .fill(Color(hex: "433F40").opacity(0.8))
                            .frame(width: 44, height: 44)

                        Image(systemName: "mic.fill")
                            .font(.system(size: 18))
                            .foregroundColor(.white)
                    }
                }
                .frame(width: 44, height: 44)
            }

            // Screen Share Button
            if !configHolder.config.hideScreenShareButton {
                BroadcastPickerWrapper()
                    .frame(width: 44, height: 44)
            }
        }
        .padding(.leading, 12)
        .buttonStyle(.plain)
    }
}
#endif
