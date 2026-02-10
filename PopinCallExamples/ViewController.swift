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

        // Example product info to display during the call
        let product = PopinProduct(
            id: "SKU-12345",
            name: "Wireless Headphones",
            image: "https://images.unsplash.com/photo-1505740420928-5e560c06d30e",
            url: "https://example.com/products/headphones",
            description: "Noise-cancelling wireless headphones",
            extra: "$299.99"
        )

        // Example metadata to pass with the call
        let metadata: [String: String] = [
            "source": "ios_app",
            "version": "1.0.0",
            "campaign": "summer_sale"
        ]

        // Initialize Popin with config (matches Android Popin.init)
        let config = PopinConfig.Builder()
            // User information
            .userName("Demo iUser")
            .contactInfo("demo@example.com") //email or phone
            .callerId("user-12345")

            // Environment
            .sandboxMode(true)
            .enableDebugMode(true)

            // Product info to display in TopControls during call
            .product(product)

            // Custom metadata
            .meta(metadata)

            // Listeners
            .initListener(self)
            .eventsListener(self)

            // UI visibility options (all visible by default)
            .hideDisconnectButton(false)      // Show end call button
            .hideScreenShareButton(false)     // Show screen share option
            .hideFlipCameraButton(false)      // Show flip camera button
            .hideMuteVideoButton(false)       // Show video toggle button
            .hideMuteAudioButton(false)       // Show mic toggle button
            .hideBackButton(false)            // Show PiP/back button
            .persistenceMode(true)              //Maintain user session or create new sesssion everytime
            .build()

        Popin.initialize(token: 51, config: config)
    }

    @IBAction func makeCall(_ sender: Any) {
        // Start a call (matches Android Popin.getInstance().startCall)
        Popin.shared?.startCall()
    }

}

// MARK: - PopinInitListener

extension ViewController: PopinInitListener {
    func onInitComplete(userId: Int) {
        // Set a group after initialization is complete
//        Popin.shared?.setGroup(identifier: "group-abc-123", onSuccess: {
//            print("Group set successfully")
//        }, onFailure: { error in
//            print("Failed to set group: \(error)")
//        })
    }

    func onInitFailed(reason: String) {
    }
}

// MARK: - PopinEventsListener

extension ViewController: PopinEventsListener {
    func onPermissionGiven() {
    }

    func onPermissionDenied() {
    }

    func onCallStart() {
    }

    func onCallCancel() {
    }

    func onQueuePositionChanged(position: Int) {
    }

    func onCallMissed() {
    }

    func onCallNetworkFailure() {
    }

    func onCallConnected() {
    }

    func onCallFailed() {
    }

    func onCallEnd() {
    }
}
