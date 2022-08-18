//
//  ListView.swift
//  FreeFoodUniversity
//
//  Created by Stephen Nemeth on 8/16/22.
//

import Foundation
import SwiftUI


struct ListView : View {
    
    var markers : [Marker]
    @Binding var showMarkerView : Bool
    @Binding var showListView : Bool
    @Binding var markerClicked : String
    
    var body : some View {
        ScrollView {
            HStack {
            Button {
                showListView = false
                markerClicked = ""
            } label: {
                Text("<- Go Back")
                    .position(x:70, y: 10)
            }
                Text("")
                    .position(x:5, y:10)
            }
            if (markerClicked == "all" && markers.count > 0) {
                Group {
                    ForEach(1...markers.count, id: \.self) { i in
                        Button {
                            showMarkerView = true
                            showListView = false
                            markerClicked = markers[i - 1].food + "|" + markers[i - 1].building
                        } label: {
                            VStack {
                                Text("Free \(getFoodDisplayName(food: markers[i - 1].food)) at \(markers[i - 1].building)")
                                    .bold()
                                    .font(.custom("Helvetica Neue", size: 16))
                                    .foregroundColor(Color.black)
                                HStack {
                                    Image(markers[i - 1].food)
                                        .resizable()
                                        .frame(width: 35, height: 35)
                                    Text(formatTime(time: Int(markers[i-1].start_time)!, delay: 0) + " - " + formatTime(time: Int(markers[i-1].end_time), delay: 4))
                                        .underline()
                                        .foregroundColor(Color.black)
                                    Text(" ")
                                    Image("right-arrow")
                                        .resizable()
                                        .frame(width: 25, height: 25)
                                }
                                HStack {
                                    Text("                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              ")
                                        .font(.system(size:1))
                                }.background(Color.gray)
                            }
                        }.padding(10.0)
                    }
                }
            } else if (markers.count > 0){
                Group  {
                    ForEach(1...markers.count, id: \.self) { i in
                        Button {
                            showMarkerView = true
                            showListView = false
                            markerClicked = markers[i - 1].food + "|" + markers[i - 1].building
                        } label: {
                            VStack {
                                Text("Free \(getFoodDisplayName(food: markers[i - 1].food)) at \(markers[i - 1].building)")
                                    .bold()
                                    .font(.custom("Helvetica Neue", size: 16))
                                    .foregroundColor(Color.black)
                                HStack {
                                    Image(markers[i - 1].food)
                                        .resizable()
                                        .frame(width: 35, height: 35)
                                    Text(formatTime(time: Int(markers[i-1].start_time)!, delay: 0) + " - " + formatTime(time: Int(markers[i-1].end_time), delay: 4))
                                        .underline()
                                        .foregroundColor(Color.black)
                                    Text(" ")
                                    Image("right-arrow")
                                        .resizable()
                                        .frame(width: 25, height: 25)
                                }
                                HStack {
                                    Text("                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              ")
                                        .font(.system(size:1))
                                }.background(Color.gray)
                            }
                        }.padding(10.0)
                    }
                }
            }
        }
    }
}
