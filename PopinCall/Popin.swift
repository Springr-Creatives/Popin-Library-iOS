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
        
        if (!self.popinPresenter.isUserRegistered()) {
            popinPresenter.registerUser(seller_id: token, onSucess: {
                connectPusher(seller_id: token , delegate: delegate)
            })
        } else {
            connectPusher(seller_id: token ,delegate: delegate)
        }
    }
    
    public static func connectPusher(seller_id: Int, delegate: PopinCallDelegate) {
        popinPusher.connect(callDelegate: delegate);
        startConnect(seller_id: seller_id)
    }
    
    public static func startConnect(seller_id:Int) {
     //   popinPresenter.startConnection(seller_id: seller_id);
    }
    
}
