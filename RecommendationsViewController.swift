//
//  RecommendationsViewController.swift
//  Headlight Checkup
//
//  Created by Daniel Davies on 6/14/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class RecommendationsViewController: UIViewController {
    
    @IBOutlet weak var recommendationsLabel: UILabel!
    
    @IBAction func okButton(_ sender: Any) {
        
        if needsRepairs {
            performSegue(withIdentifier: "recommendationsToRepairShopSearchSegue", sender: self)
        } else {
            performSegue(withIdentifier: "recommendationsToFinishedSegue", sender: self)
        }
    }
    @IBAction func backButton(_ sender: Any) {
        performSegue(withIdentifier: "receommendationsBackSegue", sender: self)
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var message = String()
        
        // make recommendations
        if (!isClear || !isUndamaged || !isDry || !isFunctional) {
            // headlights need repair work
            message = "It is recommended that you take your vehicle to a repair shop to address the following headlight issues:\n\n"
        
            if !isClear {
                message += "* Yellowing\n"
            }
            if !isUndamaged {
                message += "* Damage\n"
            }
            if !isDry {
                message += "* Condensation\n"
            }
            if !isFunctional {
                message += "* Functionality\n"
            }
            message += "\n You can find local repair shops on the next page.  Please press OK."
            
            needsRepairs = true
        } else {
            // no problems
            message = "Your headlights look good and have no issues!"
            needsRepairs = false
        }
        
        // display message
        recommendationsLabel.text = message
    }
    

}
