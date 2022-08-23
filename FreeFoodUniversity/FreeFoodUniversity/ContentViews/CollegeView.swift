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
    @Binding var showListView : Bool
    
    @State var Markers : [Marker] = []
    
    let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    
    var body: some View {
        
                
        let foods = getFoodSortedByExistence(college: college)
        //var markers = getAllMarkersForCollege(completion: {(marks) in Markers = marks}, college: college)
        
        VStack {
            ZStack {
                ScrollView {
                    VStack {
                        Text("⌃")
                        Group {
                            Button(action: {
                                if (foods[0].1 != 0) {
                                    markerClicked = foods[0].0
                                    showListView = true
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
                                        showListView = true
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
                                        showListView = true
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
                                        showListView = true
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
                                        showListView = true
                                    }
                                }
                            }) {
                                Image(foods[4].0)
                                .resizable()
                                .frame(width: 40, height: 40)
                            }
                            Button(action: {
                                if (foods[5].1 != 0) {
                                    markerClicked = foods[5].0
                                    showListView = true
                                }
                                }) {
                                    Image(foods[5].0)
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                }
                            Button(action: {
                                withAnimation {
                                    if (foods[6].1 != 0) {
                                        markerClicked = foods[6].0
                                        showListView = true
                                    }
                                }
                            }) {
                                Image(foods[6].0)
                                .resizable()
                                .frame(width: 40, height: 40)
                            }
                            VStack {
                                Button(action: {
                                    withAnimation {
                                        if (foods[7].1 != 0) {
                                            markerClicked = foods[7].0
                                            showListView = true
                                        }
                                    }
                                }) {
                                    Image(foods[7].0)
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                }
                                Button(action: {
                                    withAnimation {
                                        if (foods[8].1 != 0) {
                                            markerClicked = foods[8].0
                                            showListView = true
                                        }
                                    }
                                }) {
                                    Image(foods[8].0)
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                }
                                Button(action: {
                                    withAnimation {
                                        if (foods[9].1 != 0) {
                                            markerClicked = foods[9].0
                                            showListView = true
                                        }
                                    }
                                }) {
                                    Image(foods[9].0)
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                }
                                Button(action: {
                                    withAnimation {
                                        if (foods[10].1 != 0) {
                                            markerClicked = foods[10].0
                                            showListView = true
                                        }
                                    }
                                }) {
                                    Image(foods[10].0)
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                }
                            }
                        }
                    }.background(Color.gray).cornerRadius(15).opacity(0.9)
                }.frame(width: 40, height: 350)
            }.position(x: 360, y: -280)
         
            VStack {
                Text(getTitle(college: college))
                    .font(.custom("Helvetica Neue", size: 25))
                    .foregroundColor(.black)
                    .position(x: 195, y: -87)
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
                            Image(college)
                                .renderingMode(Image.TemplateRenderingMode?
                                .init(Image.TemplateRenderingMode.original))
                                .resizable()
                                .frame( width: 100, height: 100)
                            Image("down-arrow")
                        }
                    }
                }.position(x:195, y: -40)
                Button  {
                    showListView = true
                    markerClicked = "all"
                } label: {
                    VStack{
                        Text("                                                                                                                                                  ")
                            .font(.custom("Helvetica Neue", size: 8))
                        HStack {
                                Text("Click Here To Show All Free Food")
                           // Text("Show All Free Food at " + (getName(college: college)))
                                .bold()
                                .foregroundColor(Color.white)

                    }
                        Text("                                                                        ")
                            .font(.custom("Helvetica Neue", size: 8))
                            .foregroundColor(Color.white)
                    }.background(Color.blue).cornerRadius(15)
                }
                /*HStack {
                    Button("⚠️ Allow Notifications\n For Food at " + getName(college: college)) {
                        print("Hello")
                    }.border(Color.black)
                    Button ("⚠️ Set " + getName(college: college) + " as Your Default College") {
                        print("Hello")
                    }.border(Color.black)
                }.position(x: 195, y: -20)*/
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
    if (college == "boulder") { title += "UC Boulder" }
    if (college == "coloradostate") { title += "Colorado State" }
    if (college == "coloradotech") { title += "Colorado Tech" }
    if (college == "denver") { title += "UC Denver" }
    if (college == "msudenver") { title += "MSU Denver" }
    if (college == "conneticut") { title += "University of Conneticut" }
    if (college == "post") { title += "Post University" }
    if (college == "yale") { title += "Yale University" }
    if (college == "central") { title += "Central Conneticut State" }
    if (college == "quinnipac") { title += "Quinnipiac University" }
    if (college == "delaware") { title += "University of Delaware" }
    if (college == "wilmington") { title += "Wilmington" }
    if (college == "delawaretech") { title += "Delaware Tech" }
    if (college == "centralflorida") { title += "Central Florida" }
    if (college == "fiu") { title += "Florida International" }
    if (college == "southflorida") { title += "South Florida" }
    if (college == "miamidade") { title += "Miami Dade" }
    if (college == "valencia") { title += "Valencia College" }
    if (college == "fsu") { title += "Florida State" }
    if (college == "broward") { title += "Broward College" }
    if (college == "fau") { title += "Florida Atlantic" }
    if (college == "palmbeach") { title += "Palm Beach State" }
    if (college == "gasouthern") { title += "Georgia Southern" }
    if (college == "emory") { title += "Emory University" }
    if (college == "uwg") { title += "West Georgia" }
    if (college == "hawaii") { title += "Hawaii at Manoa" }
    if (college == "byu") { title += "BYU" }
    if (college == "boise") { title += "Boise State" }
    if (college == "idahostate") { title += "Idaho State" }
    if (college == "idaho") { title += "University of Idaho" }
    if (college == "urbana") { title += "University of Illinois" }
    if (college == "uic") { title += "University of Illinois" }
    if (college == "devry") { title += "DeVry University" }
    if (college == "northwestern") { title += "Northwestern" }
    if (college == "ivytech") { title += "Ivy Tech" }
    if (college == "purdue") { title += "Purdue" }
    if (college == "notredame") { title += "Notre Dame" }
    if (college == "iowastate") { title += "Iowa State" }
    if (college == "iowa") { title += "University of Iowa" }
    if (college == "kansas") { title += "University of Iowa" }
    if (college == "iowa") { title += "University of Iowa" }
    if (college == "kansas") { title += "University of Kansas" }
    if (college == "kansasstate") { title += "Kansas State" }
    if (college == "wichita") { title += "Wichita State" }
    if (college == "kentucky") { title += "University of Kentucky"}
    if (college == "louisville") { title += "Louisville"}
    if (college == "lsu") { title += "LSU"}
    if (college == "lafayette") { title += "Lafayette"}
    if (college == "tulane") { title += "Tulane"}
    if (college == "maine") { title += "University of Maine"}
    if (college == "maryland") { title += "University Of Maryland"}
    if (college == "johnshopkins") { title += "Johns Hopkins"}
    if (college == "towson") { title += "Towson"}
    if (college == "umass") { title += "UMass"}
    if (college == "michstate") { title += "Michigan State"}
    if (college == "wsu") { title += "WSU"}
    if (college == "minnesota") { title += "University of Minnesota"}
    if (college == "walden") { title += "Walden University"}
    if (college == "olemiss") { title += "Ole Miss"}
    if (college == "missstate") { title += "Mississippi State"}
    if (college == "mizzou") { title += "Mizzou"}
    if (college == "missouristate") { title += "Missouri State"}
    if (college == "montanastate") { title += "Montana State"}
    if (college == "nebraskalincoln") { title += "U of Nebraska" }
    if (college == "nebraskaomaha") { title += "U of Nebraska" }
    if (college == "nebraskacc") { title += "Metropolitan CC" }
    if (college == "bellevue") { title += "Bellevue University" }
    if (college == "vegas") { title += "U of Nevada" }
    if (college == "southernnevada") { title += "Southern Nevada" }
    if (college == "nevadareno") { title += "U of Nevada" }
    if (college == "newhampshire") { title += "New Hampshire" }
    if (college == "snhu") { title += "Southern NH" }
    if (college == "dartmouth") { title += "Dartmouth" }
    if (college == "newbrunswick") { title += "Rutgers" }
    if (college == "montclair") { title += "Montclair State" }
    if (college == "rowan") { title += "Rowan University" }
    if (college == "kean") { title += "Kean University" }
    if (college == "newark") { title += "Rutgers" }
    if (college == "njit") { title += "NJIT" }
    if (college == "newmexico") { title += "U of New Mexico" }
    if (college == "cnmcc") { title += "Central New Mexico" }
    if (college == "nmstate") { title += "New Mexico State" }
    if (college == "nyu") { title += "NYU" }
    if (college == "buffalo") { title += "Buffalo" }
    if (college == "columbia") { title += "Columbia NY" }
    if (college == "stonybrook") { title += "Stony Brook" }
    if (college == "cunyhunter") { title += "CUNY Hunter" }
    if (college == "cornell") { title += "Cornell" }
    if (college == "suffolk") { title += "Suffolk" }
    if (college == "cunyborough") { title += "CUNY Boroush" }
    if (college == "syracuse") { title += "Syracuse" }
    if (college == "stjohns") { title += "St. Johns" }
    if (college == "ncstate") { title += "NC State" }
    if (college == "nccharlotte") { title += "UNC Charlotte" }
    if (college == "chapelhill") { title += "UNC Chapel Hill" }
    if (college == "eastcarolina") { title += "East Carolina" }
    if (college == "waketech") { title += "Wake Tech" }
    if (college == "appalachian") { title += "Appalachian State" }
    if (college == "greensboro") { title += "UNC Greensboro" }
    if (college == "wilmington") { title += "UNC Wilmington" }
    if (college == "centralpiedmont") { title += "Central Piedmont" }
    if (college == "duke") { title += "Duke" }
    if (college == "northdakota") { title += "North Dakota" }
    if (college == "ndsu") { title += "North Dakota State" }
    if (college == "oregonstate") { title += "Oregon State" }
    if (college == "portland") { title += "portland" }
    if (college == "portlandcc") { title += "Portland CC" }
    if (college == "oregon") { title += "Oregon" }
    if (college == "oaklahoma") { title += "U of Oaklahoma" }
    if (college == "osu") { title += "Oaklahoma State" }
    if (college == "pennstate") { title += "Penn State" }
    if (college == "temple") { title += "Temple University" }
    if (college == "pitt") { title += "Pittsburgh" }
    if (college == "upenn") { title += "Penn" }
    if (college == "drexel") { title += "Drexel" }
    if (college == "ohiostate") { title += "Ohio State" }
    if (college == "cincinnati") { title += "Cincinnati" }
    if (college == "kentstate") { title += "Kent State" }
    if (college == "ohiou") { title += "Ohio University" }
    if (college == "tennessee") { title += "University of Tennessee" }
    if (college == "memphis") { title += "University of Memphisy" }
    if (college == "middlestate") { title += "Middle Tennessee State" }
    if (college == "eaststate") { title += "East Tennessee State" }
    if (college == "vandy") { title += "Vandy" }
    if (college == "washington") { title += "Washington University" }
    if (college == "washingtonstate") { title += "Washington State" }
    if (college == "westvirginia") { title += "WV University" }
    if (college == "marshall") { title += "Marshall University" }
    if (college == "winsconsinmadison") { title += "UW Madison" }
    if (college == "winsconsinmilkwaukee") { title += "UW Milkwaukee" }
    if (college == "winsconsinoshkosh") { title += "UW Oshkosh" }
    if (college == "wyoming") { title += "University Of Wyoming" }
    if (college == "a&m") { title += "Texas A&M" }
    if (college == "utaustin") { title += "UT Austin" }
    if (college == "houston") { title += "UT Houston" }
    if (college == "arlington") { title += "UT Arlington" }
    if (college == "northtexas") { title += "UT North Texas" }
    if (college == "texastech") { title += "Texas Tech" }
    if (college == "texasstate") { title += "Texas State" }
    if (college == "utsanantonio") { title += "UT San Antonio"}
    if (college == "utdallas") { title += "UT Dallas" }
    if (college == "utelpaso") { title += "UT El Paso" }
    if (college == "utahvalley") { title += "Utah Valley" }
    if (college == "brigham") { title += "Brigham Young" }
    if (college == "utah") { title += "University of Utah"}
    if (college == "weber") { title += "Weber State" }
    if (college == "utahstate") { title += "Utah State" }
    if (college == "vermont") { title += "University of Vermont" }
    if (college == "ccvermont") { title += "Community College Vermont" }
    if (college == "champlain") { title += "Champlain"}
    if (college == "norwich") { title += "Norwich" }
    if (college == "middlebury") { title += "Middlebury" }
    if (college == "northernvirginia") { title += "Northern Virginia" }
    if (college == "georgemason") { title += "George Mason" }
    if (college == "virginiatech") { title += "Virginia Tech"}
    if (college == "virginiacommon") { title += "Commonwealth U" }
    if (college == "uva") { title += "UVA" }
    if (college == "olddominion") { title += "Old Dominion U" }
    if (college == "jamesmadison") { title += "James Madison U" }
    if (college == "tidewater") { title += "Tidewater College"}
    if (college == "radford") { title += "Radford U" }
    if (college == "johntyler") { title += "John Tyler College" }
    if (college == "brown") { title += "Brown" }
    if (college == "rhodeisland") { title += "Rhode Island" }
    if (college == "southcarolina") { title += "USC" }
    if (college == "charleston") { title += "Charleston" }
    if (college == "coastalcarolina") { title += "Coastal Carolina" }
    if (college == "southdakota") { title += "South Dakota" }
    if (college == "southdakotastate") { title += "SD State" }
    if (college == "augustana") { title += "Augustana" }
    return title
}
/*
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
    if (college == "boulder") { return "boulder" }
    if (college == "coloradostate") { return "coloradostate" }
    if (college == "coloradotech") { return "coloradotech" }
    if (college == "denver") { return "denver" }
    if (college == "msudenver") { return "msudenver" }
    
    return ""
}
*/

func getName(college: String) -> String {
    var arr = Array(getTitle(college: college))
    return String(arr[13...])
}


