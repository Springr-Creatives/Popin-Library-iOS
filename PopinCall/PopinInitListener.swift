//
//  PopinInitListener.swift
//  PopinCall
//
//  Created by Ashwin Nath.
//

import Foundation

public protocol PopinInitListener {
    func onInitComplete()
    func onInitFailed(reason: String)
}
