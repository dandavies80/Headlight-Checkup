//
//  YellowViewController.swift
//  Headlight Checkup
//
//  Created by Daniel Davies on 4/27/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class YellowViewController: UIViewController {

    @IBAction func yellowButton(_ sender: Any) {
        isClear = false
        performSegue(withIdentifier: "yellowToActionSegue", sender: self)
    }
    @IBAction func clearButton(_ sender: Any) {
        isClear = true
        performSegue(withIdentifier: "yellowToDamageSegue", sender: self)
    }
    @IBAction func backButton(_ sender: Any) {
        performSegue(withIdentifier: "yellowBackSegue", sender: self)
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

  

    }
    
}
