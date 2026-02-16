//
//  PopinCallInteractor.swift
//  PopinCall
//
//  Created by Ashwin Nath on 15/11/22.
//

import Foundation

public struct Agent: Codable {
    public let id: Int?
    public let name: String?
    public let image: String?
}

public struct TalkModel : Codable {
    public let id: Int?
    public let user_id: Int?
    public let room: String?
    public let websocket: String? // LiveKit websocket URL
    public let status: Int
    
    public let agent: Agent?
    public let seller_id: Int?
    public let agent_id: Int?
    public let user_name: String?
    public let user_mobile: String?
    public let agents: [Agent]?
    public let created_at: Double?
    
    private let token: String?
    private let server_access_token: String?
    
    public var access_token: String? {
        return server_access_token ?? token
    }
    
    enum CodingKeys: String, CodingKey {
        case id, user_id, token, room, websocket, status
        case agent, seller_id, agent_id, user_name, user_mobile, agents, created_at
        case server_access_token = "access_token"
    }
}

class PopinCallInteractor {
    
    func getAccessToken(seller_id: Int) async throws -> TalkModel {
        let parameters: [String: Any] = ["seller_id":seller_id];
        let urlString = serverURL + "/user/call";
        // Headers are handled by Utilities automatically if we don't pass them, 
        // but the original code passed headers explicitly.
        // Utilities.shared.getHeaders() is used by default in request() if headers is nil.
        // Original code:
        // "Authorization": "Bearer " + Utilities.shared.getUserToken(),
        // "Accept": "application/json"
        // This is exactly what Utilities.shared.getHeaders() does.
        
        return try await Utilities.shared.request(urlString: urlString, method: "POST", parameters: parameters)
    }
    
    
    
    func endOngoingCall(call_id: Int) async throws {
        let parameters: [String: Any] = ["call_id":call_id];
        let urlString = serverURL + "/user/call/end";
        
        let _: StatusModel = try await Utilities.shared.request(urlString: urlString, method: "POST", parameters: parameters)
    }
    
}