//
//  HourlyForecastChartView.swift
//  IsoBar
//
//  Created by PaulQ on 2024-05-23.
//

import SwiftUI
import WeatherKit
import Charts

struct HourlyForecastChartView: View {
    
    let hourlyWeatherData: [HourWeather]
    
    var body: some View {
        Chart {
            ForEach(hourlyWeatherData.prefix(10), id: \.date) { hourlyWeather in
                BarMark(x: .value("Hour", hourlyWeather.date.formatAsAbbreviatedTime()), y: .value("Temp", hourlyWeather.temperature.converted(to: .celsius).value))
            }
        }
    }
}

//#Preview {
//    HourlyForecastChartView()
//}
