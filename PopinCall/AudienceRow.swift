//
//  AudienceRow.swift
//  Popin
//
//  Created by Ashwin on 09/09/25.
//

import SwiftUI
import LiveKit
import LiveKitComponents

struct AudienceRow: View {
    let participants: [Participant]
    @Binding var primaryParticipantId: String?

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                ForEach(participants) { participant in
                    ParticipantTile(
                        participant: participant,
                        primaryParticipantId: $primaryParticipantId
                    )
                }
            }
            .padding(.leading, 10)
            .padding(.trailing, 16)
        }
    }
}
