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
        print("load");
        // Do any additional setup after loading the view.
    }

    @IBAction func makeCall(_ sender: Any) {
        print("staryt");
       Popin.shared.connect(token: 51, popinDelegate: self);
    }

}

extension ViewController : PopinEventsListener {
    func onPermissionGiven() {
        print("Permission given");
    }

    func onPermissionDenied() {
        print("Permission denied");
    }

    func onCallStart() {
        print("Call started");
    }

    func onCallCancel() {
        print("Call cancelled");
    }

    func onQueuePositionChanged(position: Int) {
        print("Queue position: \(position)");
    }

    func onCallMissed() {
        print("Call missed");
    }

    func onCallNetworkFailure() {
        print("Network failure");
    }

    func onCallConnected() {
        print("Call connected");
    }

    func onCallFailed() {
        print("Call failed");
    }

    func onCallEnd() {
        print("Call ended");
    }
}
