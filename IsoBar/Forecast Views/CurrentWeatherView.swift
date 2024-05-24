//
//  CurrentWeatherView.swift
//  IsoBar
//
//  Created by PaulQ on 2024-05-23.
//

import SwiftUI
import WeatherKit

struct CurrentWeatherView: View {
    let weatherManager = WeatherManager.shared
    let currentWeather: CurrentWeather
    let highTemperature: String?
    let lowTemperature: String?
    let timezone: TimeZone
    
    var body: some View {
        Text(currentWeather.date.localDate(for: timezone))
        Text(currentWeather.date.localTime(for: timezone))
        Image(systemName: currentWeather.symbolName)
            .renderingMode(.original)
            .symbolVariant(.fill)
            .font(.system(size: 60, weight: .bold))
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(.secondary.opacity(0.2))
            )
        let temp = weatherManager.tempFormatter.string(from: currentWeather.temperature)
        Text(temp)
            .font(.title2)
        if let highTemperature, let lowTemperature {
            Text("H: \(highTemperature) L:\(lowTemperature)")
                .bold()
        }
        Text(currentWeather.condition.description)
            .font(.title3)
    }
    
}
