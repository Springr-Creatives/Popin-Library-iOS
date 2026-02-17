//
//  NotConnectedView.swift
//  Popin
//
//  Created by Ashwin on 02/12/25.
//
import SwiftUI

#if canImport(UIKit)
struct NotConnectedView: View {
    // Call information
    let callerName: String
    let callId: Int
    let callComponentId: Int
    let callUUID: UUID
    let artifact: String
    let callRole: Int

    // Timer information
    let timeout: Int
    let start: Int

    // Actions
    let onAccept: () -> Void
    let onReject: () -> Void

    // Timer state
    @State private var timeRemaining: Int = 100
    @State private var initialTimeout: Int = 100
    @State private var timerActive = true
    @State private var timer: Timer?

    // Pre-call mic/camera state
    @State private var micEnabled = true
    @State private var cameraEnabled = true

    // Access to config
    @EnvironmentObject private var configHolder: PopinConfigHolder
    @ObservedObject private var chatManager = ChatManager.shared

    init(
        callerName: String = "Unknown Caller",
        callId: Int = 0,
        callComponentId: Int = 0,
        callUUID: UUID = UUID(),
        artifact: String = "",
        callRole: Int = 0,
        timeout: Int = 100,
        start: Int = 0,
        onAccept: @escaping () -> Void = {},
        onReject: @escaping () -> Void = {}
    ) {
        self.callerName = callerName
        self.callId = callId
        self.callComponentId = callComponentId
        self.callUUID = callUUID
        self.artifact = artifact
        self.callRole = callRole
        self.timeout = timeout
        self.start = start
        self.onAccept = onAccept
        self.onReject = onReject
    }

    // Compute visible buttons - show chat button (disabled) if it will appear in connected view
    private var visibleButtons: [ControlButtonID] {
        let audioOnly = configHolder.config.audioOnlyMode
        var buttons: [ControlButtonID] = []
        if !configHolder.config.hideMuteAudioButton { buttons.append(.mic) }
        if !audioOnly && !configHolder.config.hideMuteVideoButton { buttons.append(.video) }
        if !audioOnly && !configHolder.config.hideFlipCameraButton { buttons.append(.flip) }
        buttons.append(.invite) // always visible
        // Show chat button if it's not hidden in config (will be disabled in incoming call view)
        if !configHolder.config.hideChatButton { buttons.append(.chat) }
        return buttons.sorted { $0.rawValue < $1.rawValue }
    }

    private var needsOverflow: Bool { visibleButtons.count > 4 }
    private var directButtons: [ControlButtonID] { needsOverflow ? Array(visibleButtons.prefix(3)) : visibleButtons }
    private var overflowButtons: [ControlButtonID] { needsOverflow ? Array(visibleButtons.dropFirst(3)) : [] }

    var body: some View {
        ZStack {
            // Black background
            Color.black
                .ignoresSafeArea()

            VStack(spacing: 0) {
                Spacer()
                    .frame(height: 60)

                // User icon
                Image(systemName: "person.circle.fill")
                    .font(.system(size: 60))
                    .foregroundColor(.white.opacity(0.8))
                    .padding(.bottom, 8)

                // "New video call from" text
                Text("New video call from")
                    .foregroundColor(.white)
                    .font(.system(size: 18, weight: .medium))
                    .padding(.bottom, 4)

                // Caller name
                Text(callerName)
                    .foregroundColor(.white)
                    .font(.system(size: 20, weight: .bold))
                    .padding(.bottom, 24)

                Spacer()

                // Accept button
                Button(action: {
                    timerActive = false
                    timer?.invalidate()
                    onAccept()
                }) {
                    HStack(spacing: 16) {
                        Text("Accept")
                            .font(.system(size: 21, weight: .medium))
                            .foregroundColor(.white)

                        Image(systemName: "phone.fill")
                            .font(.system(size: 20))
                            .foregroundColor(.white)
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 56)
                    .background(
                        RoundedRectangle(cornerRadius: 28)
                            .fill(Color(red: 0.2, green: 0.7, blue: 0.3))
                    )
                }
                .buttonStyle(PlainButtonStyle())
                .padding(.horizontal, 16)
                .padding(.bottom, 16)

                // Dynamic bottom controls (matching connected screen layout)
                IncomingCallBottomControls(
                    micEnabled: $micEnabled,
                    cameraEnabled: $cameraEnabled,
                    audioOnlyMode: configHolder.config.audioOnlyMode,
                    visibleButtons: visibleButtons,
                    needsOverflow: needsOverflow,
                    directButtons: directButtons,
                    overflowButtons: overflowButtons,
                    unreadCount: chatManager.unreadCount,
                    hideDisconnectButton: configHolder.config.hideDisconnectButton,
                    onEndCall: {
                        timerActive = false
                        timer?.invalidate()
                        onReject()
                    }
                )
            }
        }
        .onAppear {
            startTimer()
        }
        .onDisappear {
            // Clean up timer when view is removed
            timerActive = false
            timer?.invalidate()
        }
    }

