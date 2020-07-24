//
//  DamageViewController.swift
//  Headlight Checkup
//
//  Created by Daniel Davies on 4/27/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class DamageViewController: UIViewController {

    @IBAction func damagedButton(_ sender: Any) {
        isUndamaged = false
        performSegue(withIdentifier: "damageToActionSegue", sender: self)
    }
    @IBAction func undamagedButton(_ sender: Any) {
        isUndamaged = true
        performSegue(withIdentifier: "damageToCondensationSegue", sender: self)
    }
    @IBAction func backButton(_ sender: Any) {
        performSegue(withIdentifier: "damageBackSegue", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
}
