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
    
    @State var navButtonClicked: Bool = false
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
    
    var body: some View {
        var m = setMarkers(markers: markers)
        
        
        /* Map Views */
        if (self.college == "" || self.college == "pickCollege") {
            GoogleMapsView(latitude: .constant(latitude), longitude: .constant(longitude), zoom: .constant(zoom), marker: .constant(m))
                .ignoresSafeArea()
                .frame(width: 400, height: 450, alignment: .center)
            
        } else {
            var lat: Double = getLat(college: college)
            var long: Double = getLong(college: college)
            if (self.college != "bama") {
                GoogleMapsView(latitude: .constant(lat), longitude: .constant(long), zoom: .constant(15), marker: .constant(m))
                    .ignoresSafeArea()
                    .frame(width: 400, height: 450, alignment: .center)
            } else {
                BamaView(college: $college)
                    .ignoresSafeArea()
            }
            StatsView(active: .constant(4), fedToday: .constant(86), fedAllTime: .constant(3176))
        } // else
        
        /* Stats Views */
        if (!navButtonClicked) {
            if (self.college == "") { StatsView(active: .constant(34), fedToday: .constant(861), fedAllTime: .constant(23156)) }
            if (self.college == "pickCollege") { StatsView(active: .constant(4), fedToday: .constant(86), fedAllTime: .constant(3176)) }
        }
        
        /* Middle Views */
        if (!navButtonClicked) {
            //College Not Yet Picked
            if (self.college == "") { MainPageContentView(buttonClick: $college) }
            else if (self.college == "pickCollege") { pickCollegeContentView(buttonClick: $college) }
            
            // Specific College Was Picked
            else if (!addFood) { CollegeContentView(college: $college, addFood: $addFood) }
            else { addFoodToMapView(college: $college, addFood: $addFood) }
        } else {
          //  if (profileButtonClicked) { profileView() }
            if (aboutUsButtonClicked) { AboutUsView() }
         //   else if (feedbackButtonClicked) { FeedbackView() }
         //   else { settingsView() }
        }
        
        // Nav Button Views Always Present At Bottom
        NavButtonsView(navButtonClicked: $navButtonClicked, profileButtonClicked: .constant(false), aboutUsButtonClicked: $aboutUsButtonClicked, feedbackButtonClicked: .constant(false), settingsButtonClicked: .constant(false))
    }
    
    func getLat(college: String) -> Double {
        if (college == "uga") { return 33.9480 }
        if (college == "clemson") { return 34.6834 }
        if (college == "gt") { return 33.7756 }
        if (college == "bama") { return 33.2140 }
        if (college == "florida") { return 29.6436 }
        if (college == "gastate") { return 33.7531 }
        if (college == "ksu") { return 34.0382 }
        if (college == "michigan") { return 42.2780 }
        if (college == "usc") { return 34.0224 }
        if (college == "harvard") { return 42.3770 }
        return 37.0902
    }
    
    func getLong(college: String) -> Double {
        if (college == "uga") { return -83.3773 }
        if (college == "clemson") { return -82.8374 }
        if (college == "gt") { return -84.3963 }
        if (college == "bama") { return -87.5391 }
        if (college == "florida") { return -82.3549 }
        if (college == "gastate") { return -84.3853 }
        if (college == "ksu") { return -84.5827 }
        if (college == "michigan") { return -85.6024 }
        if (college == "usc") { return -118.2851 }
        if (college == "harvard") { return -71.1167 }
        return -95.7129
    }
}


struct MainPageContentView: View {
    @Binding var buttonClick: String

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
                            self.buttonClick = "uga"
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

struct CollegeContentView: View {
    @Binding var college: String
    @Binding var addFood: Bool
    
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
        
        return ""
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
        
        return title
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
    
    func getColor(college: String) -> Color {
        if (college == "uga") { return Color.red }
        if (college == "clemson") { return Color.orange }
        if (college == "gt") { return Color.yellow }
        if (college == "bama") { return Color.red }
        if (college == "florida") { return Color.blue }
        if (college == "gastate") { return Color.blue }
        if (college == "ksu") { return Color.black }
        if (college == "michigan") { return Color.blue }
        if (college == "usc") { return Color.yellow }
        if (college == "harvard") { return Color.red }
        return Color.red
    }
    
    var body: some View {
            VStack {
                Text(getTitle(college: college))
                    .font(.custom("Helvetica Neue", size: 25))
                    .position(x:200, y:20)
                    .foregroundColor(.black)
                
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
                            Text(" Add Food To The Map   ")
                                .font(.custom("Helvetica Neue", size: 12))
                                .foregroundColor(.black)
                        }
                    }.border(Color.black)
                    Text("          ")
                    Button(action: {
                        withAnimation {
                            self.college = "pickCollege"
                        }
                    }) {
                        HStack {
                            Image(getImage(college: college))
                                .renderingMode(Image.TemplateRenderingMode?
                                .init(Image.TemplateRenderingMode.original))
                            Image("down-arrow")
                        }
                    }
                }.position(x:200, y:10)
                HStack {
                    Button ("⚠️ Allow Notifications\n For Food at " + getName(college: college)) {
                        print("Hello")
                    }.border(Color.black)
                    Button ("⚠️ Set " + getName(college: college) + " as Your Default College") {
                        print("Hello")
                    }.border(Color.black)
                }
        }.background(Color.white)
    }
}

struct BamaView: View {
    @Binding var college: String
    
    var body: some View {
        VStack {
            Image("jordandavis").position(x:100, y:200)
            Text("Free Food at Bama 🤡")
                .font(.custom("Helvetica Neue", size: 25))
                .position(x:200, y:270)
                .foregroundColor(.black)
            
            HStack {
                Image("sidenav")
                Button(action: {
                    withAnimation {
                        self.college = "pickCollege"
                    }
                }) {
                    HStack {
                        Image("bama")
                            .renderingMode(Image.TemplateRenderingMode?
                            .init(Image.TemplateRenderingMode.original))
                        Image("down-arrow")
                    }
                }
            }.position(x:200, y:130)
            HStack {
                Button ("⚠️ Allow Notifications\n For Food at Bama") {
                    print("Hello")
                }.border(Color.black)
                Button ("⚠️ Set Bama as Your Default College") {
                    print("Hello")
                }.border(Color.black)
            }
        }
    }
}

struct addFoodToMapView: View {
    @Binding var college: String
    @Binding var addFood: Bool
    
    var body: some View {
        VStack {
            Text("Add Food To " + college)
            Text(college)
            Text(college)
            Text(college)
            Text(college)
            Text(college)
            Text(college)
            Text(college)
        }
        Button("Back") {
            addFood = false
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
 
