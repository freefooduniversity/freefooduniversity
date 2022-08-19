//
//  PickCollegeView.swift
//  FreeFoodUniversity
//
//  Created by William Sirotkin on 7/10/22.
//

import Foundation
import SwiftUI
import CoreData
import UIKit
import DropDown

struct pickCollegeContentView: View {
    @Binding var buttonClick: String
    @Binding var locationButtonClicked: Bool
    @Binding var latitude: Double
    @Binding var longitude: Double
    
    @ObservedObject var locationManager = LocationManager()
    
    @Binding var selectedState: String
    
    
    var collegeLocations = CollegeLocations()
    
    func getUserLocation() {
        if locationManager.userLocation == nil {
           locationManager.requestLocation()
            var gotLocation = false
            for i in 1 ... 70 {
                DispatchQueue.main.asyncAfter(deadline: .now() + Double(i)/10) {
                    if let location = locationManager.userLocation {
                        if (!gotLocation) {
                            self.latitude = location.coordinate.latitude
                            self.longitude = location.coordinate.longitude
                            var collegeLocation = CollegeLocations()
                            self.buttonClick = collegeLocation.closestCollege(lat: self.latitude, long: self.longitude)
                            gotLocation = true
                        }
                    }
                }
            }
        } else if let location = locationManager.userLocation {
            self.latitude = location.coordinate.latitude
            self.longitude = location.coordinate.longitude
            var collegeLocation = CollegeLocations()
            self.buttonClick = collegeLocation.closestCollege(lat: self.latitude, long: self.longitude)
            self.selectedState = ""
        }
    }

    
    
