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
    @State var latitude: Double = 37.0902
    @State var longitude: Double = -95.7129
    @State var zoom: Float = 3
    var markers: [GMSMarker] = []
   
    func setMarkers(markers: [GMSMarker]) ->  [ GMSMarker ] {
        var tempMarkers = markers
        for i in 0 ... 4 {
            var marker: GMSMarker = GMSMarker()
            marker.position = CLLocationCoordinate2D(latitude: (33.9480 + Double(i)), longitude: (-83.3773 + Double(i)))
            marker.title = ""
            marker.snippet = "Welcome to Hello World"
            marker.icon = UIImage(named: "burger")!.withRenderingMode(.alwaysTemplate)
            tempMarkers.append(marker)
            print(tempMarkers)
        }
        //print(mark)
        return tempMarkers
    }
    
    var body: some View {
        var m = setMarkers(markers: markers)
        if (self.college == "") {
            GoogleMapsView(latitude: .constant(latitude), longitude: .constant(longitude), zoom: .constant(zoom), marker: .constant(m))
                .ignoresSafeArea()
            MainPageContentView(buttonClick: $college)
                .ignoresSafeArea()
           // GoogleMapsView(latitude: .constant(latitude), longitude: .constant(longitude), zoom: .constant(zoom))
        } else if (self.college == "pickCollege") {
            GoogleMapsView(latitude: .constant(37.0902), longitude: .constant(-95.7129), zoom: .constant(3), marker: .constant(m))
                .ignoresSafeArea()
            pickCollegeContentView(buttonClick: $college)
                .ignoresSafeArea()
        } else {
            var lat: Double = getLat(college: college)
            var long: Double = getLong(college: college)
            if (self.college != "bama") { GoogleMapsView(latitude: .constant(lat), longitude: .constant(long), zoom: .constant(14.5), marker: .constant(m)).ignoresSafeArea() }
            CollegeContentView(college: $college)
                .ignoresSafeArea()
        }
    }
    
    func getLat(college: String) -> Double {
        if (college == "uga") { return 33.9480 }
        if (college == "clemson") { return 34.6834 }
        if (college == "gt") { return 33.7756 }
        if (college == "bama") { return 33.2140 }
        if (college == "florida") { return 29.6436 }
        if (college == "harvard") { return 42.3770 }
        return 37.0902
    }
    
    func getLong(college: String) -> Double {
        if (college == "uga") { return -83.3773 }
        if (college == "clemson") { return -82.8374 }
        if (college == "gt") { return -84.3963 }
        if (college == "bama") { return -87.5391 }
        if (college == "florida") { return -82.3549 }
        if (college == "harvard") { return -71.1167 }
        return -95.7129
    }
}

struct MainPageContentView: View {
    @Binding var buttonClick: String

