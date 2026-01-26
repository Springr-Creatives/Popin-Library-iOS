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

#if canImport(UIKit)
public struct PopinConference: View {
    @EnvironmentObject private var _room: Room
    @Environment(\.liveKitUIOptions) private var _ui: UIOptions
    @EnvironmentObject private var viewModel: VideoCallViewModel

    @State private var primaryParticipantId: String?
    @State private var hasConnected = false

    public var callId: Int?
    public var userId: Int?

    public init(callId: Int? = nil, userId: Int? = nil) {
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

    public var body: some View {
        // Show different views based on connection state
        if !viewModel.callAccepted {
            // Not accepted yet (Ringing) - show not connected view
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
}
#endif
