//
//  PopinLogger.swift
//  PopinCall
//
//  Created by Ashwin Nath.
//

import Foundation

public class PopinLogger {

    static let shared = PopinLogger()

    var isEnabled: Bool = false

    private init() {}

    func log(_ message: String) {
        guard isEnabled else { return }
        print("[Popin] \(message)")
        NSLog("[Popin] \(message)")
    }
}
