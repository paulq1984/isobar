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
            VStack(alignment: .center) {
                Text(address)
                    .font(.title)
                HStack() {
                    Image(systemName: "\(currentWeather.symbolName).fill")
                        .resizable()
                        .frame(width: 100, height: 100)
                    Spacer()
                    VStack() {
                        Text(currentWeather.temperature.formatted(.measurement(numberFormatStyle: .number.precision(.fractionLength(0)))))
                            .font(.largeTitle)
                    }
                    
                }
            }
            .padding(.vertical)
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
