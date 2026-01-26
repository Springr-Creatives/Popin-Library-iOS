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
                    ParticipantView(showInformation: false)
                        .environmentObject(participant)
                        .frame(width: 100, height: 140)
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.white.opacity(0.3), lineWidth: 1)
                        )
                        .onTapGesture {
                            // Swap with primary
                            if let sid = participant.sid?.stringValue {
                                withAnimation {
                                    primaryParticipantId = sid
                                }
                            }
                        }
                }
            }
            .padding(.horizontal, 16)
        }
        .frame(height: 140)
    }
}
#endif

