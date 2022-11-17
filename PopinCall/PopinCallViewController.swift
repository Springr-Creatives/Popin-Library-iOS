//
//  PopinCallViewController.swift
//  PopinCall
//
//  Created by Ashwin Nath on 15/11/22.
//

import UIKit

protocol PopinCallView: NSObjectProtocol {
        func startLoading()
        func finishLoading()
        func closeView()
        func showMessage(title: String, message: String)
    }

public class PopinCallViewController: UIViewController {

    public override func viewDidLoad() {
        super.viewDidLoad()
      
        // Do any additional setup after loading the view.
    }

    public init() {
        super.init(nibName: "PopinCallViewController", bundle: Bundle(for: PopinCallViewController.self))
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
 

}
