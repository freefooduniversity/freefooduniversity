//
//  TurnOnLocationView.swift
//  FreeFoodUniversity
//
//  Created by William Sirotkin on 8/20/22.
//

import Foundation
import SwiftUI
import UIKit

struct TurnOnLocationView: View {
    @Binding var lat: Double
    @Binding var long: Double
    @Binding var addFood: Bool
    @ObservedObject var locationManager = LocationManager()
    
    func getUserLocation() {
        if locationManager.userLocation == nil {
           locationManager.requestLocation()
            var gotLocation = false
            for i in 1 ... 70 {
                DispatchQueue.main.asyncAfter(deadline: .now() + Double(i)/10) {
                    if let location = locationManager.userLocation {
                        if (!gotLocation) {
                            self.lat = location.coordinate.latitude
                            self.long = location.coordinate.longitude
                        }
                    }
                }
            }
        } else if let location = locationManager.userLocation {
            self.lat = location.coordinate.latitude
            self.long = location.coordinate.longitude
        }
    }
    
    var body: some View {
        VStack {
            Text("Your current location is used for event location")
            Button(action: {
                getUserLocation()
            }) {
                Text(" ")
                Text("Click Here to Turn On Your Location")
                    .foregroundColor(Color.white)
                Text(" ")
            }.background(Color.blue).cornerRadius(15)
            Text(" ")
            Text(" ")
            Text(" ")
            Button (" Cancel ") {
                addFood = false
            }
        }.position(x:200, y:90)
    }
}