    private func startTimer() {
        // Calculate timeout using same logic as Android ConnectActivity
        // timeout = Math.round(actualTimeout - ((float) (now - startTime) / 1000));
        let now = Int(Date().timeIntervalSince1970 * 1000) // Current time in milliseconds
        let calculatedTimeout = Int(round(Float(timeout) - (Float(now - start) / 1000.0)))

        // Validate timeout
        if calculatedTimeout < 1 {
            // Auto-reject expired call
            onReject()
            return
        }

        var finalTimeout = calculatedTimeout

        // Check for overflow (same as Android)
        if calculatedTimeout > timeout {
            finalTimeout = timeout
        }

        // Set initial timeout and time remaining
        timeRemaining = finalTimeout
        initialTimeout = finalTimeout

        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            // Stop timer if it's been deactivated (call accepted/rejected)
            if !timerActive {
                timer.invalidate()
                return
            }

            if timeRemaining > 0 {
                timeRemaining -= 1
            } else {
                timer.invalidate()
                // Auto-reject when timer reaches 0
                onReject()
            }
        }
    }
}

// MARK: - Incoming Call Bottom Controls

struct IncomingCallBottomControls: View {
    @Binding var micEnabled: Bool
    @Binding var cameraEnabled: Bool
    let audioOnlyMode: Bool
    let visibleButtons: [ControlButtonID]
    let needsOverflow: Bool
    let directButtons: [ControlButtonID]
    let overflowButtons: [ControlButtonID]
    let unreadCount: Int
    let hideDisconnectButton: Bool
    let onEndCall: () -> Void

    var body: some View {
        HStack(spacing: 0) {
            Spacer()

            // 1. Overflow button (disabled during incoming call)
            if needsOverflow {
                ControlCircleButtonView(
                    iconName: "ellipsis",
                    backgroundColor: Color.black.opacity(0.15),
                    iconColor: .white.opacity(0.2)
                )
                Spacer()
            }

            // 2. Direct buttons
            ForEach(directButtons, id: \.rawValue) { button in
                incomingCallButtonView(for: button)
                Spacer()
            }

            // 3. End call button (enabled)
            if !hideDisconnectButton {
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
    }

    @ViewBuilder
    private func incomingCallButtonView(for button: ControlButtonID) -> some View {
        switch button {
        case .mic:
            // Mic toggle - ENABLED
            ControlCircleButton(
                iconName: micEnabled ? "mic.fill" : "mic.slash.fill",
                backgroundColor: micEnabled ? Color.black.opacity(0.5) : .white,
                iconColor: micEnabled ? .white : .black,
                action: { micEnabled.toggle() }
            )
        case .video:
            // Camera toggle - ENABLED
            if !audioOnlyMode {
                ControlCircleButton(
                    iconName: cameraEnabled ? "video.fill" : "video.slash.fill",
                    backgroundColor: cameraEnabled ? Color.black.opacity(0.5) : .white,
                    iconColor: cameraEnabled ? .white : .black,
                    action: { cameraEnabled.toggle() }
                )
            }
        case .flip:
            // Flip camera - DISABLED
            if !audioOnlyMode {
                ControlCircleButtonView(
                    iconName: "arrow.triangle.2.circlepath.camera.fill",
                    backgroundColor: Color.black.opacity(0.15),
                    iconColor: .white.opacity(0.2)
                )
            }
        case .invite:
            // Invite - DISABLED
            ControlCircleButtonView(
                iconName: "person.badge.plus",
                backgroundColor: Color.black.opacity(0.15),
                iconColor: .white.opacity(0.2)
            )
        case .chat:
            // Chat - DISABLED (with badge if unread messages exist)
            ZStack(alignment: .topTrailing) {
                ControlCircleButtonView(
                    iconName: "bubble.left.fill",
                    backgroundColor: Color.black.opacity(0.15),
                    iconColor: .white.opacity(0.2)
                )
                if unreadCount > 0 {
                    Text("\(unreadCount)")
                        .font(.system(size: 10, weight: .bold))
                        .foregroundColor(.white)
                        .frame(minWidth: 16, minHeight: 16)
                        .background(Color.red.opacity(0.5))
                        .clipShape(Circle())
                        .offset(x: 4, y: -4)
                }
            }
        }
    }
}

// Preview
struct NotConnectedView_Previews: PreviewProvider {
    static var previews: some View {
        let config = PopinConfig.Builder().build()
        NotConnectedView(
            callerName: "John Doe",
            callId: 12345,
            callComponentId: 67890,
            callUUID: UUID(),
            artifact: "Premium Widget",
            callRole: 1,
            timeout: 100,
            start: Int(Date().timeIntervalSince1970 * 1000),
            onAccept: { },
            onReject: { }
        )
        .environmentObject(PopinConfigHolder(config: config))
    }
}
#endif
