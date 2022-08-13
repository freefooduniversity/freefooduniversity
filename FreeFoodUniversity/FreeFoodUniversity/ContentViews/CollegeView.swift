//
//  CollegeView.swift
//  FreeFoodUniversity
//
//  Created by William Sirotkin on 7/11/22.
//

import Foundation
import SwiftUI
import UIKit

struct CollegeContentView: View {
    @Binding var college: String
    @Binding var addFood: Bool
    @Binding var locationButtonClicked: Bool

    var body: some View {
            VStack {
                Text(getTitle(college: college))
                    .font(.custom("Helvetica Neue", size: 25))
                    .position(x:200, y:10)
                    .foregroundColor(.black)
                HStack {
                    Button(action: {
                        withAnimation {
                            self.addFood = true
                        }
                    }) {
                        VStack {
                            Image("big-burger")
                                .renderingMode(Image.TemplateRenderingMode?
                                .init(Image.TemplateRenderingMode.original))
                                .resizable()
                                .frame( width: 70, height: 70)
                            Text(" Add Food To The Map   ")
                                .font(.custom("Helvetica Neue", size: 12))
                                .foregroundColor(.black)
                        }
                    }.border(Color.black)
                    Text("          ")
                    Button(action: {
                        withAnimation {
                            self.college = "pickCollege"
                            self.locationButtonClicked = false
                        }
                    }) {
                        HStack {
                            Image(getImage(college: college))
                                .renderingMode(Image.TemplateRenderingMode?
                                .init(Image.TemplateRenderingMode.original))
                                .resizable()
                                .frame( width: 100, height: 100)
                            Image("down-arrow")
                        }
                    }
                }.position(x:200, y:10)
                HStack {
                    Button ("⚠️ Allow Notifications\n For Food at " + getName(college: college)) {
                        print("Hello")
                    }.border(Color.black)
                    Button ("⚠️ Set " + getName(college: college) + " as Your Default College") {
                        print("Hello")
                    }.border(Color.black)
                }.position(x:195, y:35)
        }.background(Color.white)
    }
}


func getTitle(college: String) -> String {
    var title = "Free Food at "
    
    if (college == "uga") { title += "UGA" }
    if (college == "clemson") { title += "Clemson" }
    if (college == "gt") { title += "Georgia Tech" }
    if (college == "bama") { title += "Bama" }
    if (college == "florida") { title += "UF" }
    if (college == "gastate") { title += "GA State" }
    if (college == "ksu") { title += "KSU" }
    if (college == "michigan") { title += "Michigan" }
    if (college == "usc") { title += "USC" }
    if (college == "harvard") { title += "Harvard" }
    
    return title
}

func getImage(college: String) -> String {
    if (college == "uga") { return "uga" }
    if (college == "clemson") { return "clemson" }
    if (college == "gt") { return "gt" }
    if (college == "bama") { return "bama" }
    if (college == "florida") { return "florida" }
    if (college == "gastate") { return "gastate" }
    if (college == "ksu") { return "ksu" }
    if (college == "michigan") { return "michigan" }
    if (college == "usc") { return "usc" }
    if (college == "harvard") { return "harvard" }
    
    return ""
}

func getName(college: String) -> String {
    var title = ""
    
    if (college == "uga") { title += "UGA" }
    if (college == "clemson") { title += "Clemson" }
    if (college == "gt") { title += "Georgia Tech" }
    if (college == "bama") { title += "Bama" }
    if (college == "florida") { title += "UF" }
    if (college == "gastate") { return "GA State" }
    if (college == "ksu") { return "KSU" }
    if (college == "michigan") { return "Michigan" }
    if (college == "usc") { return "USC" }
    if (college == "harvard") { title += "Harvard" }
    
    return title
}

