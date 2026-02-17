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

// Helper for cross-version onChange compatibility
extension View {
    @ViewBuilder
    func onChangeCompatible<V: Equatable>(of value: V, perform action: @escaping (V) -> Void) -> some View {
        if #available(iOS 17.0, *) {
            self.onChange(of: value) { _, newValue in
                action(newValue)
            }
        } else {
            self.onChange(of: value, perform: action)
        }
    }
}

struct PopinConnectedView: View {

    @EnvironmentObject private var _room: Room
    @Environment(\.liveKitUIOptions) private var _ui: UIOptions
    @Environment(\.scenePhase) private var scenePhase

    @State private var primaryParticipantId: String?
    @StateObject private var pipHandler = PiPHandler()
    @State private var pipSupported = AVPictureInPictureController.isPictureInPictureSupported()
    @State private var showChat = false

    // Maintain a persistent order of participant SIDs to prevents random shifting
    @State private var participantOrder: [String] = []

    // Get view model and config from environment
    @EnvironmentObject private var viewModel: VideoCallViewModel
    @EnvironmentObject private var configHolder: PopinConfigHolder

    // Chat toast state
    @ObservedObject private var chatManager = ChatManager.shared
    @State private var toastMessage: String? = nil
    @State private var toastTimer: Timer? = nil

    // Network state tracking (matches Android CallActivity)
    @State private var previousHasCustomerNetworkIssue: Bool = false
    @State private var previousHasSellerNetworkIssue: Bool = false
    @State private var participantCheckTimer: Timer? = nil
    
    
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
        
        // 4. Sort new participants - prioritize agent/seller (identity starts with 's')
        let sortedNew = newParticipants.sorted { p1, p2 in
            let identity1 = p1.identity?.stringValue ?? ""
            let identity2 = p2.identity?.stringValue ?? ""

            let isSeller1 = identity1.hasPrefix("s")
            let isSeller2 = identity2.hasPrefix("s")

            // Seller/agent comes first
            if isSeller1 && !isSeller2 { return true }
            if !isSeller1 && isSeller2 { return false }

            // If both are sellers or both are not, sort by joinedAt
            let date1 = p1.joinedAt ?? Date.distantPast
            let date2 = p2.joinedAt ?? Date.distantPast

            if date1 != date2 {
                return date1 < date2
            }
            return (p1.sid?.stringValue ?? "") < (p2.sid?.stringValue ?? "")
        }
        
        // 5. Append new SIDs - but prioritize sellers to the front if no seller is currently primary
        for p in sortedNew {
            if let sid = p.sid?.stringValue {
                let identity = p.identity?.stringValue ?? ""
                if identity.hasPrefix("s") && !newOrder.isEmpty {
                    // Check if the current primary is a seller
                    let firstSid = newOrder[0]
                    let firstParticipant = _room.allParticipants.values.first(where: { $0.sid?.stringValue == firstSid })
                    let firstIsSeller = firstParticipant?.identity?.stringValue.hasPrefix("s") ?? false
                    
                    if !firstIsSeller {
                        newOrder.insert(sid, at: 0)
                        continue
                    }
                }
                newOrder.append(sid)
            }
        }
        
