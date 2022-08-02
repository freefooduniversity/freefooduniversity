//
//  TechStackView.swift
//  FreeFoodUniversity
//
//  Created by William Sirotkin on 8/1/22.
//

import Foundation
import SwiftUI
import UIKit


struct TechStackView: View {
    @Binding var navButton: String
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    navButton = "aboutUs"
                }) {
                    HStack {
                        Text("")
                        Image("back")
                        Text("Go Back      ")
                            .font(.custom("Helvetica Neue", size: 16))
                            .foregroundColor(.white)
                    }
                }.background(Color.purple).cornerRadius(15)
                Text("Tech Stack")
                    .font(.custom("Helvetica Neue", size: 25))
                    .foregroundColor(.black)
            }
            
            HStack{
                Image("swift")
                Image("python")
                Image("flask")
                Image("postgresql")
                Image("azure")
            }
                Text("We created this app using Swift for our front-end")
                Text("UI/UX, Python & Flask for our back-end server,")
                Text("a PostgreSQL Database to hold free food data,")
                Text("and Azure App Service and Flexible Server to")
                Text("continuously deploy our back-end in the cloud.")
            HStack {
                Text(" ")
            }
        }.position(x: 200, y: 115)
    }
}
