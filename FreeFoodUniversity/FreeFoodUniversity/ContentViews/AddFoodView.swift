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
    
    @State var changeImage = false
    @State var openCameraRoll = false
    @State var imageSelected = UIImage()
    
    @State var duration: String = ""
    @State var building: String = ""
    @State var event: String = ""
    @State var details: String = ""
    @State var capacity: String = ""
    @State var foodSelection = "Food"
    @State var durationSelection = "Duration"
    @State var capacitySelection = "Capacity"
    
    let foods = [" Select Food ", " Pizza 🍕 ", " Burgers 🍔 ", " Breakfast 🍳 ", " Lunch 🥘 ", " Dinner 🍽️ ", " Dessert 🍦 ", " Fruit 🍉 ", " Mexican 🌮 ", " Coffee ☕️ ", " Sandwiches 🥪 ", " Chick-fil-A 🐄 "]
    let durations = [" Select Duration ", " 30 min ", " 1 hr ", " 2 hrs ", " 3 hrs ", "4 hrs"]
    let capacities = [" Select Capacity ", " 1 🧑🏻‍💼 ", " 5 🧑🏻‍💼 ", " 10 🧑🏻‍💼 ", " 25 🧑🏻‍💼 ", " 50 🧑🏻‍💼 ", " 100 🧑🏻‍💼 ", " 250 🧑🏻‍💼 ", " 500 🧑🏻‍💼 "]
    
    var body: some View {
        ZStack {
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
                        changeImage = true
                        openCameraRoll = true
                    }) {
                        if changeImage {
                            VStack {
                                Image(uiImage: imageSelected)
                                    .resizable()
                                    .frame(width: 120, height: 120)
                                Text(" Done!     ")
                                    .font(.custom("Helvetica Neue", size: 11))
                                    .foregroundColor(.white)
                            }
                        } else {
                            VStack {
                                Image("camera")
                                Text(" Take a Picture of the Food!     ")
                                    .font(.custom("Helvetica Neue", size: 11))
                                    .foregroundColor(.white)
                            }
                        }
                    }.background(Color.purple).cornerRadius(15)
                }
                HStack {
                    Button(action: {
                        if (foodSelection != "" && durationSelection != "" && capacitySelection != "" && building != "" && event != "" && details != "") {
                            addMarker(id: Int.random(in: 1..<10000000), foodSelection: foodSelection, lat: lat, long: long, college: college, duration: durationSelection, capacity: capacitySelection,
                                      building: building, event: event, additional_info: details)
                            addFood = false
                        } else {
                            
                        }
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
        }.sheet(isPresented: $openCameraRoll) {
            ImagePicker(selectedImage: $imageSelected, sourceType: .camera)
        }
        Text("*Remember*: You're logged into Google.")
            .font(.custom("Helvetica Neue", size: 22))
            .foregroundColor(.black)
        Text("*Don't* post inappropriate info")
            .font(.custom("Helvetica Neue", size: 22))
            .foregroundColor(.black)
    }
    
    
}

func getTimeZone() -> Int {
    let timeZone = TimeZone.current.abbreviation()!
    if (Array(timeZone)[0] == "P") {
        return 3
    } else if (Array(timeZone)[0] == "C") {
        return 1
    } else if (Array(timeZone)[0] == "M") {
        return 2
    }
    
    return 0
}

func getStartTime() -> Int {
    let today = Date()
    let hour = Calendar.current.component(.hour, from: today)
    let minute = Calendar.current.component(.minute, from: today)
    
    var time = 0
    
    time = hour * 100
    time += minute
    return time
}

func getEndTime(duration : String) -> Int {
    let startTime = getStartTime()
    
    let split = duration.split(separator: " ")
    
    var add = Int(split[0])!
    if (split[1] == "hr" || split[1] == "hrs") {
       
        return startTime + (add * 100) + 400
        
    } else {
        if (startTime % 100 >= 30) {
            return startTime + 470
        } else {
            return startTime + 430
        }
    }

}

func addMarker(id: Int, foodSelection: String, lat: Double, long: Double, college: String, duration : String, capacity: String, building: String, event: String, additional_info: String) {
    getTimeZone()
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
    
    var food = getFoodFromDropDownName(food: foodSelection)
    print("capacity: " + capacity)
    let body: [String: AnyHashable] = [
        "id": id,
        "food": food,
        "lat": lat,
        "long": long,
        "college": college,
        "start_time": getStartTime(),
        "end_time": getEndTime(duration: duration),
        "time_zone": getTimeZone(),
        "capacity": 200,
        "dibs": 134,
        "likes": 41,
        "dislikes": 11,
        "creator_email": "free@gmail.com",
        "pic_url": "place_holder",
        "event": event,
        "building": building,
        "additional_info": additional_info
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
 
