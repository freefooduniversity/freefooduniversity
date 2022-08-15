//
//  MainPageContentView.swift
//  FreeFoodUniversity
//
//  Created by Stephen Nemeth on 8/12/22.
//

import SwiftUI

struct MainPageContentView: View {
    @Binding var buttonClick: String
    @Binding var locationButtonClicked: Bool
    @Binding var latitude: Double
    @Binding var longitude: Double
    @Binding var locationPermissions: Bool
    @ObservedObject var locationManager = LocationManager()
    
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
        VStack {
            Text("Welcome to Free Food University!")
                .font(.custom("Helvetica Neue", size: 23))
                .foregroundColor(.black)
                .position(x:200, y:13)
            Text("To Find Food Near You... ")
                .font(.custom("Helvetica Neue", size: 14))
                .foregroundColor(.black)
                .position(x:200, y:-25)
            HStack {
                VStack {
                    Button(action: {
                        withAnimation {
                                self.locationButtonClicked = true
                                getUserLocation()
                        }
                    }) {
                        Image("location")
                            .renderingMode(Image.TemplateRenderingMode?
                            .init(Image.TemplateRenderingMode.original))
                            .resizable()
                            .frame(width: 100, height: 100)
                    }
                    Text("   Use Current Location   ")
                        .font(.custom("Helvetica Neue", size: 12))
                        .foregroundColor(.black)
                }.border(Color.black)
                
                Text(" Or ").foregroundColor(.black).bold()
                
                VStack {
                    Button(action: {
                        withAnimation {
                            self.buttonClick = "pickCollege"
                        }
                    }) {
                        Image("graduation-hat")
                            .renderingMode(Image.TemplateRenderingMode?
                            .init(Image.TemplateRenderingMode.original))
                            .resizable()
                            .frame(width: 100, height: 100)
                    }
                    Text("        Pick Your College           ")
                        .font(.custom("Helvetica Neue", size: 12))
                        .foregroundColor(.black)
                }.border(Color.black)
            }.position(x:200, y:-10)
           
        }.background(Color.white)
    }
}
