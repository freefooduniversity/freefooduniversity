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
    var userData: [User]
    
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
                }.background(Color.purple).cornerRadius(15)
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
        }.position(x:200, y:90)
    }
}
