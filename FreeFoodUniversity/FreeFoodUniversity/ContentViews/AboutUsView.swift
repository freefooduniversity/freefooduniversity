//
//  AboutUsContentView.swift
//  FreeFoodUniversity
//
//  Created by William Sirotkin on 7/10/22.
//

import Foundation
import SwiftUI
import UIKit


struct AboutUsView: View {
    var body: some View {
          VStack {
              HStack {
                  Button(action: {
                      
                  }) {
                      HStack {
                          Text("  Raymond Feckoury")
                              .font(.custom("Helvetica Neue", size: 10))
                              .foregroundColor(.black)
                          Image("linkedin")
                      }
                  }.background(Color.mint).cornerRadius(7.5)
                  
                  Button(action: {
                      
                  }) {
                      HStack {
                          Text("  Stephen Nemeth")
                              .font(.custom("Helvetica Neue", size: 10))
                              .foregroundColor(.black)
                          Image("linkedin")
                      }
                  }.background(Color.mint).cornerRadius(7.5)
                  
                  Button(action: {
                      
                  }) {
                      HStack {
                          Text("  William Sirotkin")
                              .font(.custom("Helvetica Neue", size: 10))
                              .foregroundColor(.black)
                          Image("linkedin")
                      }
                  }.background(Color.mint).cornerRadius(7.5)
              }
              
            Image("us").cornerRadius(20.0)
            Text("We're students at the University Of Georgia and created this app")
                  .font(.custom("Helvetica Neue", size: 12))
            Text("because we want to provide college students a quick, simple, and")
                  .font(.custom("Helvetica Neue", size: 12))
            Text("seamless way to find free food on their campuses as well as ")
                  .font(.custom("Helvetica Neue", size: 12))
            Text("support nationwide sustainability by reducing food waste")
                    .font(.custom("Helvetica Neue", size: 12))
        
        HStack {
            Button(action: {
                
            }) {
                HStack {
                    Image("back")
                    Text("Go Back       ")
                        .font(.custom("Helvetica Neue", size: 10))
                        .foregroundColor(.black)
                }
            }.background(Color.gray).cornerRadius(5)
            Text("   ")
            Button(action: {
                
            }) {
                HStack {
                    Image("github")
                    Text("Github Repo     ")
                        .font(.custom("Helvetica Neue", size: 10))
                        .foregroundColor(.black)
                }
            }.background(Color.gray).cornerRadius(5)
            Text("   ")
            Button(action: {
                
            }) {
                Image("computer")
                Text("Tech Stack    ")
                    .font(.custom("Helvetica Neue", size: 10))
                    .foregroundColor(.black)
            }.background(Color.gray).cornerRadius(5)
        }
        
        
       }
    }
}
