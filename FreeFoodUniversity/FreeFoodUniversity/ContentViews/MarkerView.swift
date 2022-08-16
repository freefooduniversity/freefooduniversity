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
    
    var markerData : Marker
    @Binding var markerClicked: String
    
    var body: some View {
        VStack {
            Button(action: {
                markerClicked = ""
            }) {
                HStack {
                    Text("")
                    Image("back")
                    Text("Go Back      ")
                        .font(.custom("Helvetica Neue", size: 16))
                        .foregroundColor(.white)
                }
            }.background(Color.purple).cornerRadius(15).position(x:70, y: 30)
             
            VStack {
                Text(makeMarkerTitle(food: markerData.food, building: "Creswell"))
                    .bold()
                    .font(.custom("Helvetica Neue", size: 20))
                    .foregroundColor(.black)
                HStack {
                    VStack {
                        Text("Event Lasts From : " + String(markerData.start_time) + " - " + String(markerData.end_time))
                        Text("Signed Up: " + String(markerData.dibs) + " / " + String(markerData.capacity))
                        Text("Event: None Yet")
                        Text("Additional Info: Coming Soon")
                    }
                    VStack {
                        Image("Headshot")
                            .frame(width: 50, height: 100)
                    }
                }
            }
        }.position(x: 200, y: 95)
    }

}

