//
//  AddFoodView.swift
//  FreeFoodUniversity
//
//  Created by William Sirotkin on 7/11/22.
//

import Foundation
import SwiftUI
import UIKit
import FirebaseCore
import FirebaseStorage

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
    let durations = [" Select Duration ", " 30 min ", " 1 Hour ", " 2 Hours ", " 3 Hours ", " 4 Hours "]
    let capacities = [" Select Capacity ", " 1 🧑🏻‍💼 ", " 5 🧑🏻‍💼 ", " 10 🧑🏻‍💼 ", " 25 🧑🏻‍💼 ", " 50 🧑🏻‍💼 ", " 100 🧑🏻‍💼 ", " 250 🧑🏻‍💼 ", " 500 🧑🏻‍💼 "]
    
    var body: some View {
        var data = Data()
        ZStack {
            VStack {
                Text("Add A Food Event To " + getName(college: college))
                    .underline()
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
                        print(555)
                        print(getStartTime())
                        print(getStartTime() > 500)
                        print(getStartTime() < 2000)
                        if (foodSelection != "" && durationSelection != "" && capacitySelection != "" && building != "" && event != "" && details != "" && getStartTime() < 2000 && getStartTime() > 500 && imageSelected != UIImage()) {
                            var id = Int.random(in: 1..<10000000)
                            FirebaseApp.configure()
                            let storage = Storage.storage()
                            data = imageSelected.jpegData(compressionQuality: 0.3)!
                            let storageRef = storage.reference()
                            let imagesRef = storageRef.child("food-images")
                            var newRef = storageRef.child("food-images/" + String(id))
                            let metadata = StorageMetadata()
                            let localFile = URL(string: "uga")!
                            metadata.contentType = "image/jpeg"
                            // Upload the file to the path "images/rivers.jpg"
                            let uploadTask = newRef.putData(data, metadata: nil) { (metadata, error) in
                              guard let metadata = metadata else {
                                // Uh-oh, an error occurred!
                                return
                              }
                              // Metadata contains file metadata such as size, content-type.
                              let size = metadata.size
                              // You can also access to download URL after upload.
                              newRef.downloadURL { (url, error) in
                                guard let downloadURL = url else {
                                  // Uh-oh, an error occurred!
                                  return
                                }
                              }
                            }
                            
                                 
                            addMarker(id: id, foodSelection: foodSelection, lat: lat, long: long, college: college, duration: durationSelection, capacity: getCapacity(capacity: capacitySelection),
                                      building: building, event: event, additional_info: details, email: UIDevice.current.identifierForVendor!.uuidString)
                            addFood = false
                        } else {
                            /*
                            print("deleted")
                            // alert user
                            FirebaseApp.configure()
                            let storage = Storage.storage()
                            let storageRef = storage.reference()
                            let imagesRef = storageRef.child("food-images")
                            let newRef  = imagesRef.child("")
                            newRef.delete { error in
                              if let error = error {
                                // Uh-oh, an error occurred!
                              } else {
                                // File deleted successfully
                              }
                            }
                            */
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
        VStack (alignment: .leading){
        Text(" ")
        Text(" ")
        Text("⚫️ All Above Fields Are Required")
        Text(" ")
        Text("⚫️ 25 Character Max On Each Above Field")
        Text(" ")
        Text("⚫️ Your current location is used for event location")
      //  Text("Inappropriate posts will result in an immediate ban.")
     //       .font(.custom("Helvetica Neue", size: 16))
      //      .foregroundColor(.black)
        }.position(x: 195, y: 50)
    }
    
    
}

func getCapacity(capacity: String) -> Int {
    var ret = 0
    if (capacity.count == 5) {
        ret = Int(substring(string: capacity, fromIndex: 1, toIndex: 2)!)!
    }
    if (capacity.count == 6) {
        ret = Int(substring(string: capacity, fromIndex: 1, toIndex: 3)!)!
    }
    if (capacity.count == 7) {
        ret = Int(substring(string: capacity, fromIndex: 1, toIndex: 4)!)!
    }
    
    return ret
}

func substring(string: String, fromIndex: Int, toIndex: Int) -> String? {
    if fromIndex < toIndex && toIndex < string.count /*use string.characters.count for swift3*/{
        let startIndex = string.index(string.startIndex, offsetBy: fromIndex)
        let endIndex = string.index(string.startIndex, offsetBy: toIndex)
        return String(string[startIndex..<endIndex])
    }else{
        return nil
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
    var hour = Calendar.current.component(.hour, from: today)
    var minute = Calendar.current.component(.minute, from: today)
    if (minute % 15 != 0) {
        minute -= minute % 15
        if (minute == 45) {
            minute = 0
            hour += 1
        } else {
            minute += 15
        }
    }
    var time = 0
    
    time = hour * 100
    time += minute
    return time
}

func getEndTime(duration : String) -> Int {
    let startTime = getStartTime()
    
    let split = duration.split(separator: " ")
    
    var add = Int(split[0])!
    if (split[1] == "Hour" || split[1] == "Hours") {
       
        return startTime + (add * 100) + 400
        
    } else {
        if (startTime % 100 >= 30) {
            return startTime + 470
        } else {
            return startTime + 430
        }
    }

}



