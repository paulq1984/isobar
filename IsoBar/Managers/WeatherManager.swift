//
//  WeatherManager.swift
//  IsoBar
//
//  Created by PaulQ on 2024-05-23.
//

import Foundation
import CoreLocation
import WeatherKit
import OSLog

@Observable class WeatherManager {
    private let weatherService = WeatherService()
    var weather: Weather?
    
    var logger = Logger(subsystem: "WeatherManager", category: "weather")
    var address = ""
    
    func getWeather(location: CLLocation) async {
        do {
            weather = try await Task.detached(priority: .userInitiated) { [weak self] in
                return try await self?.weatherService.weather(for: .init(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude))
            }.value
            reverseGeocode(location: location)
        } catch {
            logger.error("Failed to get weather \(error)")
        }
    }
    
    func reverseGeocode(location: CLLocation) {
        CLGeocoder().reverseGeocodeLocation(location) { placemarks, error in
            if let error = error {
                print("Error: \(error)")
                return
            }

            if let placemark = placemarks?.first {
                self.address = "\(placemark.locality ?? ""), \(placemark.administrativeArea ?? "")"
                self.logger.info("\(self.address)")
            } else {
                self.address = "No address found"
            }
        }
    }
}
