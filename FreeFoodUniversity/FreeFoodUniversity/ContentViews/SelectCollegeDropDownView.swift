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
    @Binding var selectedState: String
    let states = [
        "Select Your State",
        "Alabama",
        "Alaska",
        "Arizona",
        "Arkansas",
        "California",
        "Colorado",
        "Conneticut",
        "Delaware",
        "Florida",
        "Georgia",
        "Hawaii",
        "Idaho",
        "Illinois",
        "Indiana",
        "Iowa",
        "Kansas",
        "Kentucky",
        "Lousiana",
        "Maine",
        "Maryland",
        "Massachussetts",
        "Michigan",
        "Minnesota",
        "Mississippi",
        "Missouri",
        "Montana",
        "Nebraska",
        "Nevada",
        "New Hampshire",
        "New Jersey",
        "New Mexico",
        "New York",
        "North Carolina",
        "North Dakota",
        "Ohio",
        "Oklahoma",
        "Oregon",
        "Pennsylvania",
        "Rhode Island",
        "South Carolina",
        "South Dakota",
        "Tennessee",
        "Texas",
        "Utah",
        "Vermont",
        "Virginia",
        "Washington",
        "West Virginia",
        "Winsconsin",
        "Wyoming",
    ]
    
    var body : some  View {
        VStack {
            Picker("Select Your State", selection: $selectedState) {
                ForEach(states, id: \.self) {
                    Text($0)
                }
            }
        }
    }
}
