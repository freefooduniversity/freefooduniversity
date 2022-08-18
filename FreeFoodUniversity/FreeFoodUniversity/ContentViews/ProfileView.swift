//
//  ProfileView.swift
//  FreeFoodUniversity
//
//  Created by William Sirotkin on 7/13/22.
//

import Foundation
import SwiftUI
import UIKit
import FirebaseAuthUI
import FirebaseGoogleAuthUI
import FirebaseCore
import FirebaseOAuthUI

struct ProfileView: View {
    
    @ObservedObject var signInManager = AppDelegate()
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
            HStack {
                Text("Your College: UGA")
            }
            HStack {
                Text("Overall Rating of Your Food:")
                Text("86% Positive")
                    .font(.custom("Helvetica Neue", size: 18))
                    .foregroundColor(.green)
            }
            HStack {
                Image("google")
                Button(action: {
                    signInManager.getGoogle()
                }) {
                    HStack {
                        Image("blue")
                        Text("Sign in with Google       ")
                            .font(.custom("Helvetica Neue", size: 16))
                            .foregroundColor(.white)
                    }
                }.background(Color.blue).cornerRadius(15)
                
            }
        }.position(x:200, y:120)
    }
}
