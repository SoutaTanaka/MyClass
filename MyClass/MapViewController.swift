//
//  MapViewController.swift
//  MyClass
//
//  Created by 田中颯太 on 2018/03/28.
//  Copyright © 2018年 田中颯太. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, CLLocationManagerDelegate{
    
    @IBOutlet var MapView: MKMapView!
    var location: CLLocationManager!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        location = CLLocationManager()
        location.requestWhenInUseAuthorization()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("errer")
    }
    

}
