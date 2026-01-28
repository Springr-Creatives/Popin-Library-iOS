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
    
    func registerUser(seller_id: Int, name: String, contactInfo: String, campaign: [String: String], onSucess sucess: @escaping () -> Void) {
        
        var campaignString = ""
        if !campaign.isEmpty {
            if let jsonData = try? JSONSerialization.data(withJSONObject: campaign, options: []),
               let jsonString = String(data: jsonData, encoding: .utf8) {
                campaignString = jsonString
            }
        }
        
        Task {
            do {
                try await popinInteractor.registerUser(seller_id: seller_id, name: name, contactInfo: contactInfo, campaign: campaignString)
                await MainActor.run {
                    sucess()
                }
            } catch {
                print("Error registering user: \(error)")
                // Note: registerUser signature in original file had onFailure but it wasn't in the arguments list? 
                // Wait, looking at the previous file content:
                // func registerUser(seller_id: Int, name: String, contactInfo: String, campaign: [String: String], onSucess sucess: @escaping () -> Void) {
                // ...
                // popinInteractor.registerUser(..., onSucess: { ... }, onFailure: { ... });
                // The wrapper method in Presenter ONLY has onSucess. It swallows the failure.
                // So I will just print the error.
            }
        }
    }
    
    func startConnection(seller_id: Int, onSuccess success: @escaping (Int) -> Void, onFailure failure: @escaping () -> Void) {
        Task {
            do {
                let callQueueId = try await popinInteractor.startConnection(seller_id: seller_id)
                await MainActor.run {
                    success(callQueueId)
                }
            } catch {
                print("Error starting connection: \(error)")
                await MainActor.run {
                    failure()
                }
            }
        }
    }

    func getCallDetails(callId: Int, onSuccess success: @escaping (TalkModel) -> Void, onFailure failure: @escaping () -> Void) {
        Task {
            do {
                let talkModel = try await popinInteractor.getCallDetails(callId: callId)
                await MainActor.run {
                    success(talkModel)
                }
            } catch {
                print("Error getting call details: \(error)")
                await MainActor.run {
                    failure()
                }
            }
        }
    }

}
