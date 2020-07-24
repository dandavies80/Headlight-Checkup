//
//  CleanActionViewController.swift
//  Headlight Checkup
//
//  Created by Daniel Davies on 5/2/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class CleanActionViewController: UIViewController {

    @IBAction func okButton(_ sender: Any) {
        
        performSegue(withIdentifier: "cleanActionToYellowSegue", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // go to auto parts store search ViewController
        
    }
    

}
