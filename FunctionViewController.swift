//
//  FunctionViewController.swift
//  Headlight Checkup
//
//  Created by Daniel Davies on 4/27/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class FunctionViewController: UIViewController {

    @IBAction func notFunctionalButton(_ sender: Any) {
        isFunctional = false
        performSegue(withIdentifier: "functionToActionSegue", sender: self)
    }
    
    @IBAction func functionalButton(_ sender: Any) {
        isFunctional = true
        performSegue(withIdentifier: "functionToRecommendationsSegue", sender: self)
    }
    
    @IBAction func backButton(_ sender: Any) {
        performSegue(withIdentifier: "functionBackSegue", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

   
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
