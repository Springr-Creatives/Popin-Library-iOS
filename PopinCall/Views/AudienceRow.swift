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
                // Agent Tile (Static)
                if let agent = agent {
                    AgentTile(agent: agent, participant: agentParticipant)
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

    var body: some View {
        VStack(spacing: 4) {
            // Agent Image Container
            ZStack(alignment: .bottomLeading) {
                if let imageUrl = agent.image, let url = URL(string: imageUrl) {
                    AsyncImage(url: url) { phase in
                        if let image = phase.image {
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                        } else {
                            Color.gray.opacity(0.3) // Placeholder
                        }
                    }
                    .frame(width: 90, height: 120)
                    .clipped()
                    .cornerRadius(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.white.opacity(0.3), lineWidth: 1)
                    )
                } else {
                    // Fallback if no image URL
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.gray.opacity(0.3))
                        .frame(width: 90, height: 120)
                        .overlay(
                            Image(systemName: "person.fill")
                                .font(.system(size: 24))
                                .foregroundColor(.white.opacity(0.6))
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.white.opacity(0.3), lineWidth: 1)
                        )
                }
                
                // Indicators (Mute & Signal)
                if let participant = participant {
                    AgentIndicators(participant: participant)
                }
            }

            // Agent Name
            Text(agent.name ?? "Agent")
                .font(.system(size: 12))
                .fontWeight(.medium)
                .foregroundColor(.white)
                .lineLimit(1)
                .truncationMode(.tail)
                .frame(width: 90)
        }
    }
}

private struct AgentIndicators: View {
    @ObservedObject var participant: Participant
    
    var body: some View {
        HStack {
            // Mute indicator
            if !participant.isMicrophoneEnabled() {
                ZStack {
                    Circle()
                        .fill(Color.black.opacity(0.6))
                        .frame(width: 24, height: 24)

                    Image(systemName: "mic.slash.fill")
                        .font(.system(size: 10))
                        .foregroundColor(.white)
                }
            }

            Spacer()

            // Signal strength
            SignalStrengthView(quality: participant.connectionQuality)
        }
        .padding(6)
    }
}

private struct AudienceRowTile: View {
    @ObservedObject var participant: Participant
    @Binding var primaryParticipantId: String?

    var body: some View {
        VStack(spacing: 4) {
            ZStack(alignment: .bottomLeading) {
                // Video view or no video placeholder
                ZStack {
                    ParticipantView(showInformation: false)
                        .environmentObject(participant)
                        .frame(width: 90, height: 120)
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.white.opacity(0.3), lineWidth: 1)
                        )

                    if !participant.isCameraEnabled() {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.black.opacity(0.8))
                            .frame(width: 90, height: 120)

                        Image(systemName: "video.slash.fill")
                            .font(.system(size: 24))
                            .foregroundColor(.white.opacity(0.6))
                    }
                }

                // Bottom overlay: mute indicator (left) and signal strength (right)
                HStack {
                    // Mute indicator
                    if !participant.isMicrophoneEnabled() {
                        ZStack {
                            Circle()
                                .fill(Color.black.opacity(0.6))
                                .frame(width: 24, height: 24)

                            Image(systemName: "mic.slash.fill")
                                .font(.system(size: 10))
                                .foregroundColor(.white)
                        }
                    }

                    Spacer()

                    // Signal strength
                    SignalStrengthView(quality: participant.connectionQuality)
                }
                .padding(6)
            }

            // Participant name
            Text(participant.name ?? "Unknown")
                .font(.system(size: 12))
                .fontWeight(.medium)
                .foregroundColor(.white)
                .lineLimit(1)
                .truncationMode(.tail)
                .frame(width: 90)
        }
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
        case .excellent: return 3
        case .good: return 2
        case .poor: return 1
        default: return 0
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
        if quality != .unknown {
            HStack(alignment: .bottom, spacing: 1.5) {
                ForEach(0..<3, id: \.self) { index in
                    RoundedRectangle(cornerRadius: 1)
                        .fill(index < barCount ? barColor : Color.white.opacity(0.3))
                        .frame(width: 3, height: CGFloat(6 + index * 4))
                }
            }
            .padding(4)
            .background(Color.black.opacity(0.6))
            .cornerRadius(4)
        }
    }
}
#endif

