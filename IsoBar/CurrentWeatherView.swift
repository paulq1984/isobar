//
//  CurrentWeatherView.swift
//  IsoBar
//
//  Created by PaulQ on 2024-05-23.
//

import SwiftUI
import WeatherKit

struct CurrentWeatherView: View {
    let currentWeather: CurrentWeather
    @Binding var address: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("CURRENT CONDITIONS")
            .font(.caption)
            .opacity(0.5)
            VStack(alignment: .leading) {
                Text(address)
                Text(currentWeather.temperature.formatted(.measurement(numberFormatStyle: .number.precision(.fractionLength(0)))))
                Text("\(currentWeather.condition)")
            }
            .padding()
        }
        .padding().background {
            Color.blue
        }.clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
            .foregroundColor(.white)
        .onAppear {
            print(currentWeather)
        }
    }
}


//#Preview {
//    CurrentWeatherView()
//}
