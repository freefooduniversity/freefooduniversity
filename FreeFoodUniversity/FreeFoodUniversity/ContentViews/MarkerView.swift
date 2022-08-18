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
    
    var markerData : [Marker]
    @Binding var title: String
    var college: String
    @Binding var showMarkerView: Bool
    @Binding var showListView: Bool
    @Binding var hasLiked: Bool
    @Binding var hasSignedUp: Bool
    @Binding var hasReported: Bool
    @Binding var reload: Bool
    @Binding var enlargeImage: Bool
    
    func getMarkerFromTitleAndCollege(title: String, college: String) -> Marker {
        for marker in markerData {
            let index = title.firstIndex(of: "|")
            if (index != nil) {
                let fromIndex = title.index(title.startIndex, offsetBy: title.distance(from: title.startIndex, to: index!) + 1)
                if (marker.food == title.prefix(upTo: index!) && marker.building == title.substring(from: fromIndex) && marker.college == college) {
                    return marker
                }
            }
        }
        return markerData[0]
    }
    
    var body: some View {
        let marker = getMarkerFromTitleAndCollege(title: title, college: college)
        VStack {
            VStack {
                HStack {
                    Text(makeMarkerTitle(food: marker.food, building: marker.building))
                        .bold()
                        .font(.custom("Helvetica Neue", size: 20))
                        .foregroundColor(.black)
                }
                Text("")
                HStack {
                    Button(action: {
                        if (!hasReported) {
                            updateMarkerButton(id: marker.id, button: "reports", college: marker.college)
                            
                            DispatchQueue.main.async {
                                usleep(300000)
                                hasReported = true
                                reload = !reload
                            }
                        }
                    }) {
                        Image("report")
                            .resizable()
                            .frame(width: 40, height: 40)
                    }
                    Text(" ")
                    Text(String(marker.likes))
                        .foregroundColor(Color.blue)
                    Button(action: {
                        if (!hasLiked) {
                            updateMarkerButton(id: marker.id, button: "likes", college: marker.college)
                            DispatchQueue.main.async {
                                usleep(300000)
                                hasLiked = true
                                reload = !reload
                            }
                        }
                    }) {
                       Image("like")
                            .resizable()
                            .frame(width: 40, height: 40)
                    }
                    Text(" ")
                    Text(String(marker.dislikes))
                        .foregroundColor(Color.blue)
                    Button(action: {
                        if (!hasLiked) {
                            updateMarkerButton(id: marker.id, button: "dislikes", college: marker.college)
                            DispatchQueue.main.async {
                                usleep(300000)
                                hasLiked = true
                                reload = !reload
                            }
                        }
                    }) {
                        Image("dislike")
                            .resizable()
                            .frame(width: 40, height: 40)
                    }
                    Text("  ")
                    Button(action: {
                        let url = URL(string: "https://google.com/maps/dir/?api=1&destination=" + String(marker.lat) + "," + String(marker.long) + "&travelmode=walking")!
                        if UIApplication.shared.canOpenURL(url) {
                            UIApplication.shared.open(url, options: [:], completionHandler: nil)
                            //If you want handle the completion block than
                            UIApplication.shared.open(url, options: [:], completionHandler: { (success) in
                                 print("Open url : \(success)")
                            })
                        }
                    }) {
                        VStack {
                           Text("")
                            HStack {
                                Text("Directions →   ")
                                    .font(.custom("Helvetica Neue", size: 16))
                                    .foregroundColor(.white)
                                Image("")
                            }
                            Text("")
                        }
                    }.background(Color.blue).cornerRadius(15)
                    
                }
            } .position(x:200, y: 45)
            VStack {
                Text("")
                Text("")
            }
            VStack (alignment: .leading){
                HStack {
                    VStack (alignment: .leading){
                        VStack  (alignment: .leading) {
                            Text(" ")
                            Text(" ")
                            HStack {
                                Text("🗓:")
                                Text("Thursday, Dec 31, 2022")
                            }
                            Text(" ")
                        }
                        HStack {
                            Text("⏱:")
                                .bold()
                            Text(formatTime(time: Int(marker.start_time)!, delay: 0) + " - " + formatTime(time: Int(marker.end_time), delay: 4))
                                .underline()
                            Text(" ")
                            Text("Active Now!")
                                .foregroundColor(Color.green)
                                .bold()
                        }
                        Text(" ")
                        HStack {
                            Text("🧑🏻‍💼:").bold()
                            HStack {
                                Text(String(marker.dibs))
                                    .foregroundColor(Color.blue)
                                Text("/")
                                Text(String(marker.capacity))
                                    .foregroundColor(Color.blue)
                            }
                            Text(" ")
                            VStack{
                                Button(action: {
                                    if (!hasSignedUp && marker.dibs < marker.capacity) {
                                        updateMarkerButton(id: marker.id, button: "dibs", college: marker.college)
                                        DispatchQueue.main.async {
                                            usleep(300000)
                                            hasSignedUp = true
                                            reload = !reload
                                        }
                                    }
                                }) {
                                    VStack {
                                     //   Text("")//
                                      //      .font(.custom("Helvetica Neue", size: 2))
                                        HStack {
                                           Text("")
                                            Text("Sign Up!")
                                                .font(.custom("Helvetica Neue", size: 16))
                                                .foregroundColor(.white)
                                            Text("")
                                        }
                                      //  Text("")
                                      //      .font(.custom("Helvetica Neue", size: 2))
                                    }
                                }.background(Color.purple).cornerRadius(15)
                            }
                        }
                        Text(" ")
                        HStack {
                            Text("🎈: ").bold()
                            Text(marker.event)
                        }
                        Text("")
                   //     if (marker.additional_info.count >= 10) {
                            HStack {
                                Text("📝:").bold()
                                Text(marker.additional_info)
                            }
                     //   }
                        ZStack {
                            Image("Headshot")
                               .resizable()
                                .frame(width: 65, height: 100)
                            Button(action: {
                                enlargeImage = true
                            }) {
                                    Image("enlarge")
                                        .resizable()
                                        .frame(width: 35, height: 35)
                                        .position(x: 220, y: 5)
                            }
                        }.position(x: 285, y: -60)
                    }.position(x: 220, y: 45)
                    
                        
                     
                }.position(x: 190, y: 35)
                
                Button(action: {
                    showMarkerView = false
                    showListView = false
                    title = ""
                }) {
                    HStack {
                        Text("")
                        Text(" Close ")
                            .bold()
                            .underline()
                            .font(.custom("Helvetica Neue", size: 18))
                            .foregroundColor(.black)
                        Text("")
                    }
                }.position(x: 195, y:80)
        }.position(x: 200, y: 32)
    }
}
}

func formatTime(time: Int, delay: Int) -> String {
    var formatTime = ""
    var amorpm = ""
    
    
    var hours: Int = ((time - time % 100) / 100)
    var minutes = String(time % 100)
    
    hours -= Int(delay)
    if (time < 1200) { amorpm = "AM"} else {
        amorpm = "PM"
        if (hours >= 13) {
            hours -= 12
        }
    }
    
    if (Int(minutes)! < 10) {
        minutes = "0" + minutes
    }
    formatTime = String(hours) + ":" + minutes + " " + amorpm
    
    return formatTime
}
/*
func formatTimeInt(time: String, delay: Int) -> String {
    var timeInt: Int = Int(time)!
    var formatTime = ""
    var amorpm = ""
    
    var hours: Int = ((timeInt - timeInt % 100) / 100)
    var minutes = String(timeInt % 100)
    
    hours -= delay
    if (timeInt < 1200) {
            amorpm = "AM"
    } else {
        amorpm = "PM"
        hours -= 12
    }
    
    formatTime = String(hours) + ":" + minutes + " " + amorpm
    
    return formatTime
}
 */




