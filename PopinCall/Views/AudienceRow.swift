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
    @Binding var primaryParticipantId: String?

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 12) {
                ForEach(participants) { participant in
                    AudienceRowTile(participant: participant, primaryParticipantId: $primaryParticipantId)
                }
            }
            .padding(.horizontal, 16)
        }
        .frame(height: 140)
    }
}

private struct AudienceRowTile: View {
    @ObservedObject var participant: Participant
    @Binding var primaryParticipantId: String?

    var body: some View {
        ZStack {
            Color.black

            if participant.isCameraEnabled() {
                ParticipantView(showInformation: false)
                    .environmentObject(participant)
            } else {
                Image(systemName: "video.slash.fill")
                    .font(.system(size: 24))
                    .foregroundColor(.white.opacity(0.6))
            }
        }
        .frame(width: 100, height: 140)
        .cornerRadius(8)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.white.opacity(0.3), lineWidth: 1)
        )
        .onTapGesture {
            if let sid = participant.sid?.stringValue {
                withAnimation {
                    primaryParticipantId = sid
                }
            }
        }
    }
}
#endif

