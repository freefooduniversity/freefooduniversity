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
    
    @Binding var food: String
    @Binding var lat: Double
    @Binding var long: Double
    @Binding var startTime: Int
    @Binding var endTime: Int
    @Binding var capacity: Int // limit to number of people who can get food at this event
    @Binding var dibs: Int // number of ppl who are planning to attend this event
    @Binding var building: String
    @Binding var event: String
    @Binding var additionalInfo: String
    @Binding var image: String
    @Binding var signedIn: Bool
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Text("Free " + getFoodDisplayName(food: food) + " at " + building + "!")
                        .font(.custom("Helvetica Neue", size: 20))
                        .foregroundColor(.black)
                    
                    Text("Event Lasts From : " + String(startTime) + " - " + String(endTime))
                    Text("Signed Up: " + String(dibs) + " / " + String(capacity))
                    Text("Event: " + event)
                    Text("Additional Info: " + additionalInfo)
                }.position(x:130, y:45)
                VStack {
                    Image("x")
                    Image("Headshot")
                }
            }
        }.position(x: 200, y: 115)
    }

}

