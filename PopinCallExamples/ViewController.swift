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
        // Do any additional setup after loading the view.
    }

    @IBAction func makeCall(_ sender: Any) {
        //self.navigationController?.pushViewController(PopinCallViewController(), animated: true)
       Popin.shared.connect(token: 51, popinDelegate: self);
        
    }
    
}

extension ViewController : PopinCallDelegate {
    func onConnectionEstablished() {
        self.navigationController?.pushViewController(PopinCallViewController(), animated: true)
    }
    
    func onAllExpertsBusy() {
        print("All experts are busy");
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

