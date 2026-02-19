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

struct PopinCallStateView: View {
    @EnvironmentObject private var _room: Room
    @Environment(\.liveKitUIOptions) private var _ui: UIOptions
    @EnvironmentObject private var viewModel: VideoCallViewModel
    @EnvironmentObject private var configHolder: PopinConfigHolder

    @State private var primaryParticipantId: String?
    @State private var hasConnected = false
    @StateObject private var waitingPipHandler = PiPHandler()

    var callId: Int?
    var userId: Int?

    init(callId: Int? = nil, userId: Int? = nil) {
        self.callId = callId
        self.userId = userId
    }

    // Computed product properties
    private var productId: String? {
        configHolder.config.product?.id ?? PopinCallManager.shared.callData?.productId
    }
    private var productName: String? {
        configHolder.config.product?.name ?? PopinCallManager.shared.callData?.productName
    }
    private var productImageUrl: String? {
        configHolder.config.product?.image ?? PopinCallManager.shared.callData?.productImage
    }
    private var productUrl: String? {
        configHolder.config.product?.url
    }
    private var productDescription: String? {
        configHolder.config.product?.description
    }
    private var productExtra: String? {
        configHolder.config.product?.extra
    }
    
    func buildNotConnectedView() -> some View {
        // Get call information from PopinCallManager
        let manager = PopinCallManager.shared

        return NotConnectedView(
            callerName: manager.callData?.displayName ?? "Unknown Caller",
            callId: manager.callData?.callId ?? 0,
            callComponentId: manager.callData?.callComponentId ?? 0,
            callUUID: manager.callUUID ?? UUID(),
            artifact: manager.callData?.artifact ?? "",
            callRole: manager.callData?.role ?? 0,
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
                    if newState == .connected {
                        hasConnected = true
                    }
                }
        } else if _room.connectionState == .disconnected && hasConnected {
             // Disconnected after being accepted - show empty view while controller dismisses
             Color.black
                 .onAppear {
                     PopinLogger.shared.log("PopinCallStateView: room .disconnected after hasConnected — firing onRoomDisconnected (disconnectError=\(String(describing: _room.disconnectError)))")
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
            // Full screen self video preview or black screen when camera is off
            if !configHolder.config.audioOnlyMode && viewModel.preCallCameraEnabled {
                LocalCameraPreview()
                    .ignoresSafeArea()
            } else {
                Color.black
                    .ignoresSafeArea()
            }

            // Gradient overlay at bottom for controls visibility
            VStack {
                Spacer()
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
            }
            .ignoresSafeArea()

            // Content overlay
            VStack {
                // Top controls — PiP button + product details (identical style to connected view)
                TopControls(
                    onPipClick: {
                        waitingPipHandler.startPictureInPicture()
                    },
                    productId: productId,
                    productName: productName,
                    productUrl: productUrl,
                    productImageUrl: productImageUrl,
                    productDescription: productDescription,
                    productExtra: productExtra
                )

                Spacer()

                // "Connecting..." label at vertical center
                HStack(spacing: 8) {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                    Text("Connecting...")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .semibold))
                }

                Spacer()

                // Bottom controls matching BottomControls.swift style
                WaitingBottomControls(viewModel: viewModel, audioOnlyMode: configHolder.config.audioOnlyMode, onCancelCall: {
                    viewModel.onCancelCall?()
                })
            }
        }
    }
}

#endif
