//
//  ProfileView.swift
//  FreeFoodUniversity
//
//  Created by William Sirotkin on 7/13/22.
//

import Foundation
import SwiftUI
import UIKit

struct ProfileView: View {
    @Binding var navButton: String
    
    var body: some View {
        VStack {
            HStack {
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
                }.background(Color.purple).cornerRadius(15)
            Text("Your Profile")
                .font(.custom("Helvetica Neue", size: 25))
                .foregroundColor(.black)
            }
            HStack {
                Text("Current Favorite Free Food:")
                Image("ice-cream")
            }
            HStack {
                Text("# People You've Fed: 45🧑🏻‍💼")
            }
            Text(" ")
            HStack {
                Text("Overall Rating of Your Food:")
                Text("86% Positive")
                    .font(.custom("Helvetica Neue", size: 18))
                    .foregroundColor(.green)
            }
        }.position(x:200, y:90)
    }
}
