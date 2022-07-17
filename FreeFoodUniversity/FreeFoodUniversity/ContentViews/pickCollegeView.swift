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

struct pickCollegeContentView: View {
    @Binding var buttonClick: String
    @Binding var locationButtonClicked: Bool
    
    @ObservedObject var locationManager = LocationManager()
    
    @State private var isExpanded = false
    @State private var viewModel = ""
    @State private var selectedCountry = ""
    @State private var selectedCountryId = ""
    
    var collegeLocations = CollegeLocations()
    
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
            Text("Pick Your College: ")
                .font(.custom("Helvetica Neue", size: 20))
                .foregroundColor(.black)
                .position(x: 195, y: 10)
            HStack {
                Button (" Select State  ") {
                    self.buttonClick = "select-state"
                }.border(Color.black)
                Text("        ")
                HStack {
                    Button (" Use Current Location") {
                        self.locationButtonClicked = true
                    
                        if locationManager.userLocation == nil {
                          locationManager.requestLocation()
                      } else if let location = locationManager.userLocation {
                            var latitude = location.coordinate.latitude
                          var longitude = location.coordinate.longitude
                          self.buttonClick = collegeLocations.closestCollege(lat: latitude, long: longitude)
                      }
                    }
                    Image("smallLocation")
                }.border(Color.black)
            }.position(x:200, y:-10)
            
            HStack {
                Button(action: {
                    withAnimation {
                        self.buttonClick = "uga"
                    }
                }) {
                    Image("ugaCopy")
                        .renderingMode(Image.TemplateRenderingMode?
                        .init(Image.TemplateRenderingMode.original))
                }
                    .font(.custom("Helvetica Neue", size: 12))
                    .foregroundColor(.black)
        
                Button(action: {
                    withAnimation {
                        self.buttonClick = "clemson"
                    }
                }) {
                    Image("clemsonCopy")
                        .renderingMode(Image.TemplateRenderingMode?
                        .init(Image.TemplateRenderingMode.original))
                }
                    .font(.custom("Helvetica Neue", size: 12))
                    .foregroundColor(.black)
                
                Button(action: {
                    withAnimation {
                        self.buttonClick = "gt"
                    }
                }) {
                    Image("gtCopy")
                        .renderingMode(Image.TemplateRenderingMode?
                        .init(Image.TemplateRenderingMode.original))
                }
                    .font(.custom("Helvetica Neue", size: 12))
                    .foregroundColor(.black)
            
                Button(action: {
                    withAnimation {
                        self.buttonClick = "bama"
                    }
                }) {
                    Image("bamaCopy")
                        .renderingMode(Image.TemplateRenderingMode?
                        .init(Image.TemplateRenderingMode.original))
                }
                    .font(.custom("Helvetica Neue", size: 12))
                    .foregroundColor(.black)
            
                Button(action: {
                    withAnimation {
                        self.buttonClick = "florida"
                    }
                }) {
                    Image("floridaCopy")
                        .renderingMode(Image.TemplateRenderingMode?
                        .init(Image.TemplateRenderingMode.original))
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
                    Image("michiganCopy")
                        .renderingMode(Image.TemplateRenderingMode?
                        .init(Image.TemplateRenderingMode.original))
                }
                    .font(.custom("Helvetica Neue", size: 12))
                    .foregroundColor(.black)
            
                Button(action: {
                    withAnimation {
                        self.buttonClick = "ksu"
                    }
                }) {
                    Image("ksuCopy")
                        .renderingMode(Image.TemplateRenderingMode?
                        .init(Image.TemplateRenderingMode.original))
                }
                    .font(.custom("Helvetica Neue", size: 12))
                    .foregroundColor(.black)
                
                Button(action: {
                    withAnimation {
                        self.buttonClick = "gastate"
                    }
                }) {
                    Image("gastateCopy")
                        .renderingMode(Image.TemplateRenderingMode?
                        .init(Image.TemplateRenderingMode.original))
                }
        
                Button(action: {
                    withAnimation {
                        self.buttonClick = "usc"
                    }
                }) {
                    Image("uscCopy")
                        .renderingMode(Image.TemplateRenderingMode?
                        .init(Image.TemplateRenderingMode.original))
                }
                    .font(.custom("Helvetica Neue", size: 12))
                    .foregroundColor(.black)
                
                Button(action: {
                    withAnimation {
                        self.buttonClick = "harvard"
                    }
                }) {
                    Image("harvardCopy")
                        .renderingMode(Image.TemplateRenderingMode?
                        .init(Image.TemplateRenderingMode.original))
                }
                    .font(.custom("Helvetica Neue", size: 12))
                    .foregroundColor(.black)
                
            }.position(x:200, y:5)
        }.background(Color.white)
    }
}