        if participantOrder != newOrder {
            participantOrder = newOrder
        }
    }

    private func showToast(message: String) {
        // Cancel any existing timer
        toastTimer?.invalidate()

        // Show the toast
        withAnimation {
            toastMessage = message
        }

        // Auto-dismiss after 4 seconds
        toastTimer = Timer.scheduledTimer(withTimeInterval: 4.0, repeats: false) { _ in
            dismissToast()
        }
    }

    private func dismissToast() {
        toastTimer?.invalidate()
        toastTimer = nil
        withAnimation {
            toastMessage = nil
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
        // (e.g. initial load), use the stable sort as backup - prioritize agent/seller (identity starts with 's')
        if ordered.isEmpty && !_room.allParticipants.isEmpty {
            return Array(_room.allParticipants.values).sorted { p1, p2 in
                let identity1 = p1.identity?.stringValue ?? ""
                let identity2 = p2.identity?.stringValue ?? ""

                let isSeller1 = identity1.hasPrefix("s")
                let isSeller2 = identity2.hasPrefix("s")

                // Seller/agent comes first
                if isSeller1 && !isSeller2 { return true }
                if !isSeller1 && isSeller2 { return false }

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

    /// Determines which network badge to show (only one at a time, by priority)
    @ViewBuilder
    private var networkBadge: some View {
        if viewModel.hasCustomerNetworkIssue && !viewModel.showCustomerBackOnlineMessage && !viewModel.showSellerRejoinedMessage {
            // Priority 1: Customer's own network lost
            NetworkToastView(text: "Your network lost", type: .warning)
                .transition(.opacity)
        } else if viewModel.hasSellerNetworkIssue && !viewModel.showCustomerBackOnlineMessage && !viewModel.showSellerRejoinedMessage && !viewModel.hasCustomerNetworkIssue {
            // Priority 2: Seller/agent network lost
            NetworkToastView(text: "Expert's network lost", type: .warning)
                .transition(.opacity)
        } else if viewModel.showCustomerBackOnlineMessage && !viewModel.showSellerRejoinedMessage {
            // Priority 3: Customer back online (temporary, 5 sec)
            NetworkToastView(text: "You're back online", type: .success)
                .transition(.opacity)
        } else if viewModel.showSellerRejoinedMessage {
            // Priority 4: Seller rejoined (temporary, 5 sec)
            NetworkToastView(text: "Expert rejoined", type: .success)
                .transition(.opacity)
        } else if viewModel.noQualifyingParticipantsTimer > 5000 && !viewModel.hasCustomerNetworkIssue && !viewModel.hasSellerNetworkIssue {
            // Priority 5: Trying to reconnect (no qualifying participants for > 5 sec)
            NetworkToastView(text: "Trying to reconnect...", type: .warning)
                .transition(.opacity)
        } else if !_room.localParticipant.isMicrophoneEnabled() && !showChat {
            // Priority 6 (lowest): You're on mute
            NetworkToastView(text: "You're on mute", type: .info)
                .transition(.opacity)
        }
    }

    @ViewBuilder
    private var overlayControls: some View {
        VStack(spacing: 0) {
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

                // Network / status badge (one at a time, by priority)
                networkBadge
                    .padding(.top, 8)
                    .animation(.easeInOut(duration: 0.3), value: viewModel.hasCustomerNetworkIssue)
                    .animation(.easeInOut(duration: 0.3), value: viewModel.hasSellerNetworkIssue)
                    .animation(.easeInOut(duration: 0.3), value: viewModel.showCustomerBackOnlineMessage)
                    .animation(.easeInOut(duration: 0.3), value: viewModel.showSellerRejoinedMessage)
                    .animation(.easeInOut(duration: 0.3), value: viewModel.noQualifyingParticipantsTimer)
            }
            .frame(maxWidth: .infinity, alignment: .top)

            Spacer()

            // Chat toast - appears when new message arrives
            if let message = toastMessage, !showChat {
                ChatDetailsToast(
                    message: message,
                    showBadge: chatManager.unreadCount > 0,
                    onTap: {
                        dismissToast()
                        showChat = true
                    }
                )
                .padding(.horizontal, 40)
                .padding(.bottom, 8)
                .transition(.move(edge: .bottom).combined(with: .opacity))
                .animation(.easeInOut(duration: 0.3), value: toastMessage)
            }

            // Remote participants Row
            let currentAgent = viewModel.call?.agent
            
            // Find participant for agent (to show mute/signal status)
            let agentParticipant: Participant? = {
                guard let agentId = currentAgent?.id else { return nil }
                let idString = String(agentId)
                
                // Try exact match first
                if let exact = _room.allParticipants.values.first(where: {
                    let identity = $0.identity?.stringValue ?? ""
                    return identity == idString || identity == "s\(idString)"
                }) {
                    return exact
                }
                
                // Try prefix match (s{id}*)
                if let prefixMatch = _room.allParticipants.values.first(where: {
                    let identity = $0.identity?.stringValue ?? ""
                    return identity.hasPrefix("s\(idString)")
                }) {
                    return prefixMatch
                }
                
                return nil
            }()

            if sortedParticipants.count > 1 || currentAgent != nil {
                // Get audience participants (everyone except the first/primary)
                let audienceParticipants = Array(sortedParticipants.dropFirst())

                let _ = PopinLogger.shared.log("🟣 Audience participants: \(audienceParticipants.map { $0.sid?.stringValue ?? "?" })")
                let _ = PopinLogger.shared.log("🟣 Current agent: \(currentAgent?.name ?? "nil")")

                // Always show static AgentTile (if agent exists)
                // Don't filter out agent from audience - they can appear as both static tile AND live video tile
                AudienceRow(
                    participants: audienceParticipants,
                    agent: currentAgent,  // Always show static AgentTile if agent exists
                    agentParticipant: agentParticipant,
                    primaryParticipantId: $primaryParticipantId,
                    expertDesignation: configHolder.config.expertDesignation
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
            }, showChat: $showChat)
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
            if newState == .connected {
                syncParticipantOrder()
            }
            
            // Handle room disconnection (when not user-initiated)
            if newState == .disconnected && !viewModel.isUserEndingCall {
                viewModel.onRoomDisconnected?()
            }
        }
        // Handle Primary Participant Selection (Swap Logic)
        .onChange(of: primaryParticipantId) { newId in
             guard let newId = newId, !participantOrder.isEmpty else {
                 PopinLogger.shared.log("Swap: ignored — newId=\(newId ?? "nil"), orderEmpty=\(participantOrder.isEmpty)")
                 return
             }

             PopinLogger.shared.log("Swap: requested sid=\(newId), participantOrder=\(participantOrder)")

             if let targetIndex = participantOrder.firstIndex(of: newId) {
                 if targetIndex != 0 {
                     PopinLogger.shared.log("Swap: swapping index 0 (\(participantOrder[0])) with index \(targetIndex) (\(participantOrder[targetIndex]))")
                     // Perform the swap on the persistent state
                     withAnimation {
                         participantOrder.swapAt(0, targetIndex)
                     }
                     PopinLogger.shared.log("Swap: new order=\(participantOrder)")
                 } else {
                     PopinLogger.shared.log("Swap: already at index 0, no swap needed")
                 }
             } else {
                 PopinLogger.shared.log("Swap: sid \(newId) NOT found in participantOrder")
             }
        }
        .onChangeCompatible(of: scenePhase) { newPhase in
            // Automatically enable PiP when app goes to background
            if newPhase == .background && pipSupported {
                pipHandler.startPictureInPicture()
            }
        }
        .onChange(of: showChat) { show in
            if show {
                // Chat opened -> Start PiP if supported
                if pipSupported {
                    pipHandler.startPictureInPicture()
                }
                // Dismiss any active toast
                dismissToast()
            } else {
                 // Chat closed -> Stop PiP
                 pipHandler.stopPictureInPicture()
            }
        }
        .onReceive(NotificationCenter.default.publisher(for: .pipDidStop)) { _ in
            // PiP restored (user tapped fullscreen button)
            // If chat is open, close it to show full screen video
            if showChat {
                showChat = false
            }
        }
        .onReceive(NotificationCenter.default.publisher(for: .pipDidClose)) { _ in
            // PiP closed (user tapped X button) — disconnect the call
            viewModel.isUserEndingCall = true
            viewModel.onEndCall?()
            Task {
                await _room.disconnect()
            }
        }
        .onChange(of: chatManager.latestIncomingMessage) { newMessage in
            // Show toast when new incoming message arrives
            if let message = newMessage, let text = message.text, !text.isEmpty, !showChat {
                showToast(message: text)
            }
        }
        // MARK: - Network Monitoring

        // Listen for Pusher connection state changes (customer's own network)
        .onReceive(NotificationCenter.default.publisher(for: .pusherConnectionStateChanged)) { notification in
            if let isConnected = notification.userInfo?["isConnected"] as? Bool {
                viewModel.hasCustomerNetworkIssue = !isConnected
            }
        }
        // Track when customer network issue resolves -> show "You're back online" for 5 sec
        .onChange(of: viewModel.hasCustomerNetworkIssue) { newValue in
            if previousHasCustomerNetworkIssue && !newValue {
                viewModel.showCustomerBackOnlineMessage = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                    viewModel.showCustomerBackOnlineMessage = false
                }
            }
            previousHasCustomerNetworkIssue = newValue
        }
        // Track when seller network issue resolves -> show "Expert rejoined" for 5 sec
        .onChange(of: viewModel.hasSellerNetworkIssue) { newValue in
            if previousHasSellerNetworkIssue && !newValue {
                viewModel.showSellerRejoinedMessage = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                    viewModel.showSellerRejoinedMessage = false
                }
            }
            previousHasSellerNetworkIssue = newValue
        }
        // Monitor remote participant connection quality for seller network issues
        .onReceive(Timer.publish(every: 1, on: .main, in: .common).autoconnect()) { _ in
            guard _room.connectionState == .connected else { return }

            // Check connection quality for seller/agent participants
            for (_, participant) in _room.remoteParticipants {
                let identity = participant.identity?.stringValue ?? ""
                if identity.lowercased().hasPrefix("s") {
                    let hasNetworkIssue = participant.connectionQuality == .lost
                    if viewModel.hasSellerNetworkIssue != hasNetworkIssue {
                        viewModel.hasSellerNetworkIssue = hasNetworkIssue
                    }
                }
            }

            // Monitor no-qualifying-participants timer (matching Android 30-sec auto-end)
            var hasQualifyingParticipant = false
            for (_, participant) in _room.remoteParticipants {
                let identity = participant.identity?.stringValue ?? ""
                if identity.lowercased().hasPrefix("s") || identity.lowercased().hasPrefix("q") {
                    if !viewModel.hasCustomerNetworkIssue {
                        hasQualifyingParticipant = true
                    }
                }
            }

            if hasQualifyingParticipant {
                viewModel.noQualifyingParticipantsTimer = 0
            } else {
                viewModel.noQualifyingParticipantsTimer += 1000

                // End call if no qualifying participants for 30 seconds
                if viewModel.noQualifyingParticipantsTimer >= 30000 {
                    viewModel.isUserEndingCall = true
                    viewModel.onEndCall?()
                    Task {
                        await _room.disconnect()
                    }
                }
            }
        }
    }
}

// MARK: - Primary Participant View

struct PrimaryParticipantView: View {
    @ObservedObject var participant: Participant
    let pipHandler: PiPHandler
    let pipSupported: Bool

    // Prefer screen share track over camera (matching Android PrimarySpeakerView)
    private var preferredVideoTrack: VideoTrack? {
        if let screenTrack = participant.firstScreenShareVideoTrack {
            return screenTrack
        }
        return participant.firstCameraVideoTrack
    }

    var body: some View {
        ZStack {
            if pipSupported, let track = preferredVideoTrack {
                PiPView(track: track, pipHandler: pipHandler)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.black)
                    .ignoresSafeArea()
            } else {
                ParticipantView(showInformation: false)
                    .environmentObject(participant)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.black)
            }

            // Show no video icon when no video is available
            if preferredVideoTrack == nil {
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
