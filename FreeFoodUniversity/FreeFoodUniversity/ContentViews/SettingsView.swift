//
//  SettingsView.swift
//  FreeFoodUniversity
//
//  Created by William Sirotkin on 7/14/22.
//

import Foundation
import SwiftUI
import UIKit

struct SettingsView: View {
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
            Text("Settings")
                .font(.custom("Helvetica Neue", size: 25))
                .foregroundColor(.black)
            
                Text(" ")
            Text("")
                Text("")
            HStack {
                Text(" ")
            }
            HStack {
                Text("")
            }
            HStack {
                Image("")
                Button(action: {
                    
                }) {
                    HStack {
                        Image("blue")
                        Text("       ")
                            .font(.custom("Helvetica Neue", size: 16))
                            .foregroundColor(.white)
                    }
                }.background(Color.blue).cornerRadius(15)
            }
        }
    }
}
