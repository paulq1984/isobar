//
//  WeatherManager.swift
//  IsoBar
//
//  Created by PaulQ on 2024-05-19.
//

import Foundation
import WeatherKit

class WeatherManager: ObservableObject {
    let weatherService = WeatherService.shared
    
    func getWeather() {
        if let location =
        weatherService.weather(for:)
    }
    
}
