//
//  ConnectView.swift
//  Popin
//
//  Created by Ashwin on 09/09/25.
//

import SwiftUI
#if canImport(UIKit)
import LiveKit
import LiveKitComponents
import AVKit


struct PopinConnectedView: View {

    @EnvironmentObject private var _room: Room
    @Environment(\.liveKitUIOptions) private var _ui: UIOptions
    @Environment(\.scenePhase) private var scenePhase

    @State private var primaryParticipantId: String?
    @StateObject private var pipHandler = PiPHandler()
    @State private var pipSupported = AVPictureInPictureController.isPictureInPictureSupported()

    // Maintain a persistent order of participant SIDs to prevents random shifting
    @State private var participantOrder: [String] = []

    // Get view model and config from environment
    @EnvironmentObject private var viewModel: VideoCallViewModel
    @EnvironmentObject private var configHolder: PopinConfigHolder
    
    
    private func enableHardware() async {
        // Camera and microphone are already enabled in VideoCallSwiftUIView
        // This function is kept for potential future hardware configuration
        // but currently does nothing to avoid re-enabling already active devices
    }
    
    private func syncParticipantOrder() {
        let allParticipants = _room.allParticipants.values
        var currentSids = Set<String>()
        
        // 1. Collect all valid SIDs from the room
        for p in allParticipants {
            if let sid = p.sid?.stringValue {
                currentSids.insert(sid)
            }
        }
        
        // 2. Remove stale SIDs from our order list
        var newOrder = participantOrder.filter { currentSids.contains($0) }
        
        // 3. Find new participants not yet in our order
        let existingSids = Set(newOrder)
        let newParticipants = allParticipants.filter { p in
            guard let sid = p.sid?.stringValue else { return false }
            return !existingSids.contains(sid)
        }
        
        // 4. Sort new participants by joinedAt (to maintain initial stable order)
        let sortedNew = newParticipants.sorted { p1, p2 in
            if p1 is LocalParticipant { return true }
            if p2 is LocalParticipant { return false }
            
            let date1 = p1.joinedAt ?? Date.distantPast
            let date2 = p2.joinedAt ?? Date.distantPast
            
            if date1 != date2 {
                return date1 < date2
            }
            return (p1.sid?.stringValue ?? "") < (p2.sid?.stringValue ?? "")
        }
        
        // 5. Append new SIDs
        for p in sortedNew {
            if let sid = p.sid?.stringValue {
                newOrder.append(sid)
            }
        }
        
        // 6. If LocalParticipant is present but wasn't at index 0 initially (and no primary selected),
        // we might want to enforce it? No, let the natural sort handle it.
        // However, we must ensure the list is not empty if participants exist.
        
        if participantOrder != newOrder {
            participantOrder = newOrder
        }
    }
    
    private var sortedParticipants: [Participant] {
        // Map the maintained order to actual Participant objects
        var ordered: [Participant] = []
        let allMap = _room.allParticipants
        
        for sid in participantOrder {
            // _room.allParticipants uses Sid object as key, not string.
            // We need to find the participant with this sid string.
            if let participant = allMap.values.first(where: { $0.sid?.stringValue == sid }) {
                ordered.append(participant)
            }
        }
        
        // Fallback: If for some reason the order list is desynced or empty but we have participants
        // (e.g. initial load), use the stable sort as backup.
        if ordered.isEmpty && !_room.allParticipants.isEmpty {
            return Array(_room.allParticipants.values).sorted { p1, p2 in
                if p1 is LocalParticipant { return true }
                if p2 is LocalParticipant { return false }
                let d1 = p1.joinedAt ?? Date.distantPast
                let d2 = p2.joinedAt ?? Date.distantPast
                return d1 < d2
            }
        }
        
        return ordered
    }

    // Computed product properties - prefer config product (outgoing calls) over callData (incoming calls)
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

