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
var executeStats: Bool = true
var executeForCollege: Bool = true
var executeUserData: Bool = true
var emailSet: [String] = []
var userData: [User] =  []
struct MainContentView: View {
    @State var college: String = "all"
    @State var addFood: Bool = false
    
    @State var isSignedIntoGoogle: Bool = false
    @State var navButton: String = ""
    @State var markerClicked: String = ""
    @State var reload: Int = 0
    
    @State var locationButtonClicked: Bool = false
    @State var navButtonClicked: Bool = false
    
    @State var profileButtonClicked: Bool = false
    @State var aboutUsButtonClicked: Bool = false
    
    @State var latitude: Double = 37.0902
    @State var longitude: Double = -95.7129
    @State var zoom: Float = 3.2
    
    @State var selectedState = ""
    
    @State var hasLiked: Bool = false
    @State var hasDisliked: Bool  = false
    @State var hasSignedUp: Bool = false
    @State var hasReported: Bool = false
    @State var reloadMarkerView: Bool = false
    @State var enlargeImage: Bool = false
    
    @State var imageId: String = ""
    @State var enlargeImageTimes: Int = 0 // prevent users from spamming enlarge and minimize image
    
    @State var returnMarkers: [Marker] = []
    @State var Markers: [Marker] = []
    @State var MarkersForTitleAndCollege: [Marker] = []
    @State var markers: [Marker] = []
    @State var GMSMarkers: [GMSMarker] = []
    @State var stats: Stats = Stats(id: 0, food_events: 0, fed_today: 0, fed_all_time: 0)
    
    @State var showListView : Bool = false
    @State var showMarkerView : Bool = false
    
