//
//  FinishedViewController.swift
//  Headlight Checkup
//
//  Created by Daniel Davies on 4/27/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit
import MapKit

class FinishedViewController: UIViewController {
    
    @IBAction func okButton(_ sender: Any) {
        performSegue(withIdentifier: "startOverSegue", sender: self)
    }
    
    @IBAction func backButton(_ sender: Any) {
        if needsRepairs {
            performSegue(withIdentifier: "finishedBackToRepairShopSearchSegue", sender: self)
        } else {
            performSegue(withIdentifier: "finishedBackToRecommendationsSegue", sender: self)
        }
        
    }
    
    // make string "Yes" or "No" from Bool for JSON dump
    func yesOrNo(boolInput: Bool) -> String {
        // returns yes or no from Bool
        if boolInput { return "Yes"}
        return "No"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // check location data (sometimes it is not stored even though the user allowed access)
        if (userLocationLatitude == 0 && userLocationLongitude == 0) {
            let userLocationCoordinates = CLLocationCoordinate2DMake(locationManager.location?.coordinate.latitude ?? 0, locationManager.location?.coordinate.longitude ?? 0)
            userLocationLatitude = userLocationCoordinates.latitude
            userLocationLongitude = userLocationCoordinates.longitude
        }
        
        // prepare JSON data
        let jsonData = ["year": year, "make": make,
                         "model": model,
                         "headlights": headlights,
                         "user location latitude": String(userLocationLatitude),
                         "user location longitude": String(userLocationLongitude),
                         "are they clean?": yesOrNo(boolInput: isClean),
                         "are they clear?": yesOrNo(boolInput: isClear),
                         "are they undamaged?": yesOrNo(boolInput: isUndamaged),
                         "are they dry (no water inside)?": yesOrNo(boolInput: isDry),
                         "are they functional?": yesOrNo(boolInput: isFunctional),
                         "need repairs?": yesOrNo(boolInput:needsRepairs)
        ]
        
        
       // make a JSON dump
       let urlStr = "https://ptsv2.com/t/headlights/post"
        
       guard let paramsJson = try? JSONSerialization.data(withJSONObject: jsonData, options: [])else { return }
      
       guard let url = URL(string: urlStr) else { return }
       var request = URLRequest(url: url)
       request.httpMethod = "POST"
       request.httpBody = paramsJson
       request.addValue("application/json", forHTTPHeaderField: "Content-Type")
       let session = URLSession.shared
       session.dataTask(with: request) { (data, response, error) in
           if let data = data {
               do {
                   let json = try JSONSerialization.jsonObject(with: data, options: [])
                   print(json)
               } catch {
                   print(error)
               }
           }
       }.resume()

    }
    

    

}
