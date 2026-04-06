//
//  VideoCall.swift
//  Popin
//
//  Created by Ashwin Nath on 16/03/24.
//

import Foundation

struct VideoCall : Codable {
    let status: Int
    let id: Int?
    let user_id: Int?
    let connect_request_id: Int?
    let access_token: String?
    let room: String?
    let websocket: String?
    let agent: Agent?
    let seller_id: Int?
    let agent_id: Int?
    let user_name: String?
    let user_mobile: String?
    let agents: [Agent]?
    let created_at: Double?
}
