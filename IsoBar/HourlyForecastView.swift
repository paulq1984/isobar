//
//  HourlyForecastView.swift
//  IsoBar
//
//  Created by PaulQ on 2024-05-19.
//

import SwiftUI
import WeatherKit

struct HourlyForecastView: View {
    let hourWeatherList: [HourWeather]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("HOURLY FORECAST")
                .font(.caption)
                .opacity(0.5)
            ScrollView(.horizontal) {
                HStack {
                    ForEach(hourWeatherList, id: \.date) { hourWeatherItem in
                        VStack(spacing: 20) {
                            Text(hourWeatherItem.date.formatted(date: .omitted, time: .shortened))
                            Image(systemName: "\(hourWeatherItem.symbolName).fill")
                            Text(hourWeatherItem.temperature.formatted(.measurement(numberFormatStyle: .number.precision(.fractionLength(0)))))
                                .fontWeight(.medium)
                        }
                        .padding()
                    }
                }
            }
        }
        .padding().background {
            Color.blue
        }.clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
            .foregroundColor(.white)
    }
}

//#Preview {
//    HourlyForecastView()
//}
