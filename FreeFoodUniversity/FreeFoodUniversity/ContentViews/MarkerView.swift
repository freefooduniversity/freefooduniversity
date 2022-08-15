//
//  MarkerView.swift
//  FreeFoodUniversity
//
//  Created by William Sirotkin on 7/21/22.
//

import Foundation
import SwiftUI
import CoreData
import UIKit

struct MarkerView: View {
    
    @Binding var markerData : Marker
    @Binding var markerClicked: String
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Text("Free " + getFoodDisplayName(food: markerData.food))
                        .font(.custom("Helvetica Neue", size: 20))
                        .foregroundColor(.black)

                    Text("Event Lasts From : " + String(markerData.start_time) + " - " + String(markerData.end_time))
                    Text("Signed Up: " + String(markerData.dibs) + " / " + String(markerData.capacity))
                    Text("Event: None Yet")
                    Text("Additional Info: Coming Soon")
                }.position(x:130, y:45)
                VStack {
                    Button(action: {
                        markerClicked =  ""
                    }) {
                        Image("x")
                    }
                    Image("Headshot")
                }
            }
        }.position(x: 200, y: 115)
    }

}

