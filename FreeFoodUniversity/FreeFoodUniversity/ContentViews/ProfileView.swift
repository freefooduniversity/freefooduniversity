//
//  ProfileView.swift
//  FreeFoodUniversity
//
//  Created by William Sirotkin on 7/13/22.
//

import Foundation
import SwiftUI
import UIKit

var title = ""
var College = ""
var MARKERS: [Marker] = []

struct ProfileView: View {
    @Binding var navButton: String
    var userData: [User]
    @Binding var markerClicked: String
    @Binding var showMarkerView: Bool
    @Binding var college: String
    
    func getMarkerClickedData() {
        getMarkerById(completion: { (marks) in
            MARKERS = marks
        }, id: userData[0].active_marker_id)
    }
    
    var body: some View {
        var likes = Double(userData[0].likes)
        var dislikes = Double(userData[0].dislikes)
        VStack {
                Button(action: {
                    navButton = ""
                }) {
                    HStack {
                        Text("")
                        Image("back")
                        Text("Go Back      ")
                            .font(.custom("Helvetica Neue", size: 16))
                            .foregroundColor(.white)
                    }
                }.background(Color.purple).cornerRadius(15).position(x: 80, y:20)
            Text("Your Profile")
                .underline()
                .font(.custom("Helvetica Neue", size: 25))
                .foregroundColor(.black)
            Text(" ")
            HStack {
                Text("# People You've Fed: " + String(userData[0].num_ppl_fed) + "🧑🏻‍💼")
            }
            Text(" ")
            HStack {
                
                Text("Overall Rating of Your Food:")
                if (likes > dislikes) {
                    var likesPercent = round((likes / (likes + dislikes)) * 100)
                    Text(String(likesPercent) + "% Positive")
                        .font(.custom("Helvetica Neue", size: 18))
                        .foregroundColor(.green)
                } else if (likes < dislikes) {
                        var dislikesPercent = round((dislikes / (likes + dislikes)) * 100)
                        Text(String(dislikesPercent) + "% Negative")
                            .font(.custom("Helvetica Neue", size: 18))
                            .foregroundColor(.red)
                } else  {
                    Text("Neutral")
                        .font(.custom("Helvetica Neue", size: 18))
                        .foregroundColor(.red)
                }
                 
            }
            
            if (userData[0].active_marker_id != 0) {
                    var d = getMarkerClickedData()
                    Button(action: {
                        if (MARKERS[0].food != "") {
                            title = MARKERS[0].food + "|" + MARKERS[0].building
                            College = MARKERS[0].college
                            navButton = ""
                            showMarkerView = true
                            markerClicked = title
                            college = College
                        }
                    }) {
                    HStack {
                        Image("blue")
                        Text(" Find My Marker      ")
                            .font(.custom("Helvetica Neue", size: 16))
                            .foregroundColor(.white)
                    }
                    }.background(Color.blue).cornerRadius(15)
            }
        }.position(x:200, y:110)
    }
}
