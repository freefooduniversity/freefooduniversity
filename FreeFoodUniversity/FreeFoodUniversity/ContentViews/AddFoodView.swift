//
//  AddFoodView.swift
//  FreeFoodUniversity
//
//  Created by William Sirotkin on 7/11/22.
//

import Foundation
import SwiftUI
import UIKit

struct addFoodToMapView: View {
    @Binding var college: String
    @Binding var addFood: Bool
    
    var body: some View {
        VStack {
            Text("Add Food To " + college)
            Text(college)
            Text(college)
            Text(college)
            Text(college)
            Text(college)
            Text(college)
            Text(college)
        }
        Button("Back") {
            addFood = false
        }
    }
}
