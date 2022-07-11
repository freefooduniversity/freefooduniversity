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
    @Binding var navButtonClicked: Bool
    @Binding var profileButtonClicked: Bool
    @Binding var aboutUsButtonClicked: Bool
    @Binding var feedbackButtonClicked: Bool
    @Binding var settingsButtonClicked: Bool
    
    var body: some View {
        HStack {
            Text("                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              ")
                .font(.system(size:1))
        }.background(Color.gray)
        HStack (spacing: 30) {
            Button(action: {
                withAnimation {
                    self.profileButtonClicked = true
                    self.navButtonClicked = true
                    self.aboutUsButtonClicked = false
                }
            }) {
                VStack {
                    Image("user")
                        .renderingMode(Image.TemplateRenderingMode?
                        .init(Image.TemplateRenderingMode.original))
                    Text("Profile\n")
                }
            }
            Button(action: {
                withAnimation {
                    self.navButtonClicked = true
                    self.aboutUsButtonClicked = true
                }
            }) {
                VStack {
                    Image("team")
                        .renderingMode(Image.TemplateRenderingMode?
                        .init(Image.TemplateRenderingMode.original))
                    Text("About Us\n")
                }
            }
            Button(action: {
                withAnimation {
                    self.feedbackButtonClicked = true
                    self.navButtonClicked = true
                    self.aboutUsButtonClicked = false
                }
            }) {
                VStack {
                    Image("feedback")
                        .renderingMode(Image.TemplateRenderingMode?
                        .init(Image.TemplateRenderingMode.original))
                    Text("Feedback\n")
                }
            }
            Button(action: {
                withAnimation {
                    self.settingsButtonClicked = true
                    self.navButtonClicked = true
                }
            }) {
                VStack {
                    Image("settings")
                        .renderingMode(Image.TemplateRenderingMode?
                        .init(Image.TemplateRenderingMode.original))
                    Text("Settings\n")
                }
            }
        }
    }
}
