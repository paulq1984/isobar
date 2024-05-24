//
//  LocationDeniedView.swift
//  IsoBar
//
//  Created by PaulQ on 2024-05-24.
//

import SwiftUI

struct LocationDeniedView: View {
    var body: some View {
        ContentUnavailableView(label: {
            Label("Location Service", systemImage: "gear")
        }, description: {
            Text("""
        1. Tap on the button below
        2. Tap on Location Services
        3. Locate the "IsoBar" app and tap on it
        4. Change the settings to "While in Use
        """).multilineTextAlignment(.leading)
        }, actions: {
            Button(action: {
                UIApplication.shared.open (
                    URL(string: UIApplication.openSettingsURLString)!,
                    options: [:],
                    completionHandler: nil
                )
            }) {
                Text("Open Settings")
            }
        }
                               
        )
    }
}

#Preview {
    LocationDeniedView()
}
