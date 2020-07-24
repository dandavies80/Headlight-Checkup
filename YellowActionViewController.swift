//
//  YellowActionViewController.swift
//  Headlight Checkup
//
//  Created by Daniel Davies on 5/3/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class YellowActionViewController: UIViewController {

    @IBAction func okButton(_ sender: Any) {
        performSegue(withIdentifier: "yellowActionToDamageSegue", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


}
