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
    @Binding var lat: Double
    @Binding var long: Double
    
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
                TextField("Food ", text: $food)
                    .frame(width: 120, height: 30)
                    .border(.secondary)
            }
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
                    addMarker(id: Int.random(in: 1..<10000000), food: food, lat: lat, long: long)
                    addFood = true
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

func addMarker(id: Int, food: String, lat: Double, long: Double) {
    guard let url = URL(string: "https://free-food-university.azurewebsites.net/marker/add") else {
        return
    }
   
    var request = URLRequest(url: url)
    
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    
    let body: [String: AnyHashable] = [
        "id": id,
        "food": food,
        "lat": lat,
        "long": long
    ]
     
   request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
    
    
    // Make the Request
    let task = URLSession.shared.dataTask(with: request) { data, _, error in
        guard let data = data, error == nil else {
            return
        }
        
        do {
            let response = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
            print("SUCESSS")
            print(response)
        } catch {
            print("An error occured: ")
            print(error)
        }
         
    }
    task.resume()
    
}
 
