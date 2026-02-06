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

// Helper modifier for iOS 16+ sheet presentation
struct SheetPresentationModifier: ViewModifier {
    let height: CGFloat

    func body(content: Content) -> some View {
        if #available(iOS 16.0, *) {
            content
                .presentationDetents([.height(height)])
                .presentationDragIndicator(.visible)
        } else {
            content
        }
    }
}

struct BottomControls: View {
    @EnvironmentObject private var room: Room
    @EnvironmentObject private var configHolder: PopinConfigHolder
    @EnvironmentObject private var viewModel: VideoCallViewModel

    let onEndCall: () -> Void

    @State private var showOverflowMenu = false
    @State private var showInviteDialog = false
    @State private var inviteUrl: String? = nil
    @State private var inviteError: String? = nil
    @State private var isLoadingInvite = false
    @Binding var showChat: Bool
    @ObservedObject private var chatManager = ChatManager.shared

    private let videoCallInteractor = VideoCallInteractor()
    
    var body: some View {
        HStack(spacing: 0) {
            Spacer()

            // 1. Overflow Menu
            ControlCircleButton(
                iconName: "ellipsis",
                backgroundColor: Color.black.opacity(0.5),
                iconColor: .white,
                action: { showOverflowMenu = true }
            )
            .sheet(isPresented: $showOverflowMenu) {
                OverflowMenuSheet(
                    showOverflowMenu: $showOverflowMenu,
                    hideScreenShareButton: configHolder.config.hideScreenShareButton,
                    hideChatButton: configHolder.config.hideChatButton || viewModel.call?.id == nil,
                    unreadCount: chatManager.unreadCount,
                    onInviteTapped: {
                        generateInviteLink()
                    },
                    onChatTapped: {
                        showChat = true
                    }
                )
                .modifier(SheetPresentationModifier(height: 320))
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
                .buttonStyle(PlainButtonStyle())
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
                .buttonStyle(PlainButtonStyle())
            }
            
            Spacer()

            // 4. Flip Camera Button
            if !configHolder.config.hideFlipCameraButton {
                ControlCircleButton(
                    iconName: "arrow.triangle.2.circlepath.camera.fill",
                    backgroundColor: Color.black.opacity(0.5),
                    iconColor: .white,
                    action: {
                        Task {
                            let videoTrack = room.localParticipant.firstCameraVideoTrack as? LocalVideoTrack
                            let cameraCapturer = videoTrack?.capturer as? CameraCapturer
                            try? await cameraCapturer?.switchCameraPosition()
                        }
                    }
                )
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

            Spacer()
        }
        .padding(.horizontal, 16)
        .padding(.bottom, 32)
        .padding(.top, 12)
        .sheet(isPresented: $showInviteDialog) {
            InviteDialogSheet(
                inviteUrl: inviteUrl,
                inviteError: inviteError,
                isLoading: isLoadingInvite,
                onDismiss: {
                    showInviteDialog = false
                    inviteUrl = nil
                    inviteError = nil
                }
            )
            .modifier(SheetPresentationModifier(height: 200))
        }
        .fullScreenCover(isPresented: $showChat) {
            if let callId = viewModel.call?.id {
                ChatView(callId: callId, onClose: { showChat = false })
            }
        }
    }

    private func generateInviteLink() {
        guard let callId = viewModel.call?.id else {
            inviteError = "Call ID not available"
            showInviteDialog = true
            return
        }

        isLoadingInvite = true
        inviteError = nil
        inviteUrl = nil
        showInviteDialog = true

        Task {
            do {
                let url = try await videoCallInteractor.inviteParticipant(callId: callId)
                await MainActor.run {
                    inviteUrl = url
                    isLoadingInvite = false
                }
            } catch {
                await MainActor.run {
                    inviteError = error.localizedDescription
                    isLoadingInvite = false
                }
            }
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
        .buttonStyle(PlainButtonStyle())
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
    var hideScreenShareButton: Bool = false
    var hideChatButton: Bool = false
    var unreadCount: Int = 0
    var onInviteTapped: () -> Void
    var onChatTapped: () -> Void

    var body: some View {
        ZStack {
            Color(hex: "2A2F33").ignoresSafeArea()

            VStack(spacing: 16) {
                // Invite Row
                Button(action: {
                    showOverflowMenu = false
                    onInviteTapped()
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
                .buttonStyle(PlainButtonStyle())

                // Chat Row
                if !hideChatButton {
                    Button(action: {
                        showOverflowMenu = false
                        onChatTapped()
                    }) {
                        HStack {
                            Text("Chat")
                                .font(.system(size: 16, weight: .regular))
                                .foregroundColor(.white)
                            Spacer()
                            ZStack(alignment: .topTrailing) {
                                Image(systemName: "bubble.left.fill")
                                    .foregroundColor(.white)
                                    .font(.system(size: 20))
                                if unreadCount > 0 {
                                    Text("\(unreadCount)")
                                        .font(.system(size: 10, weight: .bold))
                                        .foregroundColor(.white)
                                        .frame(minWidth: 16, minHeight: 16)
                                        .background(Color.red)
                                        .clipShape(Circle())
                                        .offset(x: 8, y: -8)
                                }
                            }
                        }
                        .padding(20)
                        .background(Color(hex: "3E4347"))
                        .cornerRadius(12)
                    }
                    .buttonStyle(PlainButtonStyle())
                }

                // Screen Share Row
                if !hideScreenShareButton {
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
                }

                Spacer()
            }
            .padding(.top, 32)
            .padding(.horizontal, 16)
        }
    }
}

struct InviteDialogSheet: View {
    let inviteUrl: String?
    let inviteError: String?
    let isLoading: Bool
    let onDismiss: () -> Void

    @State private var showCopiedToast = false

    var body: some View {
        ZStack {
            Color(hex: "2A2F33").ignoresSafeArea()

            VStack(spacing: 20) {
                Text("Invite a Friend")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.white)

                if isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                        .scaleEffect(1.2)
                } else if let error = inviteError {
                    Text(error)
                        .font(.system(size: 14))
                        .foregroundColor(.red)
                        .multilineTextAlignment(.center)
                } else if let url = inviteUrl {
                    Text(url)
                        .font(.system(size: 14))
                        .foregroundColor(.white.opacity(0.8))
                        .lineLimit(2)
                        .truncationMode(.middle)
                        .padding(.horizontal)

                    Button(action: {
                        UIPasteboard.general.string = url
                        showCopiedToast = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            showCopiedToast = false
                        }
                    }) {
                        HStack {
                            Image(systemName: "doc.on.doc")
                            Text("Copy Link")
                        }
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(.white)
                        .padding(.horizontal, 24)
                        .padding(.vertical, 12)
                        .background(Color(hex: "4CAF50"))
                        .cornerRadius(8)
                    }
                    .buttonStyle(PlainButtonStyle())
                }

                Button(action: onDismiss) {
                    Text("Close")
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(.white.opacity(0.7))
                }
                .buttonStyle(PlainButtonStyle())
            }
            .padding(.top, 24)

            // Toast message
            if showCopiedToast {
                VStack {
                    Spacer()
                    Text("Invite link copied")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(.white)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 10)
                        .background(Color.black.opacity(0.8))
                        .cornerRadius(8)
                        .padding(.bottom, 20)
                }
                .transition(.opacity)
                .animation(.easeInOut(duration: 0.3), value: showCopiedToast)
            }
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
