//
//  FunctionActionViewController.swift
//  Headlight Checkup
//
//  Created by Daniel Davies on 5/4/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class FunctionActionViewController: UIViewController {

    @IBAction func okButton(_ sender: Any) {
        performSegue(withIdentifier: "functionActionToRecommendationsSegue", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
