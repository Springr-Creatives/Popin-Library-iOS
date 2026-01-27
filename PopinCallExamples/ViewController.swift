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
        //self.navigationController?.pushViewController(PopinCallViewController(), animated: true)
       Popin.shared.connect(token: 51, popinDelegate: self);
        
    }
    
}

extension ViewController : PopinCallDelegate {
    func onConnectionEstablished() {
        print("CALL_CONNEC766");
        //self.navigationController?.pushViewController(PopinCallViewController(), animated: true)
    }
    
    func onAllExpertsBusy() {
        print("All experts are busy");
    }

    func onQueuePositionChanged(position: Int) {
        print("Queue position: \(position)");
    }

    func onCallAccepted(callId: Int) {
        print("Call accepted: \(callId)");
    }

    func onCallMissed() {
        print("Call missed");
    }

    func onCallConnected() {
        print("CALL_CONNEC");
    }
    
    func onCallDisconnected() {
        print("CALL_DISCONN");
    }
    
    func onCallFail() {
        print("CALL_FAIL");
    }
}

