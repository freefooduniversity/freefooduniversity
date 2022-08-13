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
    
    @State private var isExpanded = false
    @State private var viewModel = ""
    @State private var selectedCountry = ""
    @State private var selectedCountryId = ""
    
    var collegeLocations = CollegeLocations()
    
    func getUserLocation() {
        if locationManager.userLocation == nil {
           locationManager.requestLocation()
            var gotLocation = false
            for i in 1 ... 50 {
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
            HStack {
                HStack {
                    Image("3bars")
                    SelectStateDropDownView()
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
            }.position(x:200, y:10)
            Text("Pick Your College: ")
                .font(.custom("Helvetica Neue", size: 15))
                .foregroundColor(.black)
                .position(x: 195, y: -10)
            HStack {
                Button(action: {
                    withAnimation {
                        self.buttonClick = "uga"
                    }
                }) {
                    Image("uga")
                        .renderingMode(Image.TemplateRenderingMode?
                        .init(Image.TemplateRenderingMode.original))
                        .resizable()
                        .frame(width: 68, height: 65)
                }
                    .font(.custom("Helvetica Neue", size: 12))
                    .foregroundColor(.black)
        
                Button(action: {
                    withAnimation {
                        self.buttonClick = "clemson"
                    }
                }) {
                    Image("clemson")
                        .renderingMode(Image.TemplateRenderingMode?
                        .init(Image.TemplateRenderingMode.original))
                        .resizable()
                        .frame(width: 68, height: 65)
                }
                    .font(.custom("Helvetica Neue", size: 12))
                    .foregroundColor(.black)
                
                Button(action: {
                    withAnimation {
                        self.buttonClick = "gt"
                    }
                }) {
                    Image("gt")
                        .renderingMode(Image.TemplateRenderingMode?
                        .init(Image.TemplateRenderingMode.original))
                        .resizable()
                        .frame(width: 68, height: 65)
                }
                    .font(.custom("Helvetica Neue", size: 12))
                    .foregroundColor(.black)
            
                Button(action: {
                    withAnimation {
                        self.buttonClick = "bama"
                    }
                }) {
                    Image("bama")
                        .renderingMode(Image.TemplateRenderingMode?
                        .init(Image.TemplateRenderingMode.original))
                        .resizable()
                        .frame(width: 68, height: 65)
                }
                    .font(.custom("Helvetica Neue", size: 12))
                    .foregroundColor(.black)
            
                Button(action: {
                    withAnimation {
                        self.buttonClick = "florida"
                    }
                }) {
                    Image("florida")
                        .renderingMode(Image.TemplateRenderingMode?
                        .init(Image.TemplateRenderingMode.original))
                        .resizable()
                        .frame(width: 68, height: 65)
                }
                    .font(.custom("Helvetica Neue", size: 12))
                    .foregroundColor(.black)
            }.position(x:200, y:-10)
            
            HStack {
                
                Button(action: {
                    withAnimation {
                        self.buttonClick = "michigan"
                    }
                }) {
                    Image("michigan")
                        .renderingMode(Image.TemplateRenderingMode?
                        .init(Image.TemplateRenderingMode.original))
                        .resizable()
                        .frame(width: 68, height: 65)
                }
                    .font(.custom("Helvetica Neue", size: 12))
                    .foregroundColor(.black)
            
                Button(action: {
                    withAnimation {
                        self.buttonClick = "ksu"
                    }
                }) {
                    Image("ksu")
                        .renderingMode(Image.TemplateRenderingMode?
                        .init(Image.TemplateRenderingMode.original))
                        .resizable()
                        .frame(width: 68, height: 65)
                }
                    .font(.custom("Helvetica Neue", size: 12))
                    .foregroundColor(.black)
                
                Button(action: {
                    withAnimation {
                        self.buttonClick = "gastate"
                    }
                }) {
                    Image("gastate")
                        .renderingMode(Image.TemplateRenderingMode?
                        .init(Image.TemplateRenderingMode.original))
                        .resizable()
                        .frame(width: 68, height: 65)
                }
        
                Button(action: {
                    withAnimation {
                        self.buttonClick = "usc"
                    }
                }) {
                    Image("usc")
                        .renderingMode(Image.TemplateRenderingMode?
                        .init(Image.TemplateRenderingMode.original))
                        .resizable()
                        .frame(width: 68, height: 65)
                }
                    .font(.custom("Helvetica Neue", size: 12))
                    .foregroundColor(.black)
                
                Button(action: {
                    withAnimation {
                        self.buttonClick = "harvard"
                    }
                }) {
                    Image("harvard")
                        .renderingMode(Image.TemplateRenderingMode?
                        .init(Image.TemplateRenderingMode.original))
                        .resizable()
                        .frame(width: 68, height: 65)
                }
                    .font(.custom("Helvetica Neue", size: 12))
                    .foregroundColor(.black)
                
            }.position(x:200, y:5)
        }.background(Color.white)
    }
}
