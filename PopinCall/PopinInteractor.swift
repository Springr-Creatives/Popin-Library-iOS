//
//  PopinInteractor.swift
//  PopinCall
//
//  Created by Ashwin Nath on 17/11/22.
//

import Foundation

class PopinInteractor {
    
    enum InteractorError: Error {
        case validationFailed
        case apiError(String?)
        case invalidResponse
    }

    func registerUser(seller_id: Int, name: String, contactInfo: String, campaign: String) async throws {
        let isEmail = contactInfo.contains("@")
        
        // Basic validation
        if isEmail {
            if !contactInfo.contains(".") || contactInfo.count < 5 {
                print("[DEBUG registerUser] Invalid email format: \(contactInfo)")
                throw InteractorError.validationFailed
            }
        } else {
            if contactInfo.count < 8 {
                print("[DEBUG registerUser] Invalid mobile format: \(contactInfo)")
                throw InteractorError.validationFailed
            }
        }

        var parameters: [String: Any] = [
            "seller_id": seller_id,
            "is_mobile": isEmail ? 0 : 1,
            "device": "iosSdk",
            "name": name
        ]
        
        if isEmail {
            parameters["email"] = contactInfo
        } else {
            parameters["mobile"] = contactInfo
        }
        if !campaign.isEmpty {
            parameters["campaign"] = campaign
        }
        let urlString = serverURL + "/website/user/login"
        print("[DEBUG registerUser] URL: \(urlString), params: \(parameters)")
        
        let userModel: UserModel = try await Utilities.shared.request(urlString: urlString, method: "POST", parameters: parameters)
        
        print("[DEBUG registerUser] Decoded: status=\(userModel.status), token=\(userModel.token), channel=\(userModel.channel)")
        if (userModel.status == 1) {
            Utilities.shared.saveUser(user: userModel)
        } else {
            throw InteractorError.apiError(nil)
        }
    }
    
    func startConnection(seller_id: Int) async throws -> Int {
        let parameters: [String: Any] = ["seller_id":seller_id];
        let urlString = serverURL + "/user/connect";
        
        print("[DEBUG startConnection] URL: \(urlString), params: \(parameters)")
        let statusModel: StatusModel = try await Utilities.shared.request(urlString: urlString, method: "POST", parameters: parameters)
        
        print("[DEBUG startConnection] status=\(statusModel.status), call_queue_id=\(statusModel.call_queue_id ?? -1)")
        
        if statusModel.status == 1, let callQueueId = statusModel.call_queue_id {
            return callQueueId
        } else {
             throw InteractorError.apiError(statusModel.message)
        }
    }
    
    func getCallDetails(callId: Int) async throws -> TalkModel {
        let urlString = serverURL + "/user/call/\(callId)"
        print("[DEBUG getCallDetails] URL: \(urlString)")
        
        let talkModel: TalkModel = try await Utilities.shared.request(urlString: urlString, method: "GET")
        
        print("[DEBUG getCallDetails] status=\(talkModel.status), token=\(talkModel.token ?? "nil"), websocket=\(talkModel.websocket ?? "nil")")
        if talkModel.status == 1 {
            return talkModel
        } else {
            throw InteractorError.apiError(nil)
        }
    }
}

struct UserModel : Codable{
    let status: Int;
    let token: String;
    let channel: String;
}
struct StatusModel : Codable{
    let status: Int;
    let call_id: Int?;
    let call_queue_id: Int?;
    let position: Int?;
    let message: String?;
}