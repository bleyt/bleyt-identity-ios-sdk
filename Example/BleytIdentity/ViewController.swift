//
//  ViewController.swift
//  BleytIdentity
//
//  Created by koyinusa@gmail.com on 06/09/2021.
//  Copyright (c) 2021 koyinusa@gmail.com. All rights reserved.
//

import UIKit
import BleytIdentity

class ViewController: UIViewController {
    
    private var controller = ApplicationDetailsController(mobileKey: "Test")

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

