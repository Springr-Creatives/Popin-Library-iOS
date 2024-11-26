//
//  VideoCallInteractor.swift
//  Popin
//
//  Created by Ashwin Nath on 16/03/24.
//

import Foundation
import Alamofire

class VideoCallInteractor {
    
    func getCallDetails(callId: Int, onSucess sucess: @escaping (_ missed: VideoCall) -> Void, onFailure failure: @escaping (String) -> Void) {
        let urlString = serverURL + "v1/seller/connection/details";
        let parameters: Parameters = ["connect_request_id": callId];
        print(parameters)
        AF.request(urlString, method: .post,  parameters: parameters, encoding: URLEncoding.httpBody, headers: Utilities().getHeaders())
            .responseString() { response in
                print(response)
            }
            .responseDecodable(of: VideoCall.self) { response in
                switch response.result {
                case .success(let value):
                    
                    sucess(value)
                    
                case .failure(let error) :
                    failure("Network error")
                    
                }
            }
    }
    
    func notifyReject(callComponentId: Int) {
        let urlString = serverURL + "v1/seller/connection/reject";
        let parameters: Parameters = ["connect_request_component_id": callComponentId];
        
        AF.request(urlString, method: .post,  parameters: parameters, encoding: URLEncoding.httpBody, headers: Utilities().getHeaders())
            .responseString() { response in
                
            }
    }
    
    func notifyAccept(callComponentId: Int, callRole: Int, onAccept accept: @escaping (_ missed: VideoCall) -> Void, onFailure failure: @escaping (String) -> Void) {
        var urlString = serverURL + "v1/seller/connection/accept";
        var parameters: Parameters = ["connect_request_component_id": callComponentId];
        if (callRole == 2) {
            urlString = serverURL + "v1/seller/participant/accept";
            parameters = ["call_participant_id": callComponentId];
        }
        
        AF.request(urlString, method: .post,  parameters: parameters, encoding: URLEncoding.httpBody, headers: Utilities().getHeaders())
            .responseString() { response in
                print(response)
            }
            .responseDecodable(of: VideoCall.self) { response in
                switch response.result {
                case .success(let value):
                    
                    accept(value)
                    
                case .failure(let error) :
                    failure("Network error")
                    
                }
            }
    }
    
}
