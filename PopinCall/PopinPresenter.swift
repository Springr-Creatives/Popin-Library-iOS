//
//  PopinPresenter.swift
//  PopinCall
//
//  Created by Ashwin Nath on 17/11/22.
//

import Foundation

class PopinPresenter {
    private let popinInteractor: PopinInteractor
    
    init(popinInteractor: PopinInteractor) {
        self.popinInteractor = popinInteractor
    }
    
    
    func isUserRegistered() -> Bool {
        return Utilities.shared.getUserToken().count > 0;
    }
    
    func registerUser(seller_id: Int, name: String, mobile: String, campaign: [String: String], onSucess sucess: @escaping () -> Void) {
        
        var campaignString = ""
        if !campaign.isEmpty {
            if let jsonData = try? JSONSerialization.data(withJSONObject: campaign, options: []),
               let jsonString = String(data: jsonData, encoding: .utf8) {
                campaignString = jsonString
            }
        }
        
        popinInteractor.registerUser(seller_id: seller_id, name: name, mobile: mobile, campaign: campaignString, onSucess: {
            sucess();
        }, onFailure: {
        
        });
    }
    
    func startConnection(seller_id: Int, onSuccess success: @escaping (Int) -> Void, onFailure failure: @escaping () -> Void) {
        popinInteractor.startConnection(seller_id: seller_id, onSuccess: success, onFailure: failure)
    }

    func getCallDetails(callId: Int, onSuccess success: @escaping (TalkModel) -> Void, onFailure failure: @escaping () -> Void) {
        popinInteractor.getCallDetails(callId: callId, onSuccess: success, onFailure: failure)
    }

}
