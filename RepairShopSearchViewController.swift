//
//  RepairShopSearchViewController.swift
//  Headlight Checkup
//
//  Created by Daniel Davies on 6/13/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit
import MapKit

let searchCategory = "Auto Parts Stores"
let locationManager = CLLocationManager()

class RepairShopSearchViewController: UIViewController,  UIGestureRecognizerDelegate, MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBAction func backButton(_ sender: Any) {
        performSegue(withIdentifier: "repairShopSearchBackSegue", sender: self)
    }
    @IBAction func doneButton(_ sender: Any) {
        performSegue(withIdentifier: "RepairShopSearchToFinishedSegue", sender: self)
    }
    
    @objc func didDragMap(gestureRecognizer: UIGestureRecognizer) {
        if (gestureRecognizer.state == UIGestureRecognizer.State.ended) {
            // map drag ended - research
            searchForLocations(category: searchCategory)
        }
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // add gesture recognizer to the map
        let mapDragRecognizer = UIPanGestureRecognizer(target: self, action: #selector(self.didDragMap(gestureRecognizer:)))
        mapDragRecognizer.delegate = self
        self.mapView.addGestureRecognizer(mapDragRecognizer)
        
        // request use
        locationManager.requestWhenInUseAuthorization()
        
        // set map region, 5km x 5km
        let size:Double = 5000 // meters
        if let userLocation = locationManager.location?.coordinate {
            let viewRegion = MKCoordinateRegion(center: userLocation, latitudinalMeters: size, longitudinalMeters: size)
            mapView.setRegion(viewRegion, animated: false)
        }
        
        // search for category
        searchForLocations(category: searchCategory)
    }
    
    
    func searchForLocations(category: String) {
        // search for local repair shops
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = category
        request.region = mapView.region
                
        let search = MKLocalSearch(request: request)
        search.start(completionHandler: {(response, error) in
            if error == nil {
                if response!.mapItems.count == 0 {
                    // no matches found
                    let message = "Sorry, I couldn't find any /(category) near you.  Try zooming out on the map to expand the search region."
                    let alert = UIAlertController(title: "No Matches Found", message: message, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .default))
                    self.present(alert, animated: true)
                } else {
                    // matches found
                    // display annotations in map
                    for item in response!.mapItems {
                        let annotation = MKPointAnnotation()
                        annotation.coordinate = item.placemark.coordinate
                        annotation.title = item.name
                        annotation.subtitle = item.placemark.title // address annotation
                        self.mapView.addAnnotation(annotation)
                    }
                }
            }
        })
    }
}

