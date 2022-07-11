//
//  StatsView.swift
//  FreeFoodUniversity
//
//  Created by William Sirotkin on 7/10/22.
//

import Foundation
import SwiftUI
import CoreData
import UIKit

struct StatsView: View {
    @Binding var active: Int
    @Binding var fedToday: Int
    @Binding var fedAllTime: Int
    
    var body: some View {
        HStack {
            Text("Food Events:")
                .foregroundColor(.black)
                .font(.custom("Helvetica Neue", size: 14))
            Text(String(active) + "🍔  ")
                .foregroundColor(.blue)
                .font(.custom("Helvetica Neue", size: 14))
            Text("Today:")
                .foregroundColor(.black)
                .font(.custom("Helvetica Neue", size: 14))
            Text(String(fedToday) + "🧑🏻‍💼  ")
                .foregroundColor(.blue)
                .font(.custom("Helvetica Neue", size: 14))
            Text("All Time:")
                .foregroundColor(.black)
                .font(.custom("Helvetica Neue", size: 14))
            Text(String(fedAllTime) + "🧑🏻‍💼  ")
                .foregroundColor(.blue)
                .font(.custom("Helvetica Neue", size: 14))
        }
    }
}
