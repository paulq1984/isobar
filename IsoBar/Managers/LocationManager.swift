//
//  LocationManager.swift
//  IsoBar
//
//  Created by PaulQ on 2024-05-19.
//

import Foundation
import CoreLocation
import OSLog

class LocationManager: NSObject, ObservableObject {
    let logger = Logger(subsystem: "LocationManager", category: "Location")
    @Published var currentLocation: CLLocation?
    
    private let locationManager = CLLocationManager()
    
    override init() {
        super.init()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.delegate = self
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last, currentLocation == nil else { return }
        DispatchQueue.main.async {
            self.currentLocation = location
        }
    }
    
}
