//
//  MapViewController.swift
//  2017Exercise
//
//  Created by 袁思曾 on 2017/5/3.
//  Copyright © 2017年 袁思曾. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class MapViewController: UIViewController {

    @IBOutlet var customMapView: MKMapView!
    private lazy var location:CLLocationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        location.requestWhenInUseAuthorization()
        self.customMapView.showsPointsOfInterest = true
        self.customMapView.showsUserLocation = true
        self.customMapView.userTrackingMode = .followWithHeading
        if #available(iOS 9.0, *) {
            self.customMapView.mapType = .hybridFlyover
        }
        self.customMapView.mapType = .standard
        self.customMapView.showsCompass = true
        self.customMapView.showsBuildings = true
        self.customMapView.showsTraffic = true
        
        self.customMapView.isZoomEnabled = true
        self.customMapView.isRotateEnabled = true
        self.customMapView.isScrollEnabled = true
        
        // Do any additional setup after loading the view.
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
    extension MapViewController: MKMapViewDelegate {
        //当地图获取到用户的位置的时候回调用该方法
        func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
            userLocation.title = ""
            userLocation.subtitle = ""
            let center = userLocation.location?.coordinate
            customMapView.setCenter(center!, animated: true)
            
            //改变显示区域
            let span = MKCoordinateSpanMake(2.2, 48.52)
            let region = MKCoordinateRegionMake(center!, span)
            mapView.setRegion(region, animated: true)
            
        }
    }
    

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


