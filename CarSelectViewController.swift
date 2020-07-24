//
//  CarSelectViewController.swift
//  Headlight Check
//
//  Created by Daniel Davies on 4/22/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class CarSelectViewController: UIViewController,  UIPickerViewDataSource, UIPickerViewDelegate {

    // PickerView component indexes
    let makeIndex = 0
    let modelIndex = 1
    
    // dictionary of makes and models
    var makesModelsDict:[String:[String]] = [:]

    var makesModels = [String]()
    
    @IBOutlet weak var carSelectPickerView: UIPickerView!
    
    @IBAction func notSureButton(_ sender: Any) {
        year = String()
        make = String()
        model = String()
        performSegue(withIdentifier: "carSelectToYearSegue", sender: self)
    }
    @IBAction func nextButton(_ sender: Any) {
        make = makes[carSelectPickerView.selectedRow(inComponent: makeIndex)]
        model = models[carSelectPickerView.selectedRow(inComponent: modelIndex)]
    
        performSegue(withIdentifier: "carSelectToYearSegue", sender: self)
    }

    @IBAction func backButton(_ sender: Any) {
        performSegue(withIdentifier:"carSelectBackSegue", sender: self)
    }
        
    // pickable content arrays
    var makes:[String] = []
    var models:[String] = []
    
    // number of components in the CarSelectPickerView
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    // number of rows in the CarSelectPickerView
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch(component) {
        case makeIndex:
            return makes.count
        default: // model
            return models.count
        }
    }
    
    // data in the CarSelectPickerView
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch(component) {
        case makeIndex:
            return makes[row]
        default: // model
            return models[row]
        }
    }
    
    // user picks a new make - update models
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (component == makeIndex) {
            let make = makes[row]
            models = makesModelsDict[make]!
            models.sort() // sort alphabetically
            carSelectPickerView .reloadAllComponents()
        }
    }
 
    // width for each component
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        switch(component) {
        case makeIndex:
            return 180
        default: // model
            return 240
        }
     }
    
    // picker view font size
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 20
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // carSelectPickerView delegate and data source
        carSelectPickerView.delegate = self
        carSelectPickerView.dataSource = self
        
        // load makes and models from text file
        if let makesModelsURL = Bundle.main.url(forResource: "makes_models", withExtension: "txt") {
            if let makesModelsContent = try? String(contentsOf: makesModelsURL) {
                // load successful
                makesModels = makesModelsContent.components(separatedBy: "\n")
            }
        }
        if makesModels.isEmpty {
            // makes and models did not load correctly
            // load just one make and model
            makesModels = ["Honda,Civic"]
        }
        
        // load makes and models into makesModelsDict
        for makeModelPair:String in makesModels {
            
            var make = String()
            var model = String()
                        
            // split the make and model into separate strings, deliniated by a comma
            if let splitIndex = makeModelPair.firstIndex(of: ",") {
                make = String(makeModelPair[makeModelPair.startIndex..<splitIndex])
                model = String(makeModelPair[makeModelPair.index(after: splitIndex)..<makeModelPair.endIndex])
            }
            
            // add the make and model to the dictionary
            if ( (make != String()) && (model != String()) ) {
                var modelsArray = makesModelsDict[make] ?? Array()
                
                // check to make sure the model doesn't already exist
                if !modelsArray.contains(model) {
                    modelsArray.append(model)
                    makesModelsDict[make] = modelsArray
                }
            }
        }
        
        // create pickable content arrays
        
        // makes
        makes = Array(makesModelsDict.keys)
        makes.sort() // sort alphabetically
        
        // models
        models = makesModelsDict[makes[0]]!
        models.sort() // sort alphabetically
        
    }

}

