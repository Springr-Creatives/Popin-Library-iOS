//
//  AudienceRow.swift
//  Popin
//
//  Created by Ashwin on 09/09/25.
//

import SwiftUI
import LiveKit
import LiveKitComponents

#if canImport(UIKit)
struct AudienceRow: View {
    let participants: [Participant]
    let agent: Agent?
    let agentParticipant: Participant?
    @Binding var primaryParticipantId: String?

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                // Agent Tile
                if let agent = agent {
                    AgentTile(agent: agent, participant: agentParticipant, primaryParticipantId: $primaryParticipantId)
                }

                ForEach(participants) { participant in
                    AudienceRowTile(participant: participant, primaryParticipantId: $primaryParticipantId)
                }
            }
            .padding(.leading, 10)
            .padding(.trailing, 16)
        }
    }
}

private struct AgentTile: View {
    let agent: Agent
    let participant: Participant?
    @Binding var primaryParticipantId: String?

    var body: some View {
        ZStack(alignment: .bottom) {
            // Always show static agent image as background
            if let imageUrl = agent.image, let url = URL(string: imageUrl) {
                AsyncImage(url: url) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    } else {
                        Color.gray.opacity(0.3)
                    }
                }
                .frame(width: 90, height: 120)
                .clipped()
            } else {
                // Fallback if no image URL
                Color.gray.opacity(0.3)
                    .frame(width: 90, height: 120)
                    .overlay(
                        Image(systemName: "person.fill")
                            .font(.system(size: 24))
                            .foregroundColor(.white.opacity(0.6))
                    )
            }

            // Bottom Gradient Overlay
            LinearGradient(
                gradient: Gradient(colors: [Color.black.opacity(0), Color(hex: "080060").opacity(0.5)]),
                startPoint: .top,
                endPoint: .bottom
            )
            .frame(height: 45)
            .allowsHitTesting(false)

            // Name and Role (Expert)
            VStack(alignment: .leading, spacing: 0) {
                Text("Expert")
                    .font(.system(size: 10))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text(agent.name ?? "Agent")
                    .font(.system(size: 12))
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                    .lineLimit(1)
                    .truncationMode(.tail)
            }
            .padding(.leading, 8)
            .padding(.bottom, 8)
            .frame(maxWidth: .infinity, alignment: .leading)
            .allowsHitTesting(false)
            
            // Indicators (Mute & Signal) at Top Right
            if let participant = participant {
                AgentIndicators(participant: participant)
                    .allowsHitTesting(false)
            }
        }
        .frame(width: 90, height: 120)
        .cornerRadius(12)
        .contentShape(Rectangle())
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color(hex: "FFFFFF"), lineWidth: 0.5)
        )
    }
}

private struct AgentIndicators: View {
    @ObservedObject var participant: Participant
    
    var body: some View {
        VStack(spacing: 4) {
            // Mute indicator
            if !participant.isMicrophoneEnabled() {
                ZStack {
                    Circle()
                        .fill(Color.black.opacity(0.7))
                        .frame(width: 20, height: 20)

                    Image(systemName: "mic.slash.fill")
                        .font(.system(size: 10))
                        .foregroundColor(.white)
                }
            }

            // Signal strength
            ZStack {
                Circle()
                    .fill(Color.black.opacity(0.7))
                    .frame(width: 20, height: 20)
                
                SignalStrengthView(quality: participant.connectionQuality)
                    .scaleEffect(0.6)
            }
        }
        .padding(6)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
    }
}

private struct AudienceRowTile: View {
    @ObservedObject var participant: Participant
    @Binding var primaryParticipantId: String?

    var body: some View {
        ZStack(alignment: .bottom) {
            // Video view or no video placeholder
            ZStack {
                ParticipantView(showInformation: false)
                    .environmentObject(participant)
                    .frame(width: 90, height: 120)

                if !participant.isCameraEnabled() {
                    Rectangle()
                        .fill(Color.black.opacity(0.8))
                        .frame(width: 90, height: 120)

                    Image(systemName: "video.slash.fill")
                        .font(.system(size: 24))
                        .foregroundColor(.white.opacity(0.6))
                }
            }

            // Bottom Gradient Overlay
            LinearGradient(
                gradient: Gradient(colors: [Color.black.opacity(0), Color(hex: "080060").opacity(0.5)]),
                startPoint: .top,
                endPoint: .bottom
            )
            .frame(height: 45)
            .allowsHitTesting(false)

            // Participant name
            Text(participant.name ?? "Unknown")
                .font(.system(size: 12))
                .fontWeight(.medium)
                .foregroundColor(.white)
                .lineLimit(1)
                .truncationMode(.tail)
                .padding(.leading, 8)
                .padding(.bottom, 8)
                .frame(maxWidth: .infinity, alignment: .leading)
                .allowsHitTesting(false)

            // Top Right Indicators
            VStack(spacing: 4) {
                // Mute indicator
                if !participant.isMicrophoneEnabled() {
                    ZStack {
                        Circle()
                            .fill(Color.black.opacity(0.7))
                            .frame(width: 20, height: 20)

                        Image(systemName: "mic.slash.fill")
                            .font(.system(size: 10))
                            .foregroundColor(.white)
                    }
                }

                // Signal strength
                ZStack {
                    Circle()
                        .fill(Color.black.opacity(0.7))
                        .frame(width: 20, height: 20)
                    
                    SignalStrengthView(quality: participant.connectionQuality)
                        .scaleEffect(0.7)
                }
            }
            .padding(6)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            .allowsHitTesting(false)
        }
        .frame(width: 90, height: 120)
        .cornerRadius(12)
        .contentShape(Rectangle())
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color(hex: "FFFFFF"), lineWidth: 0.5)
        )
        .onTapGesture {
            if let sid = participant.sid?.stringValue {
                withAnimation(.easeInOut(duration: 0.3)) {
                    primaryParticipantId = sid
                }
            }
        }
    }
}

private struct SignalStrengthView: View {
    let quality: ConnectionQuality

    private var barCount: Int {
        switch quality {
        case .excellent: return 4
        case .good: return 3
        case .poor: return 2
        default: return 1
        }
    }

    private var barColor: Color {
        switch quality {
        case .excellent: return .green
        case .good: return .yellow
        case .poor: return .orange
        default: return .red
        }
    }

    var body: some View {
        HStack(alignment: .bottom, spacing: 1.5) {
            ForEach(0..<4, id: \.self) { index in
                RoundedRectangle(cornerRadius: 1)
                    .fill(quality != .unknown && index < barCount ? barColor : Color.white.opacity(0.3))
                    .frame(width: 3, height: CGFloat(6 + index * 4))
            }
        }
    }
}
#endif

