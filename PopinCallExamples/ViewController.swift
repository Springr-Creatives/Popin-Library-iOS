//
//  ViewController.swift
//  PopinCallExamples
//
//  Created by Ashwin Nath on 15/11/22.
//

import UIKit
import PopinCall

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Initialize Popin with config (matches Android Popin.init)
        let config = PopinConfig.Builder()
            .userName("Demo User")
            .contactInfo("demo@example.com")
            .sandboxMode(true)
            .initListener(self)
            .hideScreenShareButton(true)
            .build()

        Popin.initialize(token: 51, config: config)
    }

    @IBAction func makeCall(_ sender: Any) {
        // Start a call (matches Android Popin.getInstance().startCall)
        Popin.shared?.startCall(eventsListener: self)
    }

}

// MARK: - PopinInitListener

extension ViewController: PopinInitListener {
    func onInitComplete() {
        print("Popin initialized")
    }

    func onInitFailed(reason: String) {
        print("Popin init failed: \(reason)")
    }
}

// MARK: - PopinEventsListener

extension ViewController: PopinEventsListener {
    func onPermissionGiven() {
        print("Permission given")
    }

    func onPermissionDenied() {
        print("Permission denied")
    }

    func onCallStart() {
        print("Call started")
    }

    func onCallCancel() {
        print("Call cancelled")
    }

    func onQueuePositionChanged(position: Int) {
        print("Queue position: \(position)")
    }

    func onCallMissed() {
        print("Call missed")
    }

    func onCallNetworkFailure() {
        print("Network failure")
    }

    func onCallConnected() {
        print("Call connected")
    }

    func onCallFailed() {
        print("Call failed")
    }

    func onCallEnd() {
        print("Call ended")
    }
}
