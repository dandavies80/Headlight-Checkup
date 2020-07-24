//
//  StartViewController.swift
//  Headlight Checker
//
//  Created by Daniel Davies on 4/22/20.
//  Copyright © 2020 Dan. All rights reserved.
//

// global variables to store information about the user's vehicle
var year = String()
var make = String()
var model = String()
var headlights = String()

// global variable to store information about headlight conditions
var isClean = Bool() // true if clean, false if dirty
var isClear = Bool() // true if clear, false if yellowed or hazed
var isUndamaged = Bool() // true if not damaged, false if damaged
var isDry = Bool() // true if dry inside, false if there is condensation or water accumulation
var isFunctional = Bool() // true if functional, false if not working
var needsRepairs = Bool()

import UIKit
import MapKit

// global variables to store user location latitude and longitude
var userLocationLatitude: Double = 0
var userLocationLongitude: Double = 0

class StartViewController: UIViewController, CLLocationManagerDelegate {
    
    var locationManager = CLLocationManager()
    
    @IBAction func readyButton(_ sender: Any) {
        // get and save user location
        let userLocationCoordinates = CLLocationCoordinate2DMake(locationManager.location?.coordinate.latitude ?? 0, locationManager.location?.coordinate.longitude ?? 0)
        userLocationLatitude = userLocationCoordinates.latitude
        userLocationLongitude = userLocationCoordinates.longitude
        
        performSegue(withIdentifier: "startToCarSelectSegue", sender: self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        if !CLLocationManager.locationServicesEnabled() {
            // show message suggesting to enable location services
            let message = "Enabling Location services will allow me to recommend local auto repair and parts shops. \nYou can enable location services in Settings -> Privacy"
            let alert = UIAlertController(title: "Location Services Disabled", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Got it", style: .default))
            self.present(alert, animated: true)
        }
    }
}

