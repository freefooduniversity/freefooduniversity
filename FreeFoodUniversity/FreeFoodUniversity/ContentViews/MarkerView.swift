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
                HStack {
                    Text(makeMarkerTitle(food: markerData.food, building: "Creswell"))
                        .bold()
                        .font(.custom("Helvetica Neue", size: 20))
                        .foregroundColor(.black)
                        .position(x:180, y: 15)
                    Button(action: {
                        markerClicked = ""
                    }) {
                        HStack {
                            Text("")
                            Text("Back    ")
                                .font(.custom("Helvetica Neue", size: 16))
                                .foregroundColor(.white)
                        }
                    }.background(Color.purple).cornerRadius(15).position(x: 140, y: 25)
                }
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Time: ").bold().underline()
                        Text(String(markerData.start_time) + " - " + String(markerData.end_time))
                        Text(" ")
                        Text("Signed Up: ").bold().underline()
                        Text(String(markerData.dibs) + " / " + String(markerData.capacity))
                        Text(" ")
                        Text("Event: ").bold().underline()
                        Text("None Yet")
                        Text(" ")
                        Text("Coming Soon")
                    }.position(x: 70, y: 50)
                    VStack {
                        Image("Headshot")
                            .frame(width: 50, height: 100)
                    }.position(x: 125, y: 55)
                }.position(x: 180, y: 35)
            }
        }.position(x: 200, y: 95)
    }

}


