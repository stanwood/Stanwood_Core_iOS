//
//  LocationManager.swift
//  Stanwood Arch Demo
//
//  Created by AT on 9/27/18.
//  Copyright © 2018 Stanwood. All rights reserved.
//

import Foundation
import CoreLocation

class LocationManager: NSObject {
    
    
    // MARK:- Properties
    
    
    /// Instance
    var locationManager: CLLocationManager?
    static var shared = LocationManager()
    var completion: LocationBlock?
    var currentLocation: CLLocation?
    var dummyLocation: CLLocation{
        return CLLocation(latitude: 52.518425, longitude: 13.384111)
    }

    /// Static
    static var locationPermissionGranted: Bool {
        return locationPermission() == .authorizedAlways || locationPermission() == .authorizedWhenInUse
    }
    
    static var locationPermissionDenied: Bool {
        return locationPermission() == .denied
    }

    static var locale: String {
        return "TEMP"//LocaleManager.localeForCurrentTimezone
    }
    
    
    // MARK:- Initialisers
    
    
    override init() {
        super.init()
        main{
            self.locationManager = CLLocationManager()
            self.locationManager?.delegate = self
            self.locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        }
    }
    
    
    // MARK:- Functions
    
    
    func requestWhenInUse(_ completion: LocationBlock?){

        self.completion = completion
        main{
            self.locationManager?.requestWhenInUseAuthorization()
        }
    }
    
    static func locationPermission() -> CLAuthorizationStatus{
        return CLLocationManager.locationServicesEnabled() ? CLLocationManager.authorizationStatus() : .notDetermined
    }
}


// MARK:- CLLocationManagerDelegate


extension LocationManager: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        completion?(LocationManager.locationPermissionGranted)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        guard let lastLocation = locations.last else { return }
        currentLocation = lastLocation
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) { }
}
