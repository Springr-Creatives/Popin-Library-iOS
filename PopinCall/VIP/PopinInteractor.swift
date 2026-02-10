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

    func registerUser(seller_id: Int, name: String, contactInfo: String, campaign: String) async throws -> Int {
        let isEmail = contactInfo.contains("@")
        
        // Basic validation
        if isEmail {
            if !contactInfo.contains(".") || contactInfo.count < 5 {
                throw InteractorError.validationFailed
            }
        } else {
            if contactInfo.count < 8 {
                throw InteractorError.validationFailed
            }
        }

        var parameters: [String: Any] = [
            "seller_id": seller_id,
            "is_mobile": 3, //3 for iosSDK
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
        let mobileToken = Utilities.shared.getPushToken()
        if !mobileToken.isEmpty {
            parameters["mobile_token"] = mobileToken
        }
   
        let urlString = serverURL + "/website/user/login"
        
        let userModel: UserModel = try await Utilities.shared.request(urlString: urlString, method: "POST", parameters: parameters)
        
        if (userModel.status == 1) {
            Utilities.shared.saveUser(user: userModel)
            return userModel.user_id ?? 0
        } else {
            throw InteractorError.apiError(userModel.message)
        }
    }
    
    func startConnection(seller_id: Int) async throws -> Int {
        let parameters: [String: Any] = ["seller_id":seller_id];
        let urlString = serverURL + "/user/connect";
        
        let statusModel: StatusModel = try await Utilities.shared.request(urlString: urlString, method: "POST", parameters: parameters)
        
        if statusModel.status == 1, let callQueueId = statusModel.call_queue_id {
            return callQueueId
        } else {
             throw InteractorError.apiError(statusModel.message)
        }
    }
    
    func setGroup(identifier: String) async throws {
        let parameters: [String: Any] = ["groupId": identifier]
        let urlString = serverURL + "/user/group"
        let response: StatusModel = try await Utilities.shared.request(urlString: urlString, method: "POST", parameters: parameters)
        if response.status != 1 {
            throw InteractorError.apiError(response.message)
        }
    }

    func getCallDetails(callId: Int) async throws -> TalkModel {
        let urlString = serverURL + "/user/call/\(callId)"
        
        let talkModel: TalkModel = try await Utilities.shared.request(urlString: urlString, method: "GET")
        
        if talkModel.status == 1 {
            return talkModel
        } else {
            throw InteractorError.apiError(nil)
        }
    }
}

struct UserModel : Codable{
    let status: Int;
    let user_id: Int?;
    let token: String?;
    let channel: String?;
    let message: String?;
}
struct StatusModel : Codable{
    let status: Int;
    let call_id: Int?;
    let call_queue_id: Int?;
    let position: Int?;
    let message: String?;
}

struct InviteParticipantModel: Codable {
    let status: Int
    let url: String?
}
