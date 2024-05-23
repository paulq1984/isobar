//
//  TenDayForecastView.swift
//  IsoBar
//
//  Created by PaulQ on 2024-05-19.
//

import SwiftUI
import WeatherKit

struct TenDayForecastView: View {
    let dayWeatherList: [DayWeather]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("10-DAY FORECAST")
            .font(.caption)
            .opacity(0.5)
            
            List(dayWeatherList, id: \.date) { dailyWeather in
                HStack() {
                    Text(dailyWeather.date.formatAsAbbreviatedDay())
                        .frame(maxWidth: 50, alignment: .leading)
                    Image(systemName: "\(dailyWeather.symbolName).fill")
                    Text(dailyWeather.lowTemperature.formatted())
                        .frame(maxWidth: .infinity)
                    Text(dailyWeather.highTemperature.formatted())
                        .frame(maxWidth: .infinity)
                }.listRowBackground(Color.blue)
            }.listStyle(.plain)
        }
        .padding()
        .background(content: {
            Color.blue
        })
        .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
        .foregroundColor(.white)
    }
}

extension Date {
    func formatAsAbbreviatedDay() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE"
        return formatter.string(from: self)
    }
    
    func formatAsAbbreviatedTime() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "ha"
        return formatter.string(from: self)
    }
}

//#Preview {
//    TenDayForecastView()
//}
