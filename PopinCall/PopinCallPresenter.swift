//
//  PopinCallPresenter.swift
//  PopinCall
//
//  Created by Ashwin Nath on 15/11/22.
//

import Foundation
class PopinCallPresenter {
    private let popinInteractor: PopinCallInteractor
    weak private var popinCallView: PopinCallView?
    
    init(popinInteractor: PopinCallInteractor) {
        self.popinInteractor = popinInteractor
    }
    
    func attachView(popinCallView: PopinCallView) {
        self.popinCallView = popinCallView
    }
    
    func detachView() {
        popinCallView = nil
    }
    
    func createCall() {
        popinInteractor.getAccessToken(seller_id: Utilities.shared.getSeller(), onSucess: { (talkModel) in
            print("SUCCES")
        }, onFailure: {
            print("FAIL")
        })
    }
    
}
