//
//  VideoCallInteractor.swift
//  Popin
//
//  Created by Ashwin Nath on 16/03/24.
//

import Foundation

class VideoCallInteractor {

    func endCall(callId: Int) async throws {
        let urlString = serverURL + "/user/call/end"
        let parameters: [String: Any] = ["call_id": callId]
        let value: StatusModel = try await Utilities.shared.request(urlString: urlString, method: "POST", parameters: parameters)

        if value.status != 1 {
            throw NSError(domain: "Popin", code: 0, userInfo: [NSLocalizedDescriptionKey: value.message ?? "Failed to end call"])
        }
    }

    func inviteParticipant(callId: Int) async throws -> String {
        let urlString = serverURL + "/user/call/participant"
        let parameters: [String: Any] = ["call_id": callId]
        let value: InviteParticipantModel = try await Utilities.shared.request(urlString: urlString, method: "POST", parameters: parameters)

        if value.status == 1, let url = value.url {
            return url
        } else {
            throw NSError(domain: "Popin", code: 0, userInfo: [NSLocalizedDescriptionKey: "Failed to generate invite link"])
        }
    }

}