    var body: some View {
            /*
            Button(action: {
                withAnimation {
                    self.buttonClick = "uga"
                }
            }) {
                
                HStack {
                    Text(" Use Current Location Instead")
                        .font(.custom("Helvetica Neue", size: 9))
                        .foregroundColor(.black)
                    Image ("smallLocation")
                    Text(" ")
                }.border(Color.black)
                 
            
             */
        
        VStack {
            VStack {
                VStack {
                Text("Pick Your College:")
                    .underline()
                    .bold()
                    .font(.custom("Helvetica Neue", size: 18))
                    .foregroundColor(.black)
                }.position(x: 195, y: 10)
                HStack {
                    HStack {
                        Image("3bars")
                        SelectStateDropDownView(selectedState: ($selectedState))
                    }
                    Text("   ")
                    HStack {
                        
                        Button(action: {
                            withAnimation {
                                self.locationButtonClicked = true
                                getUserLocation()
                            }
                        }) {
                            HStack {
                               Text("Use Current Location")
                                Image("smallLocation")
                            }
                        }
                         
                    }
                }.position(x:200, y:5)
            }
            HStack {
                Button(action: {
                    withAnimation {
                        if (getCollegesByState(selectedState: selectedState)[0] != " ") {
                            self.buttonClick = getCollegesByState(selectedState: selectedState)[0]
                            self.selectedState = ""
                        }
                    }
                }) {
                    Image(getCollegesByState(selectedState: selectedState)[0])
                        .renderingMode(Image.TemplateRenderingMode?
                        .init(Image.TemplateRenderingMode.original))
                        .resizable()
                        .frame(width: 68, height: 65)
                }
        
                Button(action: {
                    withAnimation {
                        if (getCollegesByState(selectedState: selectedState)[1] != " ") {
                            self.buttonClick = getCollegesByState(selectedState: selectedState)[1]
                            self.selectedState = ""
                        }
                    }
                }) {
                    Image(getCollegesByState(selectedState: selectedState)[1])
                        .renderingMode(Image.TemplateRenderingMode?
                        .init(Image.TemplateRenderingMode.original))
                        .resizable()
                        .frame(width: 68, height: 65)
                }
                
                Button(action: {
                    withAnimation {
                        if (getCollegesByState(selectedState: selectedState)[2] != " ") {
                            self.buttonClick = getCollegesByState(selectedState: selectedState)[2]
                            self.selectedState = ""
                        }
                    }
                }) {
                    Image(getCollegesByState(selectedState: selectedState)[2])
                        .renderingMode(Image.TemplateRenderingMode?
                        .init(Image.TemplateRenderingMode.original))
                        .resizable()
                        .frame(width: 68, height: 65)
                }
                    
            
                Button(action: {
                    withAnimation {
                        if (getCollegesByState(selectedState: selectedState)[3] != " ") {
                            self.buttonClick = getCollegesByState(selectedState: selectedState)[3]
                            self.selectedState = ""
                        }
                    }
                }) {
                    Image(getCollegesByState(selectedState: selectedState)[3])
                        .renderingMode(Image.TemplateRenderingMode?
                        .init(Image.TemplateRenderingMode.original))
                        .resizable()
                        .frame(width: 68, height: 65)
                }
            
                Button(action: {
                    withAnimation {
                        if (getCollegesByState(selectedState: selectedState)[4] != " ") {
                            self.buttonClick = getCollegesByState(selectedState: selectedState)[4]
                            self.selectedState = ""
                        }
                    }
                }) {
                    Image(getCollegesByState(selectedState: selectedState)[4])
                        .renderingMode(Image.TemplateRenderingMode?
                        .init(Image.TemplateRenderingMode.original))
                        .resizable()
                        .frame(width: 68, height: 65)
                }
            }.position(x:200, y:28)
            
            HStack {
                
                Button(action: {
                    withAnimation {
                        if (getCollegesByState(selectedState: selectedState)[5] != " ") {
                            self.buttonClick = getCollegesByState(selectedState: selectedState)[5]
                            self.selectedState = ""
                        }
                    }
                }) {
                    Image(getCollegesByState(selectedState: selectedState)[5])
                        .renderingMode(Image.TemplateRenderingMode?
                        .init(Image.TemplateRenderingMode.original))
                        .resizable()
                        .frame(width: 68, height: 65)
                }
            
                Button(action: {
                    withAnimation {
                        if (getCollegesByState(selectedState: selectedState)[6] != " ") {
                            self.buttonClick = getCollegesByState(selectedState: selectedState)[6]
                            self.selectedState = ""
                        }
                    }
                }) {
                    Image(getCollegesByState(selectedState: selectedState)[6])
                        .renderingMode(Image.TemplateRenderingMode?
                        .init(Image.TemplateRenderingMode.original))
                        .resizable()
                        .frame(width: 68, height: 65)
                }
                
                Button(action: {
                    withAnimation {
                        if (getCollegesByState(selectedState: selectedState)[7] != " ") {
                            self.buttonClick = getCollegesByState(selectedState: selectedState)[7]
                            self.selectedState = ""
                        }
                    }
                }) {
                    Image(getCollegesByState(selectedState: selectedState)[7])
                        .renderingMode(Image.TemplateRenderingMode?
                        .init(Image.TemplateRenderingMode.original))
                        .resizable()
                        .frame(width: 68, height: 65)
                }
        
                Button(action: {
                    withAnimation {
                        if (getCollegesByState(selectedState: selectedState)[8] != " ") {
                            self.buttonClick = getCollegesByState(selectedState: selectedState)[8]
                            self.selectedState = ""
                        }
                    }
                }) {
                    Image(getCollegesByState(selectedState: selectedState)[8])
                        .renderingMode(Image.TemplateRenderingMode?
                        .init(Image.TemplateRenderingMode.original))
                        .resizable()
                        .frame(width: 68, height: 65)
                }
                
                Button(action: {
                    withAnimation {
                        if (getCollegesByState(selectedState: selectedState)[9] != " ") {
                            self.buttonClick = getCollegesByState(selectedState: selectedState)[9]
                            self.selectedState = ""
                        }
                    }
                }) {
                    Image(getCollegesByState(selectedState: selectedState)[9])
                        .renderingMode(Image.TemplateRenderingMode?
                        .init(Image.TemplateRenderingMode.original))
                        .resizable()
                        .frame(width: 68, height: 65)
                }
                
            }.position(x:200, y:28)
        }.background(Color.white)
    }
}





