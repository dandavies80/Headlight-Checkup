//
//  TestViewController.swift
//  Headlight Checkup
//
//  Created by Daniel Davies on 4/29/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class YearViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var yearLabel: UILabel!
    
    @IBOutlet weak var yearPickerView: UIPickerView!

    @IBAction func notSureButton(_ sender: Any) {
        year = String()
        performSegue(withIdentifier: "yearToHeadlightTypeSegue", sender: self)
    }
    
    @IBAction func nextButton(_ sender: Any) {
        year = years[yearPickerView.selectedRow(inComponent: 0)]
        performSegue(withIdentifier: "yearToHeadlightTypeSegue", sender: self)
    }
    
    @IBAction func backButton(_ sender: Any) {
        performSegue(withIdentifier: "yearBackSegue", sender: self)
    }
    
    // pickable content array
    var years:[String] = []
    
    // number of components in yearPickerView
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // number of rows in yearPickerView
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return years.count
    }
    
    // data in the yearPickerView
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return years[row]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // yearPickerView delegate and data source
        yearPickerView.delegate = self
        yearPickerView.dataSource = self
        
        var car = "car"
        if model != String() {car = model}
        yearLabel.text? = "What model year is your \(car)?"
        
        // years
        let endYear = Calendar.current.component(.year, from: Date())
        let startYear = endYear - 40
        var yearsArray = Array(startYear...endYear)
        yearsArray.reverse() // reverse the array in place
        years = yearsArray.map {String($0)} // convert years from integer to string
        years.append("Earlier")
    }
}
