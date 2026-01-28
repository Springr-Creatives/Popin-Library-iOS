//
//  BottomControls.swift
//  Popin
//
//  Created by Gemini on 28/01/2026.
//

import SwiftUI
import LiveKit
import LiveKitComponents

#if canImport(UIKit)
import ReplayKit

struct BottomControls: View {
    @EnvironmentObject private var room: Room
    @EnvironmentObject private var configHolder: PopinConfigHolder
    
    let onEndCall: () -> Void
    
    @State private var showOverflowMenu = false
    @State private var showInviteSheet = false
    @State private var inviteUrl: String? = nil
    
    var body: some View {
        HStack(spacing: 0) {
            // 1. Overflow Menu
            ControlCircleButton(
                iconName: "ellipsis",
                backgroundColor: Color.black.opacity(0.5),
                iconColor: .white,
                action: { showOverflowMenu = true }
            )
            .sheet(isPresented: $showOverflowMenu) {
                OverflowMenuSheet(showOverflowMenu: $showOverflowMenu, showInviteSheet: $showInviteSheet)
                    .presentationDetents([.height(250)])
                    .presentationDragIndicator(.visible)
            }
            
            Spacer()
            
            // 2. Mic Toggle
            if !configHolder.config.hideMuteAudioButton {
                MicrophoneToggleButton(
                    label: {
                        // Muted (Off) -> White background, Black icon
                        ControlCircleButtonView(
                            iconName: "mic.slash.fill",
                            backgroundColor: .white,
                            iconColor: .black
                        )
                    },
                    published: {
                        // Unmuted (On) -> Dark background, White icon
                        ControlCircleButtonView(
                            iconName: "mic.fill",
                            backgroundColor: Color.black.opacity(0.5),
                            iconColor: .white
                        )
                    }
                )
            } else {
                 // Placeholder to keep spacing if hidden? Or just nothing.
                 // If hidden, the Spacer() logic might need adjustment for perfect distribution,
                 // but for now we just omit it.
            }
            
            Spacer()
            
            // 3. Video Toggle
            if !configHolder.config.hideMuteVideoButton {
                CameraToggleButton(
                    label: {
                        // Video Off -> White background, Black icon
                        ControlCircleButtonView(
                            iconName: "video.slash.fill",
                            backgroundColor: .white,
                            iconColor: .black
                        )
                    },
                    published: {
                        // Video On -> Dark background, White icon
                        ControlCircleButtonView(
                            iconName: "video.fill",
                            backgroundColor: Color.black.opacity(0.5),
                            iconColor: .white
                        )
                    }
                )
            }
            
            Spacer()
            
            // 4. Flip Camera
            if !configHolder.config.hideFlipCameraButton {
                Button(action: {
                    Task {
                        let videoTrack = room.localParticipant.firstCameraVideoTrack as? LocalVideoTrack
                        let cameraCapturer = videoTrack?.capturer as? CameraCapturer
                        try await cameraCapturer?.switchCameraPosition()
                    }
                }) {
                    ControlCircleButtonView(
                        iconName: "arrow.triangle.2.circlepath.camera.fill",
                        backgroundColor: Color.black.opacity(0.5),
                        iconColor: .white
                    )
                }
                // Disable if no video track? Or just let it do nothing.
                // Generally good to give feedback but keep it simple for now.
            }
            
            Spacer()
            
            // 5. End Call
            if !configHolder.config.hideDisconnectButton {
                ControlCircleButton(
                    iconName: "phone.down.fill",
                    backgroundColor: Color(hex: "E53935"),
                    iconColor: .white,
                    action: onEndCall
                )
            }
        }
        .padding(.horizontal, 24)
        .padding(.bottom, 32)
        .padding(.top, 12)
        .alert("Invite a Friend", isPresented: $showInviteSheet) {
            Button("OK", role: .cancel) { }
        } message: {
            Text("Invite link generation is not yet implemented.")
        }
    }
}

// MARK: - Helper Views

struct ControlCircleButton: View {
    let iconName: String
    let backgroundColor: Color
    let iconColor: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            ControlCircleButtonView(
                iconName: iconName,
                backgroundColor: backgroundColor,
                iconColor: iconColor
            )
        }
    }
}

struct ControlCircleButtonView: View {
    let iconName: String
    let backgroundColor: Color
    let iconColor: Color
    
    var body: some View {
        ZStack {
            Circle()
                .fill(backgroundColor)
                .frame(width: 56, height: 56)
            
            Image(systemName: iconName)
                .font(.system(size: 24))
                .foregroundColor(iconColor)
        }
    }
}

struct OverflowMenuSheet: View {
    @Binding var showOverflowMenu: Bool
    @Binding var showInviteSheet: Bool
    
    var body: some View {
        ZStack {
            Color(hex: "2A2F33").ignoresSafeArea()
            
            VStack(spacing: 16) {
                // Invite Row
                Button(action: {
                    showOverflowMenu = false
                    showInviteSheet = true
                }) {
                    HStack {
                        Text("Invite a friend")
                            .font(.system(size: 16, weight: .regular))
                            .foregroundColor(.white)
                        Spacer()
                        Image(systemName: "person.badge.plus")
                            .foregroundColor(.white)
                            .font(.system(size: 20))
                    }
                    .padding(20)
                    .background(Color(hex: "3E4347"))
                    .cornerRadius(12)
                }
                
                // Screen Share Row
                ZStack {
                    // Visual
                    HStack {
                        Text("Share screen")
                            .font(.system(size: 16, weight: .regular))
                            .foregroundColor(.white)
                        Spacer()
                        Image(systemName: "rectangle.on.rectangle")
                            .foregroundColor(.white)
                            .font(.system(size: 20))
                    }
                    .padding(20)
                    .background(Color(hex: "3E4347"))
                    .cornerRadius(12)
                    
                    // Invisible Picker
                    BroadcastPickerRowWrapper()
                }
                
                Spacer()
            }
            .padding(.top, 32)
            .padding(.horizontal, 16)
        }
    }
}

struct BroadcastPickerRowWrapper: UIViewRepresentable {
    var extensionBundleIdentifier: String {
        guard let bundleID = Bundle.main.bundleIdentifier else {
            return "to.popin.seller.broadcast"
        }
        return bundleID + ".broadcast"
    }
    
    func makeUIView(context: Context) -> RPSystemBroadcastPickerView {
        let picker = RPSystemBroadcastPickerView(frame: .zero)
        picker.preferredExtension = extensionBundleIdentifier
        picker.showsMicrophoneButton = false
        
        // Hide the default button image so it's transparent
        for view in picker.subviews {
            if let button = view as? UIButton {
                button.imageView?.image = nil
                button.setImage(nil, for: .normal)
                button.setImage(nil, for: .highlighted)
                // Make the button fill the view
                button.frame = picker.bounds
                button.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            }
        }
        
        return picker
    }
    
    func updateUIView(_ uiView: RPSystemBroadcastPickerView, context: Context) {
        if uiView.preferredExtension != extensionBundleIdentifier {
            uiView.preferredExtension = extensionBundleIdentifier
        }
    }
}
#endif
