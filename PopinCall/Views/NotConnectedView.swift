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

                // "You have a new chat from" text
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

                // Accept/Reject buttons
                HStack(spacing: 8) {
                    // Reject button
                    Button(action: {
                        timerActive = false
                        timer?.invalidate()
                        onReject()
                    }) {
                        HStack(spacing: 16) {
                            Text("Reject")
                                .font(.system(size: 21, weight: .medium))
                                .foregroundColor(.white)

                            Image(systemName: "phone.down.fill")
                                .font(.system(size: 20))
                                .foregroundColor(.white)
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 56)
                        .background(
                            RoundedRectangle(cornerRadius: 28)
                                .fill(Color(red: 0.8, green: 0.2, blue: 0.2))
                        )
                    }
                    .buttonStyle(PlainButtonStyle())

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
                }
                .padding(.horizontal, 8)
                .padding(.bottom, 24)
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

// Custom button style for call buttons
struct CallButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.92 : 1.0)
            .opacity(configuration.isPressed ? 0.8 : 1.0)
            .animation(.easeInOut(duration: 0.15), value: configuration.isPressed)
    }
}

// Preview
struct NotConnectedView_Previews: PreviewProvider {
    static var previews: some View {
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
    }
}
#endif
