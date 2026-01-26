//
//  PopinCallPresenter.swift
//  PopinCall
//
//  Created by Ashwin Nath on 15/11/22.
//

import Foundation

#if canImport(UIKit)
class PopinCallPresenter {
    private let popinInteractor: PopinCallInteractor
    weak private var popinCallView: VideoCallView?
    
    init(popinInteractor: PopinCallInteractor) {
        self.popinInteractor = popinInteractor
    }
    
    func attachView(popinCallView: VideoCallView) {
        self.popinCallView = popinCallView
    }
    
    func detachView() {
        popinCallView = nil
    }
    
    func createCall() {
        popinInteractor.getAccessToken(seller_id: Utilities.shared.getSeller(), onSucess: { (talkModel) in
            print(talkModel);
            if (talkModel.status == 1) {
                self.popinCallView?.loadCall(call: talkModel)
            } else {
                self.popinCallView?.showMessage(title: "Error", message: "Unable to create call")
            }
        }, onFailure: {
            self.popinCallView?.showMessage(title: "Error", message: "Unable to create call")
        })
    }
    
}
#endif
