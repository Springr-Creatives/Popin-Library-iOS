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
        Popin.shared.connect(token: 51, popinDelegate: self);
       
       
    }
    
}

extension ViewController : PopinCallDelegate {
    func onConnectionEstablished() {
        print("CONN_ESTA");
    }
    
    func onAllExpertsBusy() {
        print("EXPR_BUSY");
    }
    
    func onCallConnected() {
        print("CALL_CONNEC");
       // present(PopinCallViewController(), animated: true, completion: nil)
        
    }
    
    func onCallDisconnected() {
        print("CALL_DISCONN");
    }
    
    func onCallFail() {
        print("CALL_FAIL");
    }
}

