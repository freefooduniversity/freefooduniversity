//
//  BottomButtonsView.swift
//  FreeFoodUniversity
//
//  Created by William Sirotkin on 7/10/22.
//

import Foundation
import SwiftUI
import CoreData
import UIKit

struct NavButtonsView: View {
    @Binding var navButton: String

    
    var body: some View {
        HStack {
            Text("                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              ")
                .font(.system(size:1))
        }.background(Color.gray)
        HStack (spacing: 30) {
            Button(action: {
                withAnimation {
                    self.navButton = "profile"
                }
            }) {
                VStack {
                    Image("profile")
                        .renderingMode(Image.TemplateRenderingMode?
                        .init(Image.TemplateRenderingMode.original))
                        .resizable()
                        .frame(width: 50, height: 50)
                    Text("Profile\n")
                }
            }
            Button(action: {
                withAnimation {
                    self.navButton = "aboutUs"
                }
            }) {
                VStack {
                    Image("team")
                        .renderingMode(Image.TemplateRenderingMode?
                        .init(Image.TemplateRenderingMode.original))
                        .resizable()
                        .frame(width: 50, height: 50)
                    Text("About Us\n")
                }
            }
            Button(action: {
                withAnimation {
                    self.navButton = "feedback"
                }
            }) {
                VStack {
                    Image("feedback")
                        .renderingMode(Image.TemplateRenderingMode?
                        .init(Image.TemplateRenderingMode.original))
                        .resizable()
                        .frame(width: 50, height: 50)
                    Text("Feedback\n")
                }
            }

            Button(action: {
                withAnimation {
                    //  var vc = ViewController()
                  //  vc.share()
                }
            }) {
                VStack {
                    Image("share")
                        .renderingMode(Image.TemplateRenderingMode?
                        .init(Image.TemplateRenderingMode.original))
                        .resizable()
                        .frame(width: 50, height: 50)
                        Text("Share \n")
                }
            }
        }
    }
}