    @ViewBuilder
    private var overlayControls: some View {
        VStack(spacing: 0) {
            // Top controls with PiP button and product details
            TopControls(
                onPipClick: {
                    // Enable PiP when PiP button is clicked
                    pipHandler.startPictureInPicture()
                },
                productId: productId,
                productName: productName,
                productUrl: productUrl,
                productImageUrl: productImageUrl,
                productDescription: productDescription,
                productExtra: productExtra
            )

            Spacer()

            // Remote participants Row
            if sortedParticipants.count > 1 {
                AudienceRow(
                    participants: Array(sortedParticipants.dropFirst()),
                    primaryParticipantId: $primaryParticipantId
                )
                .padding(.bottom, 8)
            }

            // Bottom Controls
            BottomControls(onEndCall: {
                // Mark that user is ending the call
                viewModel.isUserEndingCall = true

                // Call the end API
                viewModel.onEndCall?()

                // Disconnect from the room
                Task {
                    await _room.disconnect()
                }
            })
        }
    }

    var body: some View {
        ZStack {
            // Primary participant view (full screen) with PiP support
            if let primaryParticipant = sortedParticipants.first {
                PrimaryParticipantView(
                    participant: primaryParticipant,
                    pipHandler: pipHandler,
                    pipSupported: pipSupported
                )
            } else {
                Color.black
            }

            // Overlay for remote participants and controls
            overlayControls
        }
        .ignoresSafeArea(.all, edges: .bottom)
        .task {
            await enableHardware()
            // Initial sync
            syncParticipantOrder()
        }
        // Watch for participant changes to sync order
        .onChange(of: _room.remoteParticipants.count) { _ in
            syncParticipantOrder()
        }
        // Also watch for local participant SID assignment
        .onChange(of: _room.localParticipant.sid) { _ in
            syncParticipantOrder()
        }
        .onChange(of: _room.connectionState) { newState in
            print("ROOM CHANGE -> \(newState)")
            
            if newState == .connected {
                syncParticipantOrder()
            }
            
            // Handle room disconnection (when not user-initiated)
            if newState == .disconnected && !viewModel.isUserEndingCall {
                print("Room disconnected externally - closing without end API")
                viewModel.onRoomDisconnected?()
            }
        }
        // Handle Primary Participant Selection (Swap Logic)
        .onChange(of: primaryParticipantId) { newId in
             guard let newId = newId, !participantOrder.isEmpty else { return }
             
             if let targetIndex = participantOrder.firstIndex(of: newId) {
                 if targetIndex != 0 {
                     // Perform the swap on the persistent state
                     withAnimation {
                         participantOrder.swapAt(0, targetIndex)
                     }
                 }
             }
        }
        .onChange(of: scenePhase) { oldPhase, newPhase in
            // Automatically enable PiP when app goes to background
            if newPhase == .background && pipSupported {
                pipHandler.startPictureInPicture()
            }
        }
    }
}

// MARK: - Primary Participant View

struct PrimaryParticipantView: View {
    @ObservedObject var participant: Participant
    let pipHandler: PiPHandler
    let pipSupported: Bool

    var body: some View {
        ZStack {
            if pipSupported {
                let cameraReference = TrackReference(participant: participant, source: .camera)
                if let trackPublication = cameraReference.resolve(),
                   let videoTrack = trackPublication.track as? VideoTrack {
                    // Use PiP-enabled view for primary participant
                    PiPView(track: videoTrack, pipHandler: pipHandler)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.black)
                        .ignoresSafeArea()
                } else {
                    // Fallback to regular ParticipantView
                    ParticipantView(showInformation: false)
                        .environmentObject(participant)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.black)
                }
            } else {
                // PiP not supported, use regular ParticipantView
                ParticipantView(showInformation: false)
                    .environmentObject(participant)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.black)
            }

            // Show no video icon when camera is disabled
            if !participant.isCameraEnabled() {
                Image(systemName: "video.slash.fill")
                    .font(.system(size: 64))
                    .foregroundColor(.white.opacity(0.6))
            }
        }
    }
}

// MARK: - Color Extension for Hex Support

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
#endif
