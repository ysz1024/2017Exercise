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
    //定位管理器
    private lazy var locationManager:CLLocationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.requestWhenInUseAuthorization()
        self.customMapView.showsPointsOfInterest = true
        self.customMapView.showsUserLocation = true
        self.customMapView.userTrackingMode = .followWithHeading
        //地图类型
        if #available(iOS 9.0, *) {
            self.customMapView.mapType = .hybridFlyover
        }
        self.customMapView.mapType = .standard
        
        //创建MKCoordinateSpan对象，设置地图范围（越小越精确）
//        let latDelta = 0.05
//        let longDelta = 0.05
//        let currentLocationSpan:MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: longDelta)
//        
//        let center:CLLocation = locationManager.location?.coordinate
//        let currentRegion:MKCoordinateRegion = MKCoordinateRegion(center: center.coordinate, span: currentLocationSpan)
//        
//        
//        self.customMapView.setRegion(currentRegion, animated: true)
        
        
//        self.customMapView.showsCompass = true
//        self.customMapView.showsBuildings = true
//        self.customMapView.showsTraffic = true
//        
//        self.customMapView.isZoomEnabled = true
//        self.customMapView.isRotateEnabled = true
//        self.customMapView.isScrollEnabled = true
        
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
            
            let center = userLocation.location?.coordinate
//            customMapView.setCenter(center!, animated: true)
            
            //改变显示区域
//            创建MKCoordinateSpan对象，设置地图范围（越小越精确）
            let latDelta = 0.05
            let longDelta = 0.05
            let currentLocationSpan:MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: longDelta)
            let currentRegion:MKCoordinateRegion = MKCoordinateRegion(center: center!, span: currentLocationSpan)
            //设置显示区域
            customMapView.setRegion(currentRegion, animated: true)
            
            //设置大头针
            let objectAnnotation = MKPointAnnotation()
            objectAnnotation.coordinate = CLLocation(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude).coordinate
            objectAnnotation.title = "I am here"
            objectAnnotation.subtitle = "1111111"
            self.customMapView.addAnnotation(objectAnnotation)
            
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