    var body: some View {
        VStack {
            HStack {
                Text("Active Events: 98  ")
                    .foregroundColor(.black)
                    .font(.custom("Helvetica Neue", size: 14))
                Text("Fed Today: 842  ")
                    .foregroundColor(.black)
                    .font(.custom("Helvetica Neue", size: 14))
                Text("Fed All Time: 13,456")
                    .foregroundColor(.black)
                    .font(.custom("Helvetica Neue", size: 14))
            }
            
            Text("To Find Free Food...")
                .font(.custom("Helvetica Neue", size: 25))
                .position(x:200, y:30)
                .foregroundColor(.black)
            
            HStack {
                VStack {
                    Button(action: {
                        withAnimation {
                          //  self.buttonClick = "uga"
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
                
                Text(" Or ").foregroundColor(.black)
                
                VStack {
                    Button(action: {
                        withAnimation {
                            self.buttonClick = "pickCollege"
                        }
                    }) {
                        HStack {
                        Image("graduation-hat")
                            .renderingMode(Image.TemplateRenderingMode?
                            .init(Image.TemplateRenderingMode.original))
                        Image("down-arrow")
                            .renderingMode(Image.TemplateRenderingMode?
                            .init(Image.TemplateRenderingMode.original))
                        }
                    }
                    Text("        Pick Your College           ")
                        .font(.custom("Helvetica Neue", size: 12))
                        .foregroundColor(.black)
                }.border(Color.black)
            }.position(x:200, y:30)
            
            HStack {
                Button("Sign In |") {
                    print("Sign in page")
                }
                Button("About Us |") {
                    print("About Us Page")
                }
                Button("Feedback |") {
                    print("Feedback Page")
                }
                Button("Tutorial |") {
                    print("Tutorial Page")
                }
                Button("Settings ") {
                    print("Settings page")
                }
            }.background(Color.red).position(x:195, y:50)
        }.background(Color.white)
    }
}

struct pickCollegeContentView: View {
    @Binding var buttonClick: String

    var body: some View {
        VStack {
            HStack {
                VStack {
                Button(action: {
                    withAnimation {
                        self.buttonClick = "uga"
                    }
                }) {
                    Image("uga")
                        .renderingMode(Image.TemplateRenderingMode?
                        .init(Image.TemplateRenderingMode.original))
                }
                Text("University Of Georgia")
                    .font(.custom("Helvetica Neue", size: 12))
                    .foregroundColor(.black)
                }
            
                VStack {
            Button(action: {
                withAnimation {
                    self.buttonClick = "clemson"
                }
            }) {
                Image("clemson")
                    .renderingMode(Image.TemplateRenderingMode?
                    .init(Image.TemplateRenderingMode.original))
            }
            Text("Clemson University")
                .font(.custom("Helvetica Neue", size: 12))
                .foregroundColor(.black)
                }
                VStack {
            Button(action: {
                withAnimation {
                    self.buttonClick = "gt"
                }
            }) {
                Image("gt")
                    .renderingMode(Image.TemplateRenderingMode?
                    .init(Image.TemplateRenderingMode.original))
            }
            Text("Georgia Tech")
                .font(.custom("Helvetica Neue", size: 12))
                .foregroundColor(.black)
                }
            }.position(x:200, y:70)
            
            HStack {
                VStack {
                Button(action: {
                    withAnimation {
                        self.buttonClick = "bama"
                    }
                }) {
                    Image("bama")
                        .renderingMode(Image.TemplateRenderingMode?
                        .init(Image.TemplateRenderingMode.original))
                }
                Text("University Of Alabama")
                    .font(.custom("Helvetica Neue", size: 12))
                    .foregroundColor(.black)
                }
            
                VStack {
            Button(action: {
                withAnimation {
                    self.buttonClick = "florida"
                }
            }) {
                Image("florida")
                    .renderingMode(Image.TemplateRenderingMode?
                    .init(Image.TemplateRenderingMode.original))
            }
            Text("University of Florida")
                .font(.custom("Helvetica Neue", size: 12))
                .foregroundColor(.black)
                }
                VStack {
            Button(action: {
                withAnimation {
                    self.buttonClick = "harvard"
                }
            }) {
                Image("harvard")
                    .renderingMode(Image.TemplateRenderingMode?
                    .init(Image.TemplateRenderingMode.original))
            }
            Text("Harvard Univeristy")
                .font(.custom("Helvetica Neue", size: 12))
                .foregroundColor(.black)
                }
            }.position(x:200, y:0)
        }.background(Color.white)
    }
}


struct CollegeContentView: View {
    @Binding var college: String
    
    func getImage(college: String) -> String {
        if (college == "uga") { return "uga" }
        if (college == "clemson") { return "clemson" }
        if (college == "gt") { return "gt" }
        if (college == "bama") { return "bama" }
        if (college == "florida") { return "florida" }
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
        if (college == "harvard") { title += "Harvard" }
        
        return title
    }
    
    func getColor(college: String) -> Color {
        if (college == "uga") { return Color.red }
        if (college == "clemson") { return Color.orange }
        if (college == "gt") { return Color.yellow }
        if (college == "bama") { return Color.red }
        if (college == "florida") { return Color.blue }
        if (college == "harvard") { return Color.red }
        return Color.red
    }
    
    var body: some View {
            VStack {
                if (college == "bama") {
                    Image("jordandavis").position(x:100, y:200)
                }
                HStack {
                    Text("Active Events: 2     ")
                        .foregroundColor(.black)
                        .font(.custom("Helvetica Neue", size: 14))
                    Text("Fed Today: 54    ")
                        .foregroundColor(.black)
                        .font(.custom("Helvetica Neue", size: 14))
                    Text("Fed All Time: 1,654")
                        .foregroundColor(.black)
                        .font(.custom("Helvetica Neue", size: 14))
                }
                Text(getTitle(college: college))
                    .font(.custom("Helvetica Neue", size: 25))
                    .position(x:200, y:30)
                    .foregroundColor(.black)
                
                HStack {
                    Image("sidenav")
                    Button(action: {
                        withAnimation {
                            self.college = "pickCollege"
                        }
                    }) {
                        Image(getImage(college: college))
                            .renderingMode(Image.TemplateRenderingMode?
                            .init(Image.TemplateRenderingMode.original))
                    }
                    Image("down-arrow")
                }.position(x:200, y:0)
            
            HStack {
            Button("Sign In |") {
                print("Sign in page")
            }
            Button("About Us |") {
                print("About Us Page")
            }
            Button("Feedback |") {
                print("Feedback Page")
            }
            Button("Tutorial |") {
                print("Tutorial Page")
            }
            Button("Settings ") {
                print("Settings page")
            }
        }.background(getColor(college: college)).position(x:195, y:50)
        }.background(Color.white)
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
 
