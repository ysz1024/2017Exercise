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
    
    lazy var geoc :CLGeocoder = {
        return CLGeocoder()
    }()
    //定位管理器
    private lazy var locationManager:CLLocationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        requestLocationAccess()
        self.customMapView.showsPointsOfInterest = true
        self.customMapView.showsUserLocation = true
        self.customMapView.userTrackingMode = .follow
        //地图类型
        if #available(iOS 9.0, *) {
            self.customMapView.mapType = .hybridFlyover
        }
        self.customMapView.mapType = .standard
        
        ///        self.customMapView.isScrollEnabled = true
        
        // Do any additional setup after loading the view.
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let point = touches.first?.location(in: customMapView)
        let coordinate = customMapView.convert(point!, toCoordinateFrom: customMapView)
        let annotation = addAnnotation(coordinate: coordinate, title: "sss", subTitle: "ssss")
        let location = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
        geoc.reverseGeocodeLocation(location) { (clpls, Error) in
            if Error.self != nil{
                return
            }
            //取出坐标对象
            guard let clpl = clpls?.first else {return}
            
            annotation.title = clpl.locality
            
        }
    }
    
    func requestLocationAccess(){
        let status = CLLocationManager.authorizationStatus()
        switch status {
        case .authorizedAlways,.authorizedWhenInUse:
            return
        case .denied,.restricted:
            print("location access denied")
        default:
            locationManager.requestWhenInUseAuthorization()
        }
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
            let objectAnnotation = TGAnnotation()
//            objectAnnotation.coordinate = CLLocation(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude).coordinate
            objectAnnotation.title = "I am here"
            objectAnnotation.subtitle = "1111111"
            self.customMapView.addAnnotation(objectAnnotation)
            
        }
        
        func  mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//            if annotation is MKUserLocation{
//                return nil
//            }
            let reuserId = "pin"
            var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuserId)
                as? MKPinAnnotationView
            
            if pinView == nil {
                //创建一个大头针视图
                pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuserId)
                pinView?.canShowCallout = true
                pinView?.animatesDrop = true
                
                //设置大头针颜色
                pinView?.pinTintColor = UIColor.blue
                //设置大头针点击注释视图的右侧按钮样式
                pinView?.rightCalloutAccessoryView = UIButton(type: .custom)
                            }else{
                pinView?.annotation = annotation
                

            }
            pinView?.isDraggable = true
            return pinView

        
        }
        
        func addAnnotation(coordinate :CLLocationCoordinate2D, title :String, subTitle :String) -> TGAnnotation{
            // 1.创建一个大头针
            let annotation:TGAnnotation = TGAnnotation()
            // 2.确定大头针的经纬度(在地图上显示的位置)
            annotation.coordinate = coordinate
            // 3.设置标题和子标题
            annotation.title = title
            annotation.subtitle = subTitle
            // 4.添加到地图上
            customMapView.addAnnotation(annotation)
            return annotation
        }
        
        
        class TGAnnotation: NSObject, MKAnnotation {
            var coordinate: CLLocationCoordinate2D = CLLocationCoordinate2DMake(0, 0)
            var title: String?
            var subtitle: String?
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


