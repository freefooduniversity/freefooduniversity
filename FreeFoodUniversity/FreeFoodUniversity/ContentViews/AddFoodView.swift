//
//  AddFoodView.swift
//  FreeFoodUniversity
//
//  Created by William Sirotkin on 7/11/22.
//

import Foundation
import SwiftUI
import UIKit

struct addFoodToMapView: View {
    @Binding var college: String
    @Binding var addFood: Bool
    
    @State var food: String = ""
    @State var duration: String = ""
    @State var building: String = ""
    @State var event: String = ""
    @State var details: String = ""
    @State var maxPeople: String = ""
    
    var body: some View {
        VStack {
            Text("Add Food To " + college)
            HStack {
                TextField("Building ", text: $building)
                    .frame(width: 120, height: 30)
                    .border(.secondary)
                TextField("Event ", text: $event)
                    .frame(width: 120, height: 30)
                    .border(.secondary)
            }
            HStack {
                TextField("Additional Details ", text: $details)
                    .frame(width: 200, height: 80)
                    .border(.secondary)
            }
            HStack {
                Button(action: {
                    
                }) {
                    HStack {
                        Image("blue")
                        Text("Add Food To Map            ")
                            .font(.custom("Helvetica Neue", size: 16))
                            .foregroundColor(.white)
                    }
                }.background(Color.blue).cornerRadius(15)
                Button("Cancel") {
                    addFood = false
                }
            }
        }.position(x:195, y:100)
    }
}
