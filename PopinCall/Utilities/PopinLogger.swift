//
//  PopinLogger.swift
//  PopinCall
//
//  Created by Ashwin Nath.
//

import Foundation

class PopinLogger {

    static let shared = PopinLogger()

    var isEnabled: Bool = false

    private init() {}

    func log(_ message: String) {
       // guard isEnabled else { return }
        print("[Popin Internal] \(message)")
        NSLog("[Popin] \(message)")
    }
}
