//
//  ViewController.swift
//  PopinCallExamples
//
//  Created by Ashwin Nath on 15/11/22.
//

import UIKit
import PopinCall

class ViewController: UIViewController, UITableViewDataSource {

    private let dummyItems: [String] = (1...50).map { "Item \($0) — Lorem ipsum dolor sit amet, consectetur adipiscing elit." }

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
            .secondaryProductText("Car details") // Custom text
            .expertDesignation("Car Expert")
            // Listeners
            .initListener(self)
            .eventsListener(self)

            // UI visibility options (all visible by default)
            .hideDisconnectButton(false)      // Show end call button
            .hideFlipCameraButton(true)      // Show flip camera button
            .hideMuteVideoButton(false)       // Show video toggle button
            .hideMuteAudioButton(false)       // Show mic toggle button
            .hideBackButton(false)            // Show PiP/back button
            .persistenceMode(true)              //Maintain user session or create new sesssion everytime
            .build()

        Popin.initialize(token: 51, config: config)

        setupUI()
    }

    private func setupUI() {
        let callButton = UIButton(type: .system)
        callButton.setTitle("Call", for: .normal)
        callButton.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 25)
        callButton.setTitleColor(.black, for: .normal)
        callButton.backgroundColor = UIColor(red: 0.709, green: 1.0, blue: 0.593, alpha: 1.0)
        callButton.layer.cornerRadius = 10
        callButton.translatesAutoresizingMaskIntoConstraints = false
        callButton.addTarget(self, action: #selector(makeCall), for: .touchUpInside)
        view.addSubview(callButton)

        let deinitButton = UIButton(type: .system)
        deinitButton.setTitle("Deinit", for: .normal)
        deinitButton.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 25)
        deinitButton.setTitleColor(.black, for: .normal)
        deinitButton.backgroundColor = UIColor(red: 1.0, green: 0.4, blue: 0.4, alpha: 1.0)
        deinitButton.layer.cornerRadius = 10
        deinitButton.translatesAutoresizingMaskIntoConstraints = false
        deinitButton.addTarget(self, action: #selector(deinitPopin), for: .touchUpInside)
        view.addSubview(deinitButton)

        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            callButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            callButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            callButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            callButton.heightAnchor.constraint(equalToConstant: 55),

            deinitButton.topAnchor.constraint(equalTo: callButton.bottomAnchor, constant: 12),
            deinitButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            deinitButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            deinitButton.heightAnchor.constraint(equalToConstant: 55),

            tableView.topAnchor.constraint(equalTo: deinitButton.bottomAnchor, constant: 16),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }

    @objc func makeCall(_ sender: Any) {
        Popin.shared?.startCall()
    }

    @objc func deinitPopin(_ sender: Any) {
        Popin.deinitialize()
    }

    // MARK: - UITableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dummyItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = dummyItems[indexPath.row]
        cell.textLabel?.numberOfLines = 0
        return cell
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

    func onCallAbandoned() {
    }

    func onQueuePositionChanged(position: Int) {
    }

    func onCallMissed() {
    }

    func onCallNetworkFailure(participant: String) {
    }

    func onCallConnected() {
    }

    func onCallFailed() {
    }

    func onCallEnd() {
    }
}
