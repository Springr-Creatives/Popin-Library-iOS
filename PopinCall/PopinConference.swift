/*
 * Copyright 2024 LiveKit
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import LiveKit
import LiveKitComponents
import SwiftUI
import AVFoundation

#if canImport(UIKit)
import UIKit

struct PopinConference: View {
    @EnvironmentObject private var _room: Room
    @Environment(\.liveKitUIOptions) private var _ui: UIOptions
    @EnvironmentObject private var viewModel: VideoCallViewModel

    @State private var primaryParticipantId: String?
    @State private var hasConnected = false

    var callId: Int?
    var userId: Int?

    init(callId: Int? = nil, userId: Int? = nil) {
        self.callId = callId
        self.userId = userId
    }
    
    func buildNotConnectedView() -> some View {
        // Get call information from PopinCallManager
        let manager = PopinCallManager.shared

        // Extract product information
        let productId: String?
        let productName: String?
        let productImage: String?

        if let product = manager.callData?.product {
            // Use parsed product from JSON if available
            productId = product.externalId ?? product.id?.description
            productName = product.name
            productImage = product.image
        } else {
            // Fall back to individual product fields
            productId = manager.callData?.productId
            productName = manager.callData?.productName
            productImage = manager.callData?.productImage
        }

        return NotConnectedView(
            callerName: manager.callData?.displayName ?? "Unknown Caller",
            callId: manager.callData?.callId ?? 0,
            callComponentId: manager.callData?.callComponentId ?? 0,
            callUUID: manager.callUUID ?? UUID(),
            artifact: manager.callData?.artifact ?? "",
            callRole: manager.callData?.role ?? 0,
            productId: productId,
            productName: productName,
            productImage: productImage,
            timeout: manager.callData?.timeout ?? 100,
            start: manager.callData?.start ?? 0,
            onAccept: {
                // Answer call via CallKit
                CallManager.shared.answerCall()
            },
            onReject: {
                // Reject call via CallKit
                CallManager.shared.endCall()
            }
        )
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }

    var body: some View {
        // Show different views based on connection state
        if viewModel.isWaitingForAcceptance {
            // Outgoing call waiting for acceptance - show "Connecting..." with self video
            buildWaitingForAcceptanceView()
        } else if !viewModel.callAccepted {
            // Not accepted yet (Ringing) - show not connected view (incoming calls)
             if #available(iOS 16.0, *) {
                 NavigationStack {
                     buildNotConnectedView()
                 }
             } else {
                 buildNotConnectedView()
             }
        } else if [.reconnecting, .connected].contains(_room.connectionState) {
            // Fully connected - show the connected view
            PopinConnectedView()
                .environmentObject(viewModel)
                .onAppear {
                    hasConnected = true
                }
                .onChange(of: _room.connectionState) { newState in
                    print("STATE> \(newState.rawValue)")
                    if newState == .connected {
                        hasConnected = true
                    }
                }
        } else if _room.connectionState == .disconnected && hasConnected {
             // Disconnected after being accepted - show empty view while controller dismisses
             Color.black
                 .onAppear {
                     CallManager.shared.endCall()
                     viewModel.onRoomDisconnected?()
                 }
        } else {
            // Call accepted but connecting/reconnecting/other - show loading
            ZStack {
                Color.black.ignoresSafeArea()
                VStack(spacing: 20) {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                        .scaleEffect(2.0)
                    Text("Connecting...")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .medium))
                }
            }
        }
    }

    /// View shown for outgoing calls while waiting for the call to be accepted
    @ViewBuilder
    func buildWaitingForAcceptanceView() -> some View {
        ZStack {
            // Full screen self video preview
            LocalCameraPreview()
                .ignoresSafeArea()

            // Gradient overlay at top for better text visibility
            VStack {
                LinearGradient(
                    gradient: Gradient(colors: [Color.black.opacity(0.6), Color.clear]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .frame(height: 150)
                Spacer()
            }
            .ignoresSafeArea()

            // Content overlay
            VStack {
                // "Connecting..." label at top center
                HStack(spacing: 8) {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                    Text("Connecting...")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .semibold))
                }
                .padding(.top, 60)

                Spacer()

                // Bottom controls matching BottomControls.swift style
                WaitingBottomControls(onCancelCall: {
                    viewModel.onCancelCall?()
                })
            }
        }
    }
}

// MARK: - Local Camera Preview

struct LocalCameraPreview: UIViewRepresentable {
    func makeUIView(context: Context) -> LocalCameraPreviewUIView {
        let view = LocalCameraPreviewUIView()
        view.startCapture()
        return view
    }

    func updateUIView(_ uiView: LocalCameraPreviewUIView, context: Context) {}

    static func dismantleUIView(_ uiView: LocalCameraPreviewUIView, coordinator: ()) {
        uiView.stopCapture()
    }
}

class LocalCameraPreviewUIView: UIView {
    private var captureSession: AVCaptureSession?
    private var previewLayer: AVCaptureVideoPreviewLayer?

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        backgroundColor = .black
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        previewLayer?.frame = bounds
    }

    func startCapture() {
        let session = AVCaptureSession()
        session.sessionPreset = .high

        guard let camera = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front),
              let input = try? AVCaptureDeviceInput(device: camera) else {
            return
        }

        if session.canAddInput(input) {
            session.addInput(input)
        }

        let previewLayer = AVCaptureVideoPreviewLayer(session: session)
        previewLayer.videoGravity = .resizeAspectFill
        previewLayer.frame = bounds
        layer.addSublayer(previewLayer)

        self.captureSession = session
        self.previewLayer = previewLayer

        DispatchQueue.global(qos: .userInitiated).async {
            session.startRunning()
        }
    }

    func stopCapture() {
        captureSession?.stopRunning()
        previewLayer?.removeFromSuperlayer()
        captureSession = nil
        previewLayer = nil
    }
}

// MARK: - Waiting Bottom Controls

struct WaitingBottomControls: View {
    let onCancelCall: () -> Void

    var body: some View {
        HStack(spacing: 0) {
            // 1. Overflow Menu (disabled)
            ControlCircleButtonView(
                iconName: "ellipsis",
                backgroundColor: Color.black.opacity(0.3),
                iconColor: .white.opacity(0.4)
            )

            Spacer()

            // 2. Mic (disabled)
            ControlCircleButtonView(
                iconName: "mic.fill",
                backgroundColor: Color.black.opacity(0.3),
                iconColor: .white.opacity(0.4)
            )

            Spacer()

            // 3. Video (disabled)
            ControlCircleButtonView(
                iconName: "video.fill",
                backgroundColor: Color.black.opacity(0.3),
                iconColor: .white.opacity(0.4)
            )

            Spacer()

            // 4. Flip Camera (disabled)
            ControlCircleButtonView(
                iconName: "arrow.triangle.2.circlepath.camera.fill",
                backgroundColor: Color.black.opacity(0.3),
                iconColor: .white.opacity(0.4)
            )

            Spacer()

            // 5. End Call (enabled)
            ControlCircleButton(
                iconName: "phone.down.fill",
                backgroundColor: Color(hex: "E53935"),
                iconColor: .white,
                action: onCancelCall
            )
        }
        .padding(.horizontal, 24)
        .padding(.bottom, 32)
        .padding(.top, 12)
    }
}
#endif
