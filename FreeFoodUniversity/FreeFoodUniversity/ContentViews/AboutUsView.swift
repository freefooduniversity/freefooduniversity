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
    @Binding var navButton: String
    
    var body: some View {
          VStack {
              
              HStack {
                  Button(action: {
                      navButton = ""
                  }) {
                
                         Image("back")
                          Text("Go Back       ")
                              .font(.custom("Helvetica Neue", size: 10))
                              .foregroundColor(.black)
                      
                  }.background(Color.purple).cornerRadius(5)
                  Text("   ")
                  Button(action: {
                      
                  }) {
                      HStack {
                          Image("github")
                          Text("Github Repo     ")
                              .font(.custom("Helvetica Neue", size: 10))
                              .foregroundColor(.black)
                      }
                  }.background(Color.purple).cornerRadius(5)
                  Text("   ")
                  Button(action: {
                      
                  }) {

                      Image("computer")
                      Text("Tech Stack    ")
                          .font(.custom("Helvetica Neue", size: 10))
                          .foregroundColor(.black)
                  }.background(Color.purple).cornerRadius(5)
              }.position(x:190, y:7)
               
              HStack {
                  Image("us").cornerRadius(20.0)
              }.position(x:190, y:30)
              
              
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
              }.position(x: 190, y: 50)
              
              
            Text("We're students at the University Of Georgia and created this app")
                  .font(.custom("Helvetica Neue", size: 12))
            Text("to provide college students an easy way to find free food on their")
                  .font(.custom("Helvetica Neue", size: 12))
            Text("campuses, as well as support sustainability by reducing food waste")
                  .font(.custom("Helvetica Neue", size: 12))
          }.position(x: 200, y: 115)
    }
}
