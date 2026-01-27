//
//  PopinInteractor.swift
//  PopinCall
//
//  Created by Ashwin Nath on 17/11/22.
//

import Foundation
import Alamofire
import SwiftyJSON

class PopinInteractor {
    
    func registerUser(seller_id: Int, onSucess sucess: @escaping () -> Void, onFailure failure: @escaping () -> Void) {
        let parameters: Parameters = ["seller_id":seller_id,"is_mobile" : 1, "device": "iosSdk"];
        let urlString = serverURL + "/website/user/login";
        print("[DEBUG registerUser] URL: \(urlString), params: \(parameters)")
        AF.request(urlString, method: .post, parameters: parameters, encoding: URLEncoding.httpBody)
            .responseDecodable(of: UserModel.self) { response in
                print("[DEBUG registerUser] HTTP status: \(response.response?.statusCode ?? -1)")
                if let data = response.data, let raw = String(data: data, encoding: .utf8) {
                    print("[DEBUG registerUser] Raw response: \(raw)")
                }
                switch response.result {
                case .success(let userModel):
                    print("[DEBUG registerUser] Decoded: status=\(userModel.status), token=\(userModel.token), channel=\(userModel.channel)")
                    if (userModel.status == 1) {
                        Utilities.shared.saveUser(user: userModel)
                        sucess()
                        return;
                    }

                    failure();
                case .failure(let error):
                    print("[DEBUG registerUser] FAILURE: \(error)")
                    failure();
                }
            }
    }
    
    func startConnection(seller_id: Int, onSuccess success: @escaping (Int) -> Void, onFailure failure: @escaping () -> Void) {
        let parameters: Parameters = ["seller_id":seller_id];
        let urlString = serverURL + "/user/connect";
        let headers = Utilities.shared.getHeaders()
        print("[DEBUG startConnection] URL: \(urlString), params: \(parameters)")
        AF.request(urlString, method: .post, parameters: parameters, encoding: URLEncoding.httpBody, headers: headers)
            .responseDecodable(of: StatusModel.self) { response in
                switch response.result {
                case .success(let statusModel):
                    print("[DEBUG startConnection] status=\(statusModel.status), call_queue_id=\(statusModel.call_queue_id ?? -1)")
                    if statusModel.status == 1, let callQueueId = statusModel.call_queue_id {
                        success(callQueueId)
                    } else {
                        failure()
                    }
                case .failure(let error):
                    print("[DEBUG startConnection] FAILURE: \(error)")
                    failure()
                }
            }
    }
    func getCallDetails(callId: Int, onSuccess success: @escaping (TalkModel) -> Void, onFailure failure: @escaping () -> Void) {
        let urlString = serverURL + "/user/call/\(callId)"
        let headers = Utilities.shared.getHeaders()
        print("[DEBUG getCallDetails] URL: \(urlString)")
        AF.request(urlString, method: .get, headers: headers)
            .responseDecodable(of: TalkModel.self) { response in
                if let data = response.data, let raw = String(data: data, encoding: .utf8) {
                    print("[DEBUG getCallDetails] Raw response: \(raw)")
                }
                switch response.result {
                case .success(let talkModel):
                    print("[DEBUG getCallDetails] status=\(talkModel.status), token=\(talkModel.token ?? "nil"), websocket=\(talkModel.websocket ?? "nil")")
                    if talkModel.status == 1 {
                        success(talkModel)
                    } else {
                        failure()
                    }
                case .failure(let error):
                    print("[DEBUG getCallDetails] FAILURE: \(error)")
                    failure()
                }
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
