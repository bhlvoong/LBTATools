//
//  ViewController.swift
//  LBTATools
//
//  Created by Brian Voong on 05/01/2019.
//  Copyright (c) 2019 Brian Voong. All rights reserved.
//

import UIKit
import LBTATools

class ViewController: UIViewController {
    
    let nameLabel = UILabel(text: "Name Label")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(nameLabel)
        nameLabel.fillSuperview()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

