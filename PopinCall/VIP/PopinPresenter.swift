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
    
    func registerUser(seller_id: Int, name: String, contactInfo: String, campaign: [String: String], onSucess sucess: @escaping () -> Void, onFailure failure: @escaping (String) -> Void) {
        
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
                let errorMessage: String
                if case let PopinInteractor.InteractorError.apiError(message) = error, let message = message {
                    errorMessage = message
                } else {
                    errorMessage = error.localizedDescription
                }
                
                await MainActor.run {
                    failure(errorMessage)
                }
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
                await MainActor.run {
                    failure()
                }
            }
        }
    }

}
