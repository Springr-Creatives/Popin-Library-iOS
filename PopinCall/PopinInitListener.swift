//
//  PopinInitListener.swift
//  PopinCall
//
//  Created by Ashwin Nath.
//

import Foundation

public protocol PopinInitListener: AnyObject {
    func onInitComplete()
    func onInitFailed(reason: String)
}
