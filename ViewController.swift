//
//  ViewController.swift
//  MyMap
//
//  Created by user on 2019/09/13.
//  Copyright © 2019 user. All rights reserved.
//

import UIKit
import MapKit
class ViewController: UIViewController,UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        inputText.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        let serchKeyword = textField.text
        
        print(serchKeyword!)
        
        let geocoder = CLGeocoder()
        
        geocoder.geocodeAddressString(serchKeyword!, completionHandler:{ (placemarks:[CLPlacemark]?,error:Error?) in
            
            if let placemark = placemarks?[0]{
                if let targetCoordinate = placemark.location?.coordinate {
                print(targetCoordinate)
                    
                let pin = MKPointAnnotation()
                    pin.coordinate = targetCoordinate
                    pin.title = serchKeyword
                    
                    self.displayMap.addAnnotation(pin)
                    self.displayMap.region = MKCoordinateRegionMakeWithDistance(targetCoordinate,500.0,500.0)
                }
            }
        })
        
        return true
    }
    @IBOutlet weak var inputText: UITextField!
    
    @IBOutlet weak var displayMap: MKMapView!
}

