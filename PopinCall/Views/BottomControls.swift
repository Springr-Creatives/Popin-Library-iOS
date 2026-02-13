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

// MARK: - Button Priority System

enum ControlButtonID: Int, CaseIterable {
    case mic = 1
    case video = 2
    case flip = 3
    case invite = 4
    case chat = 5
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

    private var visibleButtons: [ControlButtonID] {
        var buttons: [ControlButtonID] = []
        if !configHolder.config.hideMuteAudioButton { buttons.append(.mic) }
        if !configHolder.config.hideMuteVideoButton { buttons.append(.video) }
        if !configHolder.config.hideFlipCameraButton { buttons.append(.flip) }
        buttons.append(.invite) // always visible
        if !configHolder.config.hideChatButton && viewModel.call?.id != nil { buttons.append(.chat) }
        return buttons.sorted { $0.rawValue < $1.rawValue }
    }

    private var needsOverflow: Bool { visibleButtons.count > 4 }
    private var directButtons: [ControlButtonID] { needsOverflow ? Array(visibleButtons.prefix(3)) : visibleButtons }
    private var overflowButtons: [ControlButtonID] { needsOverflow ? Array(visibleButtons.dropFirst(3)) : [] }

    var body: some View {
        HStack(spacing: 0) {
            Spacer()

            // 1. Overflow button (only if needed)
            if needsOverflow {
                ControlCircleButton(
                    iconName: "ellipsis",
                    backgroundColor: Color.black.opacity(0.5),
                    iconColor: .white,
                    action: { showOverflowMenu = true }
                )
                .sheet(isPresented: $showOverflowMenu) {
                    OverflowMenuSheet(
                        showOverflowMenu: $showOverflowMenu,
                        items: overflowButtons,
                        unreadCount: chatManager.unreadCount,
                        onInviteTapped: { generateInviteLink() },
                        onChatTapped: { showChat = true },
                        onFlipTapped: { flipCamera() },
                        onMicTapped: { toggleMic() },
                        onVideoTapped: { toggleVideo() }
                    )
                    .modifier(SheetPresentationModifier(height: CGFloat(80 + overflowButtons.count * 76)))
                }
                Spacer()
            }

            // 2. Direct buttons
            ForEach(directButtons, id: \.rawValue) { button in
                directButtonView(for: button)
                Spacer()
            }

            // 3. End call button
            if !configHolder.config.hideDisconnectButton {
                ControlCircleButton(
                    iconName: "phone.down.fill",
                    backgroundColor: Color(hex: "E53935"),
                    iconColor: .white,
                    action: onEndCall
                )
                Spacer()
            }
        }
        .padding(.horizontal, 16)
        .padding(.bottom, 32)
        .padding(.top, 12)
        .background(
            LinearGradient(
                stops: [
                    .init(color: Color.black.opacity(0), location: 0.0),
                    .init(color: Color.black.opacity(0), location: 0.3),
                    .init(color: Color.black.opacity(0.2), location: 0.5),
                    .init(color: Color.black.opacity(0.4), location: 0.7),
                    .init(color: Color.black.opacity(0.6), location: 0.85),
                    .init(color: Color.black.opacity(0.6), location: 1.0),
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .frame(height: 240)
            .frame(maxWidth: .infinity),
            alignment: .bottom
        )
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

    // MARK: - Direct button rendering

    @ViewBuilder
    private func directButtonView(for button: ControlButtonID) -> some View {
        switch button {
        case .mic:
            MicrophoneToggleButton(
                label: {
                    ControlCircleButtonView(
                        iconName: "mic.slash.fill",
                        backgroundColor: .white,
                        iconColor: .black
                    )
                },
                published: {
                    ControlCircleButtonView(
                        iconName: "mic.fill",
                        backgroundColor: Color.black.opacity(0.5),
                        iconColor: .white
                    )
                }
            )
            .buttonStyle(PlainButtonStyle())
        case .video:
            CameraToggleButton(
                label: {
                    ControlCircleButtonView(
                        iconName: "video.slash.fill",
                        backgroundColor: .white,
                        iconColor: .black
                    )
                },
                published: {
                    ControlCircleButtonView(
                        iconName: "video.fill",
                        backgroundColor: Color.black.opacity(0.5),
                        iconColor: .white
                    )
                }
            )
            .buttonStyle(PlainButtonStyle())
        case .flip:
            ControlCircleButton(
                iconName: "arrow.triangle.2.circlepath.camera.fill",
                backgroundColor: Color.black.opacity(0.5),
                iconColor: .white,
                action: { flipCamera() }
            )
        case .invite:
            ControlCircleButton(
                iconName: "person.badge.plus",
                backgroundColor: Color.black.opacity(0.5),
                iconColor: .white,
                action: { generateInviteLink() }
            )
        case .chat:
            ZStack(alignment: .topTrailing) {
                ControlCircleButton(
                    iconName: "bubble.left.fill",
                    backgroundColor: Color.black.opacity(0.5),
                    iconColor: .white,
                    action: { showChat = true }
                )
                if chatManager.unreadCount > 0 {
                    Text("\(chatManager.unreadCount)")
                        .font(.system(size: 10, weight: .bold))
                        .foregroundColor(.white)
                        .frame(minWidth: 16, minHeight: 16)
                        .background(Color.red)
                        .clipShape(Circle())
                        .offset(x: 4, y: -4)
                }
            }
        }
    }

    // MARK: - Actions

    private func flipCamera() {
        Task {
            let videoTrack = room.localParticipant.firstCameraVideoTrack as? LocalVideoTrack
            let cameraCapturer = videoTrack?.capturer as? CameraCapturer
            try? await cameraCapturer?.switchCameraPosition()
        }
    }

    private func toggleMic() {
        Task {
            let micTrack = room.localParticipant.firstAudioTrack as? LocalAudioTrack
            if let track = micTrack {
                try? await room.localParticipant.setMicrophone(enabled: track.isMuted)
            }
        }
    }

    private func toggleVideo() {
        Task {
            let videoTrack = room.localParticipant.firstCameraVideoTrack as? LocalVideoTrack
            if let track = videoTrack {
                try? await room.localParticipant.setCamera(enabled: track.isMuted)
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
    var items: [ControlButtonID]
    var unreadCount: Int = 0
    var onInviteTapped: () -> Void
    var onChatTapped: () -> Void
    var onFlipTapped: () -> Void
    var onMicTapped: () -> Void
    var onVideoTapped: () -> Void

    var body: some View {
        ZStack {
            Color(hex: "2A2F33").ignoresSafeArea()

            VStack(spacing: 16) {
                ForEach(items, id: \.rawValue) { item in
                    overflowRow(for: item)
                }
                Spacer()
            }
            .padding(.top, 32)
            .padding(.horizontal, 16)
        }
    }

    @ViewBuilder
    private func overflowRow(for item: ControlButtonID) -> some View {
        switch item {
        case .invite:
            overflowButton(
                title: "Invite a friend",
                icon: "person.badge.plus",
                action: { showOverflowMenu = false; onInviteTapped() }
            )
        case .chat:
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
        case .flip:
            overflowButton(
                title: "Flip camera",
                icon: "arrow.triangle.2.circlepath.camera.fill",
                action: { showOverflowMenu = false; onFlipTapped() }
            )
        case .mic:
            overflowButton(
                title: "Mute / Unmute",
                icon: "mic.fill",
                action: { showOverflowMenu = false; onMicTapped() }
            )
        case .video:
            overflowButton(
                title: "Turn off / on video",
                icon: "video.fill",
                action: { showOverflowMenu = false; onVideoTapped() }
            )
        }
    }

    private func overflowButton(title: String, icon: String, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            HStack {
                Text(title)
                    .font(.system(size: 16, weight: .regular))
                    .foregroundColor(.white)
                Spacer()
                Image(systemName: icon)
                    .foregroundColor(.white)
                    .font(.system(size: 20))
            }
            .padding(20)
            .background(Color(hex: "3E4347"))
            .cornerRadius(12)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct InviteDialogSheet: View {
    let inviteUrl: String?
    let inviteError: String?
    let isLoading: Bool
    let onDismiss: () -> Void

    @State private var showCopiedToast = false
    @State private var showShareSheet = false

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

                    HStack(spacing: 12) {
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

                        Button(action: {
                            showShareSheet = true
                        }) {
                            HStack {
                                Image(systemName: "square.and.arrow.up")
                                Text("Share")
                            }
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(.white)
                            .padding(.horizontal, 24)
                            .padding(.vertical, 12)
                            .background(Color(hex: "2196F3"))
                            .cornerRadius(8)
                        }
                        .buttonStyle(PlainButtonStyle())
                        .sheet(isPresented: $showShareSheet) {
                            ShareSheet(activityItems: [url])
                        }
                    }
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

struct ShareSheet: UIViewControllerRepresentable {
    let activityItems: [Any]

    func makeUIViewController(context: Context) -> UIActivityViewController {
        UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
    }

    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {}
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
