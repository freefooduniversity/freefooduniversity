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
                HStack {
                    Text(makeMarkerTitle(food: marker.food, building: marker.building))
                        .bold()
                        .font(.custom("Helvetica Neue", size: 20))
                        .foregroundColor(.black)
                        .position(x:180, y: 25)
                }
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text(formatTime(time: Int(marker.start_time)!, delay: 0) + " - " + formatTime(time: Int(marker.end_time), delay: 4))
                        Text("Active Now!")
                            .foregroundColor(Color.green)
                        Text(" ")
                        Text("Signed Up: ").bold().underline()
                        Text(String(marker.dibs) + " / " + String(marker.capacity))
                        Text(" ")
                        Text("Event: ").bold().underline()
                        Text(marker.event)
                        Text(" ")
                        Text(marker.additional_info)
                    }.position(x: 95, y: 50)
                    
                        Image("Headshot")
                            .frame(width: 50, height: 100)
                            .position(x: 125, y: 50)
                    
                     
                }.position(x: 180, y: 15)
                
                Button(action: {
                    showMarkerView = false
                    showListView = false
                    title = ""
                }) {
                    HStack {
                        Text("")
                        Text("Go Back")
                            .font(.custom("Helvetica Neue", size: 16))
                            .foregroundColor(.white)
                    }
                }.background(Color.purple).cornerRadius(15)
                 
            }
        }.position(x: 200, y: 95)
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
        hours -= 12
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


