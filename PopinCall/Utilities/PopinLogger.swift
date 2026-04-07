//
//  PopinLogger.swift
//  PopinCall
//
//  Created by Ashwin Nath.
//

import Foundation
import os

class PopinLogger {

    static let shared = PopinLogger()

    var isEnabled: Bool = false

    private init() {}

    func log(_ message: String) {
        let logger = Logger(subsystem: "to.popin.PopinCall", category: "lifecycle")
       // guard isEnabled else { return }
        logger.log("[Popin] \(message)")
        print("[Popin Internal] \(message)")
       // NSLog("[Popin] \(message)")
    }
}
