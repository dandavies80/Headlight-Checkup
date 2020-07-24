//
//  HeadlightTypeViewController.swift
//  Headlight Check
//
//  Created by Daniel Davies on 4/25/20.
//  Copyright © 2020 Dan. All rights reserved.
//

// TODO:
// de-mess the view layout

import UIKit

class HeadlightTypeViewController: UIViewController {
    
    // string constants
    let led = "LED"
    let halogen = "Halogen"
    let hid = "HID"
    let bulb = "Bulb"
    let notSure = "Not Sure"
    
    @IBOutlet weak var headlightInquiryLabel: UILabel!
    
    // button outlets
    @IBOutlet weak var ledButton: UIButton!
    @IBOutlet weak var halogenButton: UIButton!
    @IBOutlet weak var hidButton: UIButton!
    @IBOutlet weak var bulbButton: UIButton!
    @IBOutlet weak var notSureButton: UIButton!
    
    func selectButton(selectedButton:UIButton) {
        // unselect and unhighlight all buttons
        for button: UIButton in [ledButton, halogenButton, hidButton, bulbButton, notSureButton] {
            button.isSelected = false
            button.layer.borderWidth = 0
            button.layer.borderColor = UIColor.white.cgColor
        }
        
        // select and highlight selectedButton
        selectedButton.isSelected = true
        selectedButton.layer.borderWidth = 5
        selectedButton.layer.borderColor = UIColor.purple.cgColor
    }
    
    func getSelectedButton() -> String {
        // returns which headlight type is selected, empty string if none
        if ledButton.isSelected {return led}
        if halogenButton.isSelected {return halogen}
        if hidButton.isSelected {return hid}
        if bulbButton.isSelected {return bulb}
        if notSureButton.isSelected {return notSure}
        return String()
    }
    
    // button actions - select and highlight
    @IBAction func ledButton(_ sender: Any) {
        selectButton(selectedButton: ledButton)
    }
    @IBAction func halogenButton(_ sender: Any) {
        selectButton(selectedButton: halogenButton)
    }
    @IBAction func hidButton(_ sender: Any) {
        selectButton(selectedButton: hidButton)
    }
    @IBAction func bulbButton(_ sender: Any) {
        selectButton(selectedButton: bulbButton)
    }
    @IBAction func notSureButton(_ sender: Any) {
        selectButton(selectedButton: notSureButton)
    }
    
    @IBAction func nextButton(_ sender: Any) {
        let selectedButton = getSelectedButton()
        if (selectedButton != String()) {
            headlights = selectedButton
            performSegue(withIdentifier: "headlightTypetoCleanSegue", sender: self)
        } else {
            // a headlight type has not been selected
            let alert = UIAlertController(title: "Please select your headlight type.", message: "If you don't know your headlight type, select \"I'm not sure\".", preferredStyle: .alert)

            alert.addAction(UIAlertAction(title: "Got it", style: .default))
                
            self.present(alert, animated: true)
        }
    }
    
    @IBAction func backButton(_ sender: Any) {
        performSegue(withIdentifier: "headlightTypeBackSegue", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var car = "car"
        if model != String() {car = model}
        headlightInquiryLabel.text? = "Great!\nWhat kind of headlights does your \(car) have?"
        
        if headlights != String() {
            // headlights have already been selected (back button has been used to return to this view controller)
            // select the previously selected headlight type
            switch headlights {
            case led:
                selectButton(selectedButton: ledButton)
            case halogen:
                selectButton(selectedButton: halogenButton)
            case hid:
                selectButton(selectedButton: hidButton)
            case bulb:
                selectButton(selectedButton: bulbButton)
            case notSure:
                selectButton(selectedButton: notSureButton)
            default: break
            }
        }
    }
}
