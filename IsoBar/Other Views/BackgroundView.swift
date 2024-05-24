//
//  BackgroundView.swift
//  IsoBar
//
//  Created by PaulQ on 2024-05-24.
//

import SwiftUI
import WeatherKit

struct BackgroundView: View {
    let condition: WeatherCondition
    
    var body: some View {
        Image(condition.rawValue)
            .blur(radius: 5)
            .colorMultiply(.white.opacity(0.8))
    }
}

#Preview {
    BackgroundView(condition: .cloudy)
}
