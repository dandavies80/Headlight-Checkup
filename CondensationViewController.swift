//
//  CondensationViewController.swift
//  Headlight Checkup
//
//  Created by Daniel Davies on 4/27/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class CondensationViewController: UIViewController {

    @IBAction func waterButton(_ sender: Any) {
        isDry = false
        performSegue(withIdentifier: "condensationToActionSegue", sender: self)
    }
    
    @IBAction func noWaterButton(_ sender: Any) {
        isDry = true
        performSegue(withIdentifier: "condensationToFunctionSegue", sender: self)
    }
    
    @IBAction func backButton(_ sender: Any) {
        performSegue(withIdentifier: "condensationBackSegue", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()



    }
    


}
