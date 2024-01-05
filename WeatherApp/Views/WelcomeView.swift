//
//  WelcomeView.swift
//  WeatherApp
//
//  Created by A'zamjon Abdumuxtorov on 04/01/24.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    @EnvironmentObject var locationManager: LocationManager
    var body: some View {
        VStack{
            VStack(spacing:20){
                Text("Welcome to the Weather App")
                    .bold().font(.title)
                Text("Please share your current location to get the weather in your area").padding()
            }.multilineTextAlignment(.center)
                .padding()
            
            LocationButton(.shareMyCurrentLocation){
                locationManager.requestLocation()
            }.cornerRadius(30)
                .symbolVariant(.fill)
                .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
    }
}

#Preview {
    WelcomeView()
}
