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
              /*
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
               */
              HStack {
                  Button(action: {
                      navButton = ""
                  }) {
                          Text("Go Back       ")
                  }
                  Text("   ")
                  Button(action: {
                      let url = URL(string: "https://github.com/freefooduniversity/freefooduniversity")!
                      if UIApplication.shared.canOpenURL(url) {
                          UIApplication.shared.open(url, options: [:], completionHandler: nil)
                          //If you want handle the completion block than
                          UIApplication.shared.open(url, options: [:], completionHandler: { (success) in
                               print("Open url : \(success)")
                          })
                      }
                  }) {
                      HStack {
                          Text("Github Repo     ")
  
                      }
                  }
                  Text("   ")
                  Button(action: {
                      navButton = "tech-stack"
                  }) {
                      Text("Tech Stack    ")
                  }
              }.position(x:190, y:7)
              
              HStack {
                  Image("us").cornerRadius(20.0)
              }.position(x:190, y:30)
              
              
              HStack {
                  Button(action: {
                      let url = URL(string: "https://linkedin.com/in/raymondfeckoury")!
                      if UIApplication.shared.canOpenURL(url) {
                          UIApplication.shared.open(url, options: [:], completionHandler: nil)
                          //If you want handle the completion block than
                          UIApplication.shared.open(url, options: [:], completionHandler: { (success) in
                               print("Open url : \(success)")
                          })
                      }
                  }) {
                      HStack {
                          Text("  Raymond Feckoury")
                              .font(.custom("Helvetica Neue", size: 10))
                              .foregroundColor(.black)
                          Image("linkedin")
                      }
                  }.background(Color.mint).cornerRadius(7.5)
                  
                  Button(action: {
                      let url = URL(string: "https://linkedin.com/in/stephen-nemeth-b9a661161")!
                      if UIApplication.shared.canOpenURL(url) {
                          UIApplication.shared.open(url, options: [:], completionHandler: nil)
                          //If you want handle the completion block than
                          UIApplication.shared.open(url, options: [:], completionHandler: { (success) in
                               print("Open url : \(success)")
                          })
                      }                  }) {
                      HStack {
                          Text("  Stephen Nemeth")
                              .font(.custom("Helvetica Neue", size: 10))
                              .foregroundColor(.black)
                          Image("linkedin")
                      }
                  }.background(Color.mint).cornerRadius(7.5)
                  
                  Button(action: {
                      let url = URL(string: "https://linkedin.com/in/williamsirotkin")!
                      if UIApplication.shared.canOpenURL(url) {
                          UIApplication.shared.open(url, options: [:], completionHandler: nil)
                          //If you want handle the completion block than
                          UIApplication.shared.open(url, options: [:], completionHandler: { (success) in
                               print("Open url : \(success)")
                          })
                      }
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
