//
//  IsoBarApp.swift
//  IsoBar
//
//  Created by PaulQ on 2024-05-19.
//

import SwiftUI

@main
struct IsoBarApp: App {
    @State private var locationManager = LocationManager()
    
    var body: some Scene {
        WindowGroup {
            if locationManager.isAuthorized {
                ForecastView()
            } else {
                LocationDeniedView()
            }
        }
        .environment(locationManager)
    }
}
