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
    @State var capacity: String = ""
    @State var foodSelection = "Food"
    @State var durationSelection = "Duration"
    @State var capacitySelection = "Capacity"
    
    let foods = [" Select Food ", " Pizza 🍕 ", " Burgers 🍔 ", " Breakfast 🍳 ", " Lunch 🥘 ", " Dinner 🍽️ ", " Dessert 🍦 ", " Fruit 🍉 ", " Mexican 🌮 ", " Coffee ☕️ ", " Sandwiches 🥪 ", " Chick-fil-a 🐄 "]
    let durations = [" Select Duration ", " 30 min ", " 1 hr ", " 1.5 hrs ", " 2 hrs ", " 2.5 hrs ", " 3 hrs "]
    let capacities = [" Select Capacity ", " 1 🧑🏻‍💼 ", " 5 🧑🏻‍💼 ", " 10 🧑🏻‍💼 ", " 25 🧑🏻‍💼 ", " 50 🧑🏻‍💼 ", " 100 🧑🏻‍💼 ", " 250 🧑🏻‍💼 ", " 500 🧑🏻‍💼 "]
    
    var body: some View {
        VStack {
            Text("Add Food To " + getName(college: college))
                .font(.custom("Helvetica Neue", size: 20))
                .foregroundColor(.black)
            HStack(spacing: 30) {
                Picker("Food", selection: $foodSelection) {
                    ForEach(foods, id: \.self) {
                        Text($0).font(.system(size: 20))
                    }
                }.border(.secondary)
                Picker("Duration", selection: $durationSelection) {
                    ForEach(durations, id: \.self) {
                        Text($0).font(.system(size: 20))
                    }
                }.border(.secondary)
                Picker("Capacity", selection: $capacitySelection) {
                    ForEach(capacities, id: \.self) {
                        Text($0).font(.system(size: 20))
                    }
                }.border(.secondary)
            }
            HStack {
                TextField("Building ", text: $building)
                    .frame(width: 180, height: 30)
                    .border(.secondary)
                TextField("Event ", text: $event)
                    .frame(width: 180, height: 30)
                    .border(.secondary)
            }
            HStack {
                TextField("Additional Details ", text: $details)
                    .frame(width: 200, height: 60)
                    .border(.secondary)
                Button(action: {
                    
                }) {
                    VStack {
                        Image("camera")
                        Text(" Take a Picture of the Food!     ")
                            .font(.custom("Helvetica Neue", size: 11))
                            .foregroundColor(.white)
                    }
                }.background(Color.purple).cornerRadius(15)
            }
            HStack {
                Button(action: {
                    addMarker(id: Int.random(in: 1..<10000000), food: food, lat: lat, long: long, college: college)
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
        }.position(x:195, y:105)
        HStack {
            Image("google")
            Button(action: {
                
            }) {
                HStack {
                    Image("blue")
                    Text("Sign in with Google To Add Food      ")
                        .font(.custom("Helvetica Neue", size: 16))
                        .foregroundColor(.white)
                }
            }.background(Color.green).cornerRadius(15)
        }
        Text("")
        Text("Once logged into Google, remove view of above sign in button and instead display below messages")
        Text(" ")
        Text("*Remember*: You're logged into Google.")
        Text("*Don't* post false or inappropriate info")
    }
}

func addMarker(id: Int, food: String, lat: Double, long: Double, college: String) {
    if (lat == 37.0902 || long == -95.7129) {
        print("TURN LOCATION ON")
        return
    }
    
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
        "long": long,
        "college": college,
        "start_time": 445,
        "end_time": 545,
        "capacity": 200,
        "dibs": 134,
        "likes": 41,
        "dislikes": 11,
        "creator_email": "free@gmail.com",
        "pic_url": "place_holder",
        "event": "Burger Club",
        "building": "Brumby hall",
        "additional_info": "info"
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
 
