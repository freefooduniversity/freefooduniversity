//
//  ContentView.swift
//  FreeFoodUniversity
//
//  Created by Stephen Nemeth on 6/5/22.
//

import GoogleMaps
import SwiftUI
import CoreData
import UIKit
import CoreLocation
import CoreLocationUI

class LocationManager: NSObject, ObservableObject {
    private let manager = CLLocationManager()
    @Published var userLocation: CLLocation?
    static let shared = LocationManager()
    
    override init() {
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.startUpdatingLocation()
    }
    
    func requestLocation() {
        manager.requestWhenInUseAuthorization()
    }
    
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
            
        case .notDetermined:
             print("DEBUG: Not Determined")
        case .restricted:
            print("DEBUG: Restricted")
        case .denied:
            print("DEBUG: Denied")
        case .authorizedAlways:
            print("DEBUG: Authorized Always")
        case .authorizedWhenInUse:
            print("DEBUG: Authroized When Not In use")
        @unknown default:
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        self.userLocation = location
    }
}

struct GoogleMapsView: UIViewRepresentable {
    @Binding var latitude: Double
    @Binding var longitude: Double
    @Binding var zoom: Float
    @Binding var marker: [GMSMarker]
    
    
    
        
        func makeUIView(context: Context) -> GMSMapView {
            var usa = GMSCameraPosition.camera(withLatitude: latitude, longitude: longitude, zoom: zoom)
            
            GMSServices.provideAPIKey(APIKey)
            let camera = usa
            let mapView = GMSMapView(frame: CGRect.zero, camera: camera)
            return mapView
        }
             
        func updateUIView(_ uiView: GMSMapView, context: Context) {
//            let marker : GMSMarker = GMSMarker()
//            marker.position = CLLocationCoordinate2D(latitude: 33.9480, longitude: -83.3773 )
//            marker.title = ""
//            marker.snippet = "Welcome to Hello World"
//            marker.icon = UIImage(named: "burger")!.withRenderingMode(.alwaysTemplate)
            for i in 0 ... marker.count - 1{
                    marker[i].map = uiView
            }
        }
 }


struct MainContentView: View {
    @State var college: String = ""
    @State var addFood: Bool = false
    
    @State var navButton: String = ""
    
    @State var locationButtonClicked: Bool = false
    @State var navButtonClicked: Bool = false
    
    @State var profileButtonClicked: Bool = false
    @State var aboutUsButtonClicked: Bool = false
    
    
    @State var latitude: Double = 37.0902
    @State var longitude: Double = -95.7129
    @State var zoom: Float = 3.2
    
    var markers: [GMSMarker] = []
   
    func setMarkers(markers: [GMSMarker]) ->  [ GMSMarker ] {
        var tempMarkers = markers
        for i in 0 ... 50 {
            var marker: GMSMarker = GMSMarker()
            marker.position = CLLocationCoordinate2D(latitude: (33.9480 + Double.random(in: -5 ... 12)), longitude: (-83.3773 + Double.random(in: -30 ... 2)))
            marker.title = ""
            marker.snippet = "Event: Burger Club "
            if (i % 10 == 0) { marker.icon = UIImage(named: "pizza")!.withRenderingMode(.alwaysTemplate) }
            if (i % 10 == 1) { marker.icon = UIImage(named: "burger")!.withRenderingMode(.alwaysTemplate)}
            if (i % 10 == 2) {marker.icon = UIImage(named: "breakfast")!.withRenderingMode(.alwaysTemplate)}
            if (i % 10 == 3) {marker.icon = UIImage(named: "lunch")!.withRenderingMode(.alwaysTemplate)}
            if (i % 10 == 4) {marker.icon = UIImage(named: "dinner")!.withRenderingMode(.alwaysTemplate)}
            if (i % 10 == 5) {marker.icon = UIImage(named: "ice-cream")!.withRenderingMode(.alwaysTemplate)}
            if (i % 10 == 6) {marker.icon = UIImage(named: "fruit")!.withRenderingMode(.alwaysTemplate)}
            if (i % 10 == 7) {marker.icon = UIImage(named: "mexican")!.withRenderingMode(.alwaysTemplate)}
            if (i % 10 == 8) {marker.icon = UIImage(named: "coffee")!.withRenderingMode(.alwaysTemplate)}
            if (i % 10 == 9) {marker.icon = UIImage(named: "sandwich")!.withRenderingMode(.alwaysTemplate)}
            tempMarkers.append(marker)
            print(tempMarkers)
        }
        //print(mark)
        return tempMarkers
    }
    
