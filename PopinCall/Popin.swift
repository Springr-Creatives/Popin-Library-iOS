//
//  Popin.swift
//  PopinCall
//
//  Created by Ashwin Nath on 15/11/22.
//

import Foundation


let serverURL = "https://dev.popin.to/api/v1";

public class Popin  {
    
    private static let popinPresenter = PopinPresenter(popinInteractor: PopinInteractor())
    
    private static let popinPusher = PopinPusher()
    
    public static func connect(token: Int, delegate: PopinCallDelegate) {
        print("connect");
        if (!self.popinPresenter.isUserRegistered()) {
            popinPresenter.registerUser(seller_id: token, onSucess: {
                connectPusher(delegate: delegate)
            })
        } else {
            connectPusher(delegate: delegate)
        }
    }
    
    public static func connectPusher(delegate: PopinCallDelegate) {
        popinPusher.connect(callDelegate: delegate);
    }
}
