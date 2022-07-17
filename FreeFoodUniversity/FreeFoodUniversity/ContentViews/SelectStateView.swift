//
//  SelectStateView.swift
//  FreeFoodUniversity
//
//  Created by William Sirotkin on 7/14/22.
//

import Foundation
import SwiftUI
import UIKit

struct SelectStateView: View {
    @Binding var buttonClick: String
    @Binding var locationButtonClicked: Bool
    
    @ObservedObject var locationManager = LocationManager()
    
    var collegeLocations = CollegeLocations()
    
    var body: some View {
        VStack {
            Button("back") {
                 buttonClick = "pickCollege"
            }
        }.position(x:195, y:120)
    }
}
