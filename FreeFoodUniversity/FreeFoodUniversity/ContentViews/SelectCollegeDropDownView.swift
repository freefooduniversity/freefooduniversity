//
//  SelectCollegeDropDownView.swift
//  FreeFoodUniversity
//
//  Created by Stephen Nemeth on 8/11/22.
//

import SwiftUI
import DropDown
import UIKit

struct SelectStateDropDownView : View {
    @State public var selectedState = "Select Your State"
    let states = [
        "Select Your State",
        "AL",
        "AK",
        "AZ",
        "AR",
        "CA",
        "CO",
        "CT",
        "DE",
        "DC",
        "FL",
        "GA",
        "HI",
        "ID",
        "IL",
        "IN",
        "IA",
        "KS",
        "KY",
        "LA",
        "ME",
        "MD",
        "MA",
        "MI",
        "MN",
        "MS",
        "MO",
        "MT",
        "NE",
        "NV",
        "NH",
        "NJ",
        "NM",
        "NY",
        "NC",
        "ND",
        "OH",
        "OK",
        "OR",
        "PA",
        "RI",
        "SC",
        "SD",
        "TN",
        "TX",
        "UT",
        "VT",
        "VA",
        "WA",
        "WI",
        "WY",
    ]
    
    var body : some  View {
        VStack {
            Picker("Select Your State", selection: $selectedState) {
                ForEach(states, id: \.self) {
                    Text($0)
                }
            }
            .onTapGesture {
                
            }
        }
    }
}
