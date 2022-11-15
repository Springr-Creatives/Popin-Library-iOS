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
        present(PopinCallViewController(), animated: true, completion: nil)
    }
    
}

