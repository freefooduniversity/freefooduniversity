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
            Button {
                showListView = false
                markerClicked = ""
            } label: {
                Text("Go Back")
            }
            if (markerClicked == "all" && markers.count > 0) {
                Group {
                    ForEach(1...markers.count, id: \.self) { i in
                        Button {
                            showMarkerView = true
                            showListView = false
                            markerClicked = markers[i - 1].food + "|" + markers[i - 1].building
                        } label: {
                            Text("Free \(getFoodDisplayName(food: markers[i - 1].food)) at \(markers[i - 1].building)")
                        }.padding(10.0)
                    }
                }
            } else if (markers.count > 0){
                Group  {
                    ForEach(1...markers.count, id: \.self) { i in
                        if (markers[i - 1].food == markerClicked) {
                            Button {
                                showMarkerView = true
                                showListView = false
                                markerClicked = markers[i - 1].food + "|" + markers[i - 1].building
                            } label: {
                                Text("Free \(getFoodDisplayName(food: markers[i - 1].food)) at \(markers[i - 1].building)")
                            }.padding(10.0)
                        }
                    }
                }
            }
        }
    }
}
