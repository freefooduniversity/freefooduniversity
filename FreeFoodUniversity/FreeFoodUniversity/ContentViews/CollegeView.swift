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
    
    @State var Markers : [Marker] = []
    @State var selectionOne : String = "Select an Event"
    @State var selectionTwo : String = "Select an Event"
    @State var selectionThree : String = "Select an Event"
    @State var selectionFour : String = "Select an Event"
    @State var selectionFive : String = "Select an Event"
    
    let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    
    var body: some View {
        
                
        var foods = getFoodSortedByExistence(college: college)
        var markers = getAllMarkersForCollege(completion: {(marks) in Markers = marks}, college: college)
                
        let selectionOneOptions = setSelectionOne(foods: foods, markers: Markers)
        let selectionTwoOptions = setSelectionTwo(foods: foods, markers: Markers)
        let selectionThreeOptions = setSelectionThree(foods: foods, markers: Markers)
        let selectionFourOptions = setSelectionFour(foods: foods, markers: Markers)
        let selectionFiveOptions = setSelectionFive(foods: foods, markers: Markers)
        
        var picker1 = Picker("Food1", selection : $selectionOne) {
            ForEach(selectionOneOptions, id :\.self) {
                Text($0)
            }
        }
        
        VStack {
            picker1
            ZStack {
                ScrollView {
                    VStack {
                        Text("⌃")
                        Button(action: {
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
                }.frame(width: 40, height: 250)
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

func setSelectionOne(foods : [(String, Int)], markers : [Marker]) -> [String] {
    
    var selectionOneOptions : [String] = []
    let foodType = foods[0].0
    for i in markers {
        if i.food == foodType{
            selectionOneOptions.append("Free \(i.food) at \(i.building)")
        }
    }
    
    return selectionOneOptions
}

func setSelectionTwo(foods : [(String, Int)], markers : [Marker]) -> [String] {
    
    var selectionTwoOptions : [String] = []
    let foodType = foods[1].0
    for i in markers {
        if i.food == foodType{
            selectionTwoOptions.append("Free \(i.food) at \(i.building)")
        }
    }
    
    return selectionTwoOptions
}

func setSelectionThree(foods : [(String, Int)], markers : [Marker]) -> [String] {
    
    var selectionThreeOptions : [String] = []
    let foodType = foods[2].0
    for i in markers {
        if i.food == foodType{
            selectionThreeOptions.append("Free \(i.food) at \(i.building)")
        }
    }
    
    return selectionThreeOptions
}

func setSelectionFour(foods : [(String, Int)], markers : [Marker]) -> [String] {
    
    var selectionFourOptions : [String] = []
    let foodType = foods[3].0
    for i in markers {
        if i.food == foodType{
            selectionFourOptions.append("Free \(i.food) at \(i.building)")
        }
    }
    
    return selectionFourOptions
}

func setSelectionFive(foods : [(String, Int)], markers : [Marker]) -> [String] {
    
    var selectionFiveOptions : [String] = []
    let foodType = foods[4].0
    for i in markers {
        if i.food == foodType{
            selectionFiveOptions.append("Free \(i.food) at \(i.building)")
        }
    }
    
    return selectionFiveOptions
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
    if (college == "alaskaanchorage") { title += "Alaska Anchorage" }
    if (college == "alaskasoutheast") { title += "Alaska Southeast" }
    if (college == "arkansas") { title += "University of Arkansas" }
    if (college == "arkansasstate") { title += "Arkansas State" }
    if (college == "arkansastech") { title += "Arkansas Tech" }
    if (college == "centralarkansas") { title += "Central Arkansas" }
    if (college == "southerncalifornia") { title += "Southern California" }
    if (college == "ucla") { title += "UCLA" }
    if (college == "berkeley") { title += "UC Berkeley" }
    if (college == "fullerton") { title += "Cal State Fullerton" }
    if (college == "northridge") { title += "Cal State Northridge" }
    if (college == "longbeach") { title += "Cal State Long Beach" }
    if (college == "sandiego") { title += "UC San Diego" }
    if (college == "davis") { title += "UC Davis" }
    if (college == "irvine") { title += "UC Irvine" }
    
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
    if (college == "alaskaanchorage") { return "alaskaanchorage" }
    if (college == "alaskafairbanks") { return "alaskafairbanks" }
    if (college == "alaskasoutheast") { return "alaskasoutheast" }
    if (college == "arkansas") { return "arkansas" }
    if (college == "arkansasstate") { return "arkansasstate" }
    if (college == "arkansastech") { return "arkansastech" }
    if (college == "centralarkansas") { return "centralarkansas" }
    if (college == "southerncalifornia") { return "southerncalifornia" }
    if (college == "ucla") { return "ucla" }
    if (college == "berkeley") { return "berkeley" }
    if (college == "fullerton") { return "fullerton" }
    if (college == "northridge") { return "northridge" }
    if (college == "longbeach") { return "longbeach" }
    if (college == "sandiego") { return "sandiego" }
    if (college == "davis") { return "davis" }
    if (college == "irvine") { return "irvine" }
    
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


