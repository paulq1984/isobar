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
    
    @State private var address = ""
    
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
                CurrentWeatherView(currentWeather: weather.currentWeather, address: self.$address)
//                VStack(){
//                    Text(self.address)
//                        .font(.largeTitle)
//                    Text("\(weather.currentWeather.temperature.formatted(.measurement(numberFormatStyle: .number.precision(.fractionLength(0)))))")
//                    
//                }
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
                reverseGeocode(location: location)
                //}
                
            } catch {
                
            }
        }
        
    }
}

extension ContentView {
    func reverseGeocode(location: CLLocation) {
        CLGeocoder().reverseGeocodeLocation(location) { placemarks, error in
            if let error = error {
                print("Error: \(error)")
                return
            }

            if let placemark = placemarks?.first {
                self.address = "\(placemark.locality ?? ""), \(placemark.administrativeArea ?? "")"
            } else {
                self.address = "No address found"
            }
        }
    }
}

#Preview {
    ContentView()
}
