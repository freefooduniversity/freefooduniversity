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
            if (marker.food == title && marker.college == college) {
                return marker
            }
        }
        return markerData[0]
    }
    
    var body: some View {
        VStack {
                HStack {
                    Text(makeMarkerTitle(food: getMarkerFromTitleAndCollege(title: title, college: college).food, building: getMarkerFromTitleAndCollege(title: title, college: college).building))
                        .bold()
                        .font(.custom("Helvetica Neue", size: 20))
                        .foregroundColor(.black)
                        .position(x:180, y: 15)
                    Button(action: {
                        title = ""
                        showMarkerView = false
                        showListView = false
                        
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
                        Text(String(getMarkerFromTitleAndCollege(title: title, college: college).start_time) + " - " + String(getMarkerFromTitleAndCollege(title: title, college: college).end_time))
                        Text(" ")
                        Text("Signed Up: ").bold().underline()
                        Text(String(getMarkerFromTitleAndCollege(title: title, college: college).dibs) + " / " + String(getMarkerFromTitleAndCollege(title: title, college: college).capacity))
                        Text(" ")
                        Text("Event: ").bold().underline()
                        Text(getMarkerFromTitleAndCollege(title: title, college: college).event)
                        Text(" ")
                        Text(getMarkerFromTitleAndCollege(title: title, college: college).additional_info)
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


