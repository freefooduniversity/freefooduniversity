//
//  MainContentView.swift
//  FreeFoodUniversity
//
//  Created by Stephen Nemeth on 8/12/22.
//

import Foundation
import SwiftUI
import GoogleMaps

var execute: Bool = true
struct MainContentView: View {
    @State var college: String = "all"
    @State var addFood: Bool = false
    
    @State var navButton: String = ""
    
    @State var locationButtonClicked: Bool = false
    @State var navButtonClicked: Bool = false
    
    @State var profileButtonClicked: Bool = false
    @State var aboutUsButtonClicked: Bool = false
    
    
    @State var latitude: Double = 37.0902
    @State var longitude: Double = -95.7129
    @State var zoom: Float = 3.2
    
    
    @State var Markers: [Marker] = []
    @State var markers: [Marker] = []
    @State var GMSMarkers: [GMSMarker] = []
    @State var stats: Stats = Stats(id: 0, food_events: 0, fed_today: 0, fed_all_time: 0)
    
    func setMarkers(doExecute: Bool) ->  [ GMSMarker ] {
        var userMarker: GMSMarker = GMSMarker()
        userMarker.position = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        userMarker.snippet = "\(latitude) \(longitude)"
        userMarker.title = "Your location"
        userMarker.icon = UIImage(named: "userLocation")!.withRenderingMode(.alwaysTemplate)

        if (addFood || doExecute) {
            execute = false
            if (college != "pickCollege") {
                getAllMarkersForCollege (completion: { (marks) in
                    Markers = marks
                }, college: college)
            } else {
                getAllMarkersForCollege (completion: { (marks) in
                    Markers = marks
                }, college: "all")
            
            }
            addFood = false
        } else {
            execute = true
        }
         
        var tempMarkers = GMSMarkers
       // print("Hello")
            //  print(Markers)
     //   print("Hey")
        
        if (Markers.count > 0) {
            for i in 0 ... Markers.count - 1 {
                var marker: GMSMarker = GMSMarker()
                marker.position = CLLocationCoordinate2D(latitude: Markers[i].lat, longitude: Markers[i].long)
                var foodDisplayName = getFoodDisplayName(food: Markers[i].food)
                marker.title = "Free \(foodDisplayName) At Brumby Hall!"
                marker.snippet = "See Details Below"
                marker.userData = Markers[i]
                if (Markers[i].food == "pizza") { marker.icon = UIImage(named: "pizza")!.withRenderingMode(.alwaysTemplate) }
                else if (Markers[i].food == "burger") { marker.icon = UIImage(named: "burger")!.withRenderingMode(.alwaysTemplate)}
                else if (Markers[i].food == "breakfast") {marker.icon = UIImage(named: "breakfast")!.withRenderingMode(.alwaysTemplate)}
                else if (Markers[i].food == "lunch") {marker.icon = UIImage(named: "lunch")!.withRenderingMode(.alwaysTemplate)}
                else if (Markers[i].food == "dinner") {marker.icon = UIImage(named: "dinner")!.withRenderingMode(.alwaysTemplate)}
                else if (Markers[i].food == "ice-cream") {marker.icon = UIImage(named: "ice-cream")!.withRenderingMode(.alwaysTemplate)}
                else if (Markers[i].food == "fruit") {marker.icon = UIImage(named: "fruit")!.withRenderingMode(.alwaysTemplate)}
                else if (Markers[i].food == "mexican") {marker.icon = UIImage(named: "mexican")!.withRenderingMode(.alwaysTemplate)}
                else if (Markers[i].food == "coffee") {marker.icon = UIImage(named: "coffee")!.withRenderingMode(.alwaysTemplate)}
                else if (Markers[i].food == "sandwich") {marker.icon = UIImage(named: "sandwich")!.withRenderingMode(.alwaysTemplate)}
                else if (Markers[i].food == "chickfila") {marker.icon = UIImage(named: "chickfila")!.withRenderingMode(.alwaysTemplate)}
                tempMarkers.append(marker)
            }
        }
        updateFoodEvents(college: college, food_events: Markers.count)
        
        // Don't show user location if it isnt on (When lat is default value)
        if (latitude != 37.0902) {
            tempMarkers.append(userMarker)
        }
        
        
        /*
        var userLocationMarker: GMSMarker = GMSMarker()
        if (latitude != 37.0902 && longitude != -95.7129) {
            userLocationMarker.position = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            userLocationMarker.title = ""
                userLocationMarker.icon = UIImage(named: "userLocation")!.withRenderingMode(.alwaysTemplate)}
            userLocationMarker.snippet = "Your Location"
            tempMarkers.append(userLocationMarker)
        }
         */
         
        //print(mark)
         
        return tempMarkers
    }
    
