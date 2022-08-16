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
    @Binding var markerClicked: String
    @Binding var reload: Int

    let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    
    var body: some View {
        /*
        var d = DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            print(reload)
            reload += 1
        }
         */

        var foods = getFoodSortedByExistence(college: college)
        VStack {
            ZStack {
                VStack {
                    Text("⌃")
                        Button(action: {
                            withAnimation {
                                if (foods[0].1 != 0) {
                                    markerClicked = foods[0].0
                                }
                            }
                        }) {
                            Image(foods[0].0)
                            .resizable()
                            .frame(width: 40, height: 40)
                        }
                    Button(action: {
                        withAnimation {
                            if (foods[1].1 != 0) {
                                markerClicked = foods[1].0
                            }
                        }
                    }) {
                        Image(foods[1].0)
                        .resizable()
                        .frame(width: 40, height: 40)
                    }
                    Button(action: {
                        withAnimation {
                            if (foods[2].1 != 0) {
                                markerClicked = foods[2].0
                            }
                        }
                    }) {
                        Image(foods[2].0)
                        .resizable()
                        .frame(width: 40, height: 40)
                    }
                    Button(action: {
                        withAnimation {
                            if (foods[3].1 != 0) {
                                markerClicked = foods[3].0
                            }
                        }
                    }) {
                        Image(foods[3].0)
                        .resizable()
                        .frame(width: 40, height: 40)
                    }
                    Button(action: {
                        withAnimation {
                            if (foods[4].1 != 0) {
                                markerClicked = foods[4].0
                            }
                        }
                    }) {
                        Image(foods[4].0)
                        .resizable()
                        .frame(width: 40, height: 40)
                    }
                    Text("⌄")
                }.background(Color.gray).cornerRadius(15).opacity(0.9)
            }.position(x: 360, y: -300)
         
            VStack {
                Text(getTitle(college: college))
                    .font(.custom("Helvetica Neue", size: 25))
                    .foregroundColor(.black)
                    .position(x: 195, y: -95)
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
                            self.reload += 1
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
                }.position(x:195, y: -60)
                HStack {
                    Button("⚠️ Allow Notifications\n For Food at " + getName(college: college)) {
                        print("Hello")
                    }.border(Color.black)
                    Button ("⚠️ Set " + getName(college: college) + " as Your Default College") {
                        print("Hello")
                    }.border(Color.black)
                }.position(x: 195, y: -20)
            }
        }.position(x:195, y:100).onReceive(timer, perform: { _ in
            print("updating")
        })
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
    if (college == "auburn") { title += "Auburn" }
    if (college == "alabamastate") { title += "Alabama State" }
    if (college == "alabamaa&m") { title += "Alabama A&M" }
    if (college == "uabbirmingham") { title += "Alabama at Birmingham" }
    if (college == "arizonatucson") { title += "Arizona at Tucson" }
    if (college == "arizonastate") { title += "Arizona State" }
    if (college == "northernarizona") { title += "Northern Arizona" }
    
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
    if (college == "auburn") { return "auburn" }
    if (college == "alabamastate") { return "alabamastate" }
    if (college == "alabamaa&m") { return "alabamaa&m" }
    if (college == "uabbirmingham") { return "uabbirmingham" }
    if (college == "arizonastate") { return "arizonastate" }
    if (college == "northernarizona") { return "northernarizona" }
    
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


