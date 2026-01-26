//
//  NotConnectedView.swift
//  Popin
//
//  Created by Ashwin on 02/12/25.
//
import SwiftUI

#if canImport(UIKit)
public struct NotConnectedView: View {
    // Call information
    let callerName: String
    let callId: Int
    let callComponentId: Int
    let callUUID: UUID
    let artifact: String
    let callRole: Int

    // Product information
    let productId: String?
    let productName: String?
    let productImage: String?

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

    public init(
        callerName: String = "Unknown Caller",
        callId: Int = 0,
        callComponentId: Int = 0,
        callUUID: UUID = UUID(),
        artifact: String = "",
        callRole: Int = 0,
        productId: String? = nil,
        productName: String? = nil,
        productImage: String? = nil,
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
        self.productId = productId
        self.productName = productName
        self.productImage = productImage
        self.timeout = timeout
        self.start = start
        self.onAccept = onAccept
        self.onReject = onReject
    }

    public var body: some View {
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

                // Product card
                if productId != nil || productName != nil {
                    HStack(spacing: 12) {
                        // Product image
                        if let imageURL = productImage, let url = URL(string: imageURL) {
                            AsyncImage(url: url) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                            } placeholder: {
                                Color.gray.opacity(0.3)
                            }
                            .frame(width: 110, height: 120)
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                        } else {
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color.gray.opacity(0.3))
                                .frame(width: 110, height: 120)
                                .overlay(
                                    Image(systemName: "photo")
                                        .font(.system(size: 30))
                                        .foregroundColor(.white.opacity(0.5))
                                )
                        }

                        // Product details
                        VStack(alignment: .leading, spacing: 4) {
                            Spacer()

                            if let productId = productId {
                                Text(productId)
                                    .foregroundColor(.white)
                                    .font(.system(size: 17, weight: .medium))
                                    .lineLimit(2)
                            }

                            if let productName = productName {
                                Text(productName)
                                    .foregroundColor(.white.opacity(0.7))
                                    .font(.system(size: 15, weight: .bold))
                                    .lineLimit(2)
                            }

                            Spacer()
                        }

                        Spacer()
                    }
                    .padding(.horizontal, 16)
                    .frame(height: 120)
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color(white: 0.15))
                    )
                    .padding(.horizontal, 16)
                }

                Spacer()

                // Circular timer
                ZStack {
                    // Progress circle background
                    Circle()
                        .stroke(Color.black, lineWidth: 8)
                        .frame(width: 250, height: 250)

                    // Progress circle
                    Circle()
                        .trim(from: 0, to: CGFloat(timeRemaining) / CGFloat(initialTimeout))
                        .stroke(
                            Color(red: 0.88, green: 0.44, blue: 0),
                            style: StrokeStyle(lineWidth: 8, lineCap: .round)
                        )
                        .frame(width: 250, height: 250)
                        .rotationEffect(.degrees(-90))

                    // Timer text
                    VStack(spacing: 4) {
                        Text("\(timeRemaining)")
                            .foregroundColor(.white)
                            .font(.system(size: 52, weight: .bold))

                        Text("SECONDS")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .bold))
                    }
                }
                .padding(.vertical, 24)

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
            print("Request expired: timeout=\(calculatedTimeout)")
            // Auto-reject expired call
            onReject()
            return
        }

        var finalTimeout = calculatedTimeout

        // Check for overflow (same as Android)
        if calculatedTimeout > timeout {
            print("Timeout overflow detected: calculated=\(calculatedTimeout), actual=\(timeout)")
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
            productId: "SKU-12345",
            productName: "Premium Product Name",
            productImage: "https://example.com/product.jpg",
            timeout: 100,
            start: Int(Date().timeIntervalSince1970 * 1000),
            onAccept: { },
            onReject: { }
        )
    }
}
#endif
