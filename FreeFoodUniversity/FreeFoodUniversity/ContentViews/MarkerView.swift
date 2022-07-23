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
    @Binding var food: String
    @Binding var startTime: String
    @Binding var endTime: String
    @Binding var capacity: Int // limit to number of people who can get food at this event
    @Binding var dibs: Int // number of ppl who are planning to attend this event
    @Binding var building: String
    @Binding var outside: Bool
    @Binding var event: String
    @Binding var additionalInfo: String
    @Binding var image: String
    @Binding var signedIn: Bool
    
    var body: some View {
        if (outside == false) { Text("Free " + getFoodDisplayName(food: food) + " at " + building + "!") }
        else { Text("Free " + getFoodDisplayName(food: food) + " outside " + building + "!" ) }
        
        Text("Event Lasts From : " + startTime + " - " + endTime)
      //  Text("🧑🏻‍💼 Limit" + capacity)
        Text("Event: " + event)
        Text("Additional Info" + additionalInfo)
        
    }
    

}

func getFoodDisplayName(food: String) -> String {
    if (food == "chickfila") {
        return "Chick-Fil-A"
    }
    return food
}
