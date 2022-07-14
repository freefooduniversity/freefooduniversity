//
//  FeedbackView.swift
//  FreeFoodUniversity
//
//  Created by William Sirotkin on 7/14/22.
//

import Foundation
import SwiftUI
import UIKit

struct FeedbackView: View {
    @Binding var navButton: String
    
    var body: some View {
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
                }.background(Color.purple).cornerRadius(15)
            Text("We Would Love Your Feedback")
                .font(.custom("Helvetica Neue", size: 25))
                .foregroundColor(.black)
            
                Text("Click the button below to rate us on the App Store.")
            Text("")
                Text("It only takes a minute!")
            HStack {
                Text(" ")
            }
            HStack {
                Text("⭐️⭐️⭐️⭐️⭐️")
            }
            HStack {
                Image("apple")
                Button(action: {
                    
                }) {
                    HStack {
                        Image("blue")
                        Text("Give us feedback       ")
                            .font(.custom("Helvetica Neue", size: 16))
                            .foregroundColor(.white)
                    }
                }.background(Color.blue).cornerRadius(15)
            }
        }
    }
}
