//
//  ContentView.swift
//  IsoBar
//
//  Created by PaulQ on 2024-05-19.
//

import SwiftUI
import WeatherKit
import CoreLocation


struct ContentView: View {
    @StateObject private var locationManager = LocationManager()
    let weatherService = WeatherService.shared
    @State private var weather: Weather?
    
    var hourlyWeatherData: [HourWeather] {
        if let weather {
            return Array(weather.hourlyForecast.filter {
                hourlyWeather in
                return hourlyWeather.date.timeIntervalSince(Date()) >= 0}.prefix(24))
        } else {
            return []
        }
    }
    
    var body: some View {
        VStack {
            if let weather {
                VStack(){
                    Text("PERTH, ON")
                        .font(.largeTitle)
                    Text("\(weather.currentWeather.temperature.formatted())")
                    
                }
                HourlyForecastView(hourWeatherList: hourlyWeatherData)
                HourlyForecastChartView(hourlyWeatherData: hourlyWeatherData)
                Spacer()
                TenDayForecastView(dayWeatherList: weather.dailyForecast.forecast)
                
            }
        }
        .padding()
        .task(id: locationManager.currentLocation) {
            do {
                //if let location = locationManager.currentLocation {
                let location = CLLocation(latitude: 44.897202, longitude:-76.246208)
                    self.weather = try await weatherService.weather(for: location)
                //}
                
            } catch {
                
            }
        }
        
    }
}

#Preview {
    ContentView()
}
