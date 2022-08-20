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
            Text("Events:")
                .foregroundColor(.black)
                .font(.custom("Helvetica Neue", size: 13))
            Text(String(active) + "🍔  ")
                .foregroundColor(.blue)
                .font(.custom("Helvetica Neue", size: 13))
            Text("People Fed:")
                .foregroundColor(.black)
                .font(.custom("Helvetica Neue", size: 13))
            Text(String(fedToday) + "🧑🏻‍💼  ")
                .foregroundColor(.blue)
                .font(.custom("Helvetica Neue", size: 13))
            Text("Users:")
                .foregroundColor(.black)
                .font(.custom("Helvetica Neue", size: 13))
            Text(String(fedAllTime) + "🧑🏻‍💼  ")
                .foregroundColor(.blue)
                .font(.custom("Helvetica Neue", size: 13))
        }
    }
}