    func setMarkers(doExecute: Bool) ->  [ GMSMarker ] {
        var userMarker: GMSMarker = GMSMarker()
        userMarker.position = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        userMarker.title = "Your Location"
        userMarker.icon = UIImage(named: "userLocation")!.withRenderingMode(.alwaysTemplate)

        addFood = false
        if (doExecute) {
            execute = false
            if (selectedState == "" || selectedState == "Select Your State") {
                if (markerClicked == "" || markerClicked == "all") {
                    if (college != "pickCollege") {
                        getAllMarkersForCollege (completion: { (marks) in
                            Markers = marks
                        }, college: college)
                        saveMarkersForCollege(markers: Markers)
                    } else {
                        getAllMarkersForCollege (completion: { (marks) in
                            Markers = marks
                        }, college: "all")
                    
                    }
                } else if (!markerClicked.contains("|")){
                    getMarkerFromTitleAndCollege(completion: { (marks) in
                        Markers = marks
                    }, college: college, food: markerClicked)
                } else {
                    getMarkerFromTitleAndCollege(completion: { (marks) in
                        Markers = marks
                    }, college: college, title: markerClicked)
                }
            } else {
                /*
                getMarkersForState(completion: { (marks) in
                    Markers = marks
                }, state: selectedState)
                 */
            }
        } else {
            execute = true
        }
         
        var tempMarkers = GMSMarkers
       // print("Hello")
            //  print(Markers)
     //   print("Hey")
        
        if (Markers.count > 0) {
            for i in 0 ... Markers.count - 1 {
                if (!emailSet.contains(Markers[i].creator_email)) {
                    emailSet.append(Markers[i].creator_email)
                }
                var marker: GMSMarker = GMSMarker()
                marker.position = CLLocationCoordinate2D(latitude: Markers[i].lat, longitude: Markers[i].long)
                var foodDisplayName = getFoodDisplayName(food: Markers[i].food)
                marker.title = makeMarkerTitle(food: Markers[i].food, building: Markers[i].building)
                if (college != "all" && college != "pickCollege") {
                    var str = /*"Time: " + String(Markers[i].start_time) + " - " + String(Markers[i].end_time) + "\n" +*/ "Click the " + getFoodDisplayName(food: Markers[i].food) + " Icon on the Right for Details"
                    marker.snippet = str
                } else {
                    marker.snippet = "Find Your College Below To See Details"
                }
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
        if (getStartTime() >= 2200 && getTimeZone() == 0) {
            deleteFedToday()
        }
        
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
    
    func getMarkersFromFoodAndCollege(food: String, doExecute: Bool) -> Marker {
        if (doExecute) {
            executeForCollege = false
            getMarkerFromTitleAndCollege (completion: { (marks) in
                MarkersForTitleAndCollege = marks
            }, college: college, food: food)
        } else {
            executeForCollege = true
        }
        return MarkersForTitleAndCollege[0]
    }
    
    func setUserData(doExecuteUserData: Bool) -> Int {
        if (doExecuteUserData) {
            executeUserData = false
            getUser (completion: { (marks) in
                userData = marks
            }, email: UIDevice.current.identifierForVendor!.uuidString)
        } else {
            executeUserData = true
        }
        return  0
            
    }
    
    func setStats(college: String, selectedState: String, doExecuteStats: Bool) -> Stats  {
        if (doExecuteStats) {
            executeStats = false
            if (selectedState == "" || selectedState == "Select Your State") {
                getStats (completion: { (stat) in
                    stats = stat
                }, college: college)
            } else {
                getStats (completion: { (stat) in
                    stats = stat
                }, college: college)
            }
        } else {
            executeStats = true
        }
        return stats
    }
    
    var collegeLocation = CollegeLocations()
    
    var LAT: Double = 37.0902
    var LONG: Double = -95.7129
    var ZOOM: Float = 3.2
    
   // @State var m : [GMSMarker] = []
    @State var locationPermissions: Bool = false
    
    func getGoogleMapsViewHeight() -> CGFloat {
        if (addFood && latitude != 37.0902 && navButton == "") {
            return 240
        } else if (showMarkerView && navButton == "") {
            return 400
        }
        return 450
    }
    
    var body: some View {
        var m = setMarkers(doExecute: execute)
        var s = setStats(college: "all", selectedState: selectedState, doExecuteStats: executeStats)
        var u = setUserData(doExecuteUserData: executeUserData)
        /* Map Views */
        if (self.college == "all" || self.college == "pickCollege") {
            if (selectedState == "" || selectedState == "Select Your State") {
            GoogleMapsView(latitude: .constant(LAT), longitude: .constant(LONG), zoom: .constant(ZOOM), marker: .constant(m))
                .ignoresSafeArea()
                .frame(width: 400, height: 450, alignment: .center)
            } else {
                GoogleMapsView(latitude: .constant(getStateLat(selectedState: selectedState)), longitude: .constant(getStateLong(selectedState: selectedState)), zoom: .constant(getStateZoom(selectedState: selectedState)), marker: .constant(m))
                    .ignoresSafeArea()
                    .frame(width: 400, height: 450, alignment: .center)
            }
            
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
                    .frame(width: 400, height: 450, alignment: .center)
            }
        } // else
        
        /* Stats Views */
        if (!self.addFood && self.navButton == "" && self.markerClicked == "") {
            StatsView(active: .constant(s.food_events),
                      fedToday: .constant(s.fed_today),
                      fedAllTime:.constant(s.fed_all_time))
        }
        
        /* Middle Views */
        if (navButton == "") {
            //College Not Yet Picked
            if (self.college == "all") { MainPageContentView(buttonClick: $college, locationButtonClicked: $locationButtonClicked, latitude: $latitude, longitude: $longitude, locationPermissions: $locationPermissions) }
            else if (self.college == "pickCollege") {
                pickCollegeContentView(buttonClick: $college, locationButtonClicked: $locationButtonClicked,latitude: $latitude, longitude: $longitude, selectedState: $selectedState)
            }
            else if (!addFood) {
                if (markerClicked == "") {
                    CollegeContentView(college: $college, addFood: $addFood, locationButtonClicked: $locationButtonClicked, markerClicked: $markerClicked, reload: $reload, showListView: $showListView)
                }
                else {
                    if (showListView) {
                        ListView(markers: Markers, showMarkerView: $showMarkerView, showListView: $showListView, markerClicked: $markerClicked)
                    } else if (showMarkerView) {
                        if (!enlargeImage) {
                            if (reloadMarkerView) {
                                MarkerView(markerData: Markers, title: $markerClicked, college: college, showMarkerView: $showMarkerView, showListView: $showListView, hasLiked: $hasLiked, hasDisliked: $hasDisliked, hasSignedUp: $hasSignedUp, hasReported: $hasReported, reload: $reloadMarkerView, enlargeImage: $enlargeImage, imageId: $imageId, enlargeImageTimes: $enlargeImageTimes)
                            } else {
                                MarkerView(markerData: Markers, title: $markerClicked, college: college, showMarkerView: $showMarkerView, showListView: $showListView, hasLiked: $hasLiked, hasDisliked: $hasDisliked, hasSignedUp: $hasSignedUp, hasReported: $hasReported, reload: $reloadMarkerView, enlargeImage: $enlargeImage, imageId: $imageId, enlargeImageTimes: $enlargeImageTimes)
                            }
                        } else {
                            PictureView(enlargeImage: $enlargeImage, imageId: $imageId)
                        }
                    }
                }
            }
            else {
                if (latitude != 37.0902) {
                    addFoodToMapView(college: $college, addFood: $addFood, lat: $latitude, long: $longitude)
                } else {
                    TurnOnLocationView(lat: $latitude, long: $longitude, addFood: $addFood)
                }
            }
        } else {
            if (navButton == "profile") {
                ProfileView(navButton: $navButton, userData: userData)
            }
            else if  (navButton == "aboutUs") {
                AboutUsView(navButton: $navButton)
            }
            else if (navButton == "feedback") {
                FeedbackView(navButton: $navButton)
            }
            else if (navButton == "tech-stack") {
                TechStackView(navButton: $navButton)
            }
        }
        // Nav Button Views Always Present At Bottom
        NavButtonsView(navButton: $navButton)
    }
}