    func setStats(college: String) -> Stats  {
        getStats (completion: { (stat) in
            stats = stat
        }, college: college)
        return stats
    }
    
    var collegeLocation = CollegeLocations()
    
    var LAT: Double = 37.0902
    var LONG: Double = -95.7129
    var ZOOM: Float = 3.2
    
   // @State var m : [GMSMarker] = []
    @State var locationPermissions: Bool = false
    
    func getGoogleMapsViewHeight() -> CGFloat {
        if (addFood) {
            return 240
        } else {
            return 450
        }
    }
    
    var body: some View {
        var m = setMarkers(doExecute: execute)
        var s = setStats(college: college)
        /* Map Views */
        if (self.college == "all" || self.college == "pickCollege" || self.college == "select-state") {
            GoogleMapsView(latitude: .constant(LAT), longitude: .constant(LONG), zoom: .constant(ZOOM), marker: .constant(m))
                .ignoresSafeArea()
                .frame(width: 400, height: 450, alignment: .center)
               
            
        } else {
            var lat: Double = collegeLocation.getLat(college: college)
            var long: Double = collegeLocation.getLong(college: college)
            var zoom: Float = collegeLocation.getZoom(college: college)
            if (self.college != "bama") {
                if (!self.locationButtonClicked) {
                    
                    GoogleMapsView(latitude: .constant(lat), longitude: .constant(long), zoom: .constant(zoom), marker: .constant(m))
                        .ignoresSafeArea()
                        .frame(width: 400, height: getGoogleMapsViewHeight(), alignment: .center)
                } else {
                    GoogleMapsView(latitude: $latitude, longitude: $longitude, zoom: .constant(zoom), marker: .constant(m))
                        .ignoresSafeArea()
                        .frame(width: 400, height: getGoogleMapsViewHeight(), alignment: .center)
                }
            } else {
                BamaView(college: $college)
                    .ignoresSafeArea()
            }
        } // else
        
        /* Stats Views */
        if (!self.addFood && self.navButton == "") {
            StatsView(active: .constant(s.food_events),
                      fedToday: .constant(s.fed_today),
                      fedAllTime:.constant(s.fed_all_time))
        }
        
        /* Middle Views */
        if (navButton == "") {
            //College Not Yet Picked
            if (self.college == "all") { MainPageContentView(buttonClick: $college, locationButtonClicked: $locationButtonClicked, latitude: $latitude, longitude: $longitude, locationPermissions: $locationPermissions) }
            else if (self.college == "pickCollege") { pickCollegeContentView(buttonClick: $college, locationButtonClicked: $locationButtonClicked,
                                                                             latitude: $latitude, longitude: $longitude) }
            
            // Specific College Was Picked
            else if (!addFood) { CollegeContentView(college: $college, addFood: $addFood, locationButtonClicked: $locationButtonClicked) }
            else { addFoodToMapView(college: $college, addFood: $addFood, lat: $latitude, long: $longitude) }
        } else {
            if (navButton == "profile") { ProfileView(navButton: $navButton) }
            else if  (navButton == "aboutUs") { AboutUsView(navButton: $navButton) }
          else if (navButton == "feedback") { FeedbackView(navButton: $navButton) }
           //else if (navButton == "tech-stack") { TechStackView(navButton: $navButton) }
            else if (navButton == "tech-stack") {
                TechStackView(navButton: $navButton)
            }
        }
        
        // Nav Button Views Always Present At Bottom
        NavButtonsView(navButton: $navButton)
    }
}