    var collegeLocation = CollegeLocations()
    
    var LAT: Double = 37.0902
    var LONG: Double = -95.7129
    var ZOOM: Float = 3.2
    
    @State var locationPermissions: Bool = false
    
    var body: some View {
        var m = setMarkers(markers: markers)
        
        /* Map Views */
        if (self.college == "" || self.college == "pickCollege" || self.college == "select-state") {
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
                        .frame(width: 400, height: 450, alignment: .center)
                } else {
                    GoogleMapsView(latitude: $latitude, longitude: $longitude, zoom: .constant(zoom), marker: .constant(m))
                        .ignoresSafeArea()
                        .frame(width: 400, height: 450, alignment: .center)
                }
            } else {
                BamaView(college: $college)
                    .ignoresSafeArea()
            }
            if (!addFood) { StatsView(active: .constant(4), fedToday: .constant(86), fedAllTime: .constant(3176)) }
        } // else
        
        /* Stats Views */
        if (navButton == "") {
            if (self.college == "") { StatsView(active: .constant(34), fedToday: .constant(861), fedAllTime: .constant(23156)) }
            if (self.college == "pickCollege") { StatsView(active: .constant(34), fedToday: .constant(861), fedAllTime: .constant(23156)) }
        }
        
        /* Middle Views */
        if (navButton == "") {
            //College Not Yet Picked
            if (self.college == "") { MainPageContentView(buttonClick: $college, locationButtonClicked: $locationButtonClicked, latitude: $latitude, longitude: $longitude, locationPermissions: $locationPermissions) }
            else if (self.college == "pickCollege") { pickCollegeContentView(buttonClick: $college, locationButtonClicked: $locationButtonClicked) }
            else if (self.college == "select-state") { SelectStateView(buttonClick: $college, locationButtonClicked: $locationButtonClicked)}
            
            // Specific College Was Picked
            else if (!addFood) { CollegeContentView(college: $college, addFood: $addFood, locationButtonClicked: $locationButtonClicked) }
            else { addFoodToMapView(college: $college, addFood: $addFood) }
        } else {
            if (navButton == "profile") { ProfileView(navButton: $navButton) }
            else if  (navButton == "aboutUs") { AboutUsView(navButton: $navButton) }
          else if (navButton == "feedback") { FeedbackView(navButton: $navButton) }
           else { SettingsView(navButton: $navButton) }
        }
        
        // Nav Button Views Always Present At Bottom
        NavButtonsView(navButton: $navButton)
    }
}


struct MainPageContentView: View {
    @Binding var buttonClick: String
    @Binding var locationButtonClicked: Bool
    @Binding var latitude: Double
    @Binding var longitude: Double
    @Binding var locationPermissions: Bool
    @ObservedObject var locationManager = LocationManager()
    
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
                                if locationManager.userLocation == nil {
                                   locationManager.requestLocation()
                                } else if let location = locationManager.userLocation {
                                    self.latitude = location.coordinate.latitude
                                    self.longitude = location.coordinate.longitude
                                    var collegeLocation = CollegeLocations()
                                    self.buttonClick = collegeLocation.closestCollege(lat: self.latitude, long: self.longitude)
                                }
                        }
                    }) {
                        Image("location")
                            .renderingMode(Image.TemplateRenderingMode?
                            .init(Image.TemplateRenderingMode.original))
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
                    }
                    Text("        Pick Your College           ")
                        .font(.custom("Helvetica Neue", size: 12))
                        .foregroundColor(.black)
                }.border(Color.black)
            }.position(x:200, y:-10)
           
        }.background(Color.white)
    }
}







































































struct BamaView: View {
    @Binding var college: String
    
    var body: some View {
        VStack {
            Image("jordandavis").position(x:100, y:300)
        }
    }
}




struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>

    var body: some View {
        NavigationView {
            List {
                ForEach(items) { item in
                    NavigationLink {
                        Text("Item at \(item.timestamp!, formatter: itemFormatter)")
                    } label: {
                        Text(item.timestamp!, formatter: itemFormatter)
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
            Text("Select an item")
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
 
