//
//  CleanViewController.swift
//  Headlight Check
//
//  Created by Daniel Davies on 4/23/20.
//  Copyright © 2020 Dan. All rights reserved.
//

// TODO:
// pass vehicle information on back segues as well

import UIKit

class CleanViewController: UIViewController {
    
    @IBAction func dirtyButton(_ sender: Any) {
        isClean = false
        performSegue(withIdentifier: "cleanToActionSegue", sender: self)
    }
    
    @IBAction func cleanButton(_ sender: Any) {
        isClean = true
        performSegue(withIdentifier: "cleanToYellowSegue", sender: self)
    }
    
    @IBAction func backButton(_ sender: Any) {
        performSegue(withIdentifier: "cleanBackSegue", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
}
