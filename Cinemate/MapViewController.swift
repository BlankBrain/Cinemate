//
//  MapViewController.swift
//  Cinemate
//
//  Created by Md. Mehedi Hasan on 9/2/20.
//  Copyright © 2020 Md. Mehedi Hasan. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, MKMapViewDelegate {

    // MARK: - outlets
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var nearestTheaterLabel: UILabel!
    @IBOutlet weak var nearestTheaterAddressLabel: UILabel!
    @IBOutlet weak var myAddress: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    
    // MARK: - Other variables
    let locationManager = CLLocationManager()
    private var regionInMeters:Int = 10000
    
    
    // MARK: - Viewdidload
    override func viewDidLoad() {
        mapView.delegate = self
        super.viewDidLoad()
        checkLocationService()
        usernameLabel.text = TempData.UserEmail 

    }
    


}
extension MapViewController: CLLocationManagerDelegate{
     
    // MARK: - other location codes
    func setupLocationManager(){
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    func centerViewOnLocation(){
        if let location = locationManager.location?.coordinate{
            let region = MKCoordinateRegion.init(center: location , latitudinalMeters: CLLocationDistance(regionInMeters) , longitudinalMeters: CLLocationDistance(regionInMeters))
            mapView.setRegion(region, animated: true)
        }
    }
    
    
    
    // MARK: - check location is enabled
    func checkLocationService(){
        if(CLLocationManager.locationServicesEnabled()){
            
        }else{
            AlartController.showAlart(self, title: "Errer", message: "Location Service is disabled ! , Enable location services to use this service !")
        }
        
        
    }
    // MARK: - check location auth
    func checkLocationAuth(){
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            mapView.showsUserLocation = true
            centerViewOnLocation()
            locationManager.startUpdatingLocation() 
        case .denied:
            AlartController.showAlart(self, title: "Error!" , message: "This service needs location permission to oporate ! , go to system settings and enable it for this app ! ")
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
             AlartController.showAlart(self, title: "Error!" , message: "This service needs location permission to oporate !")
        case .authorizedAlways:
            break
        @unknown default:
            AlartController.showAlart(self, title: "unknown map errer", message: "we are sorry , please let us know this happened")
        }
        
    }
    
    
    // MARK: - protocols
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        setupLocationManager()
        checkLocationAuth()
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        //code
    }
    
    
}
