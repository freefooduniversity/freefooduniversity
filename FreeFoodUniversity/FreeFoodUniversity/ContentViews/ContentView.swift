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

struct StatsView: View {
    @Binding var active: Int
    @Binding var fedToday: Int
    @Binding var fedAllTime: Int
    
    var body: some View {
        HStack {
            Text("Food Events:")
                .foregroundColor(.black)
                .font(.custom("Helvetica Neue", size: 14))
            Text(String(active) + "🍔  ")
                .foregroundColor(.blue)
                .font(.custom("Helvetica Neue", size: 14))
            
            Text("Today:")
                .foregroundColor(.black)
                .font(.custom("Helvetica Neue", size: 14))
            Text(String(fedToday) + "🧑🏻‍💼  ")
                .foregroundColor(.blue)
                .font(.custom("Helvetica Neue", size: 14))
            Text("All Time:")
                .foregroundColor(.black)
                .font(.custom("Helvetica Neue", size: 14))
            Text(String(fedAllTime) + "🧑🏻‍💼  ")
                .foregroundColor(.blue)
                .font(.custom("Helvetica Neue", size: 14))
        }
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
            marker.snippet = "Event: Burger Club "
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
                .frame(width: 400, height: 450, alignment: .center)
            StatsView(active: .constant(34), fedToday: .constant(861), fedAllTime: .constant(23156))
            MainPageContentView(buttonClick: $college)
            BottomButtonsView()
           // GoogleMapsView(latitude: .constant(latitude), longitude: .constant(longitude), zoom: .constant(zoom))
        } else if (self.college == "pickCollege") {
            GoogleMapsView(latitude: .constant(37.0902), longitude: .constant(-95.7129), zoom: .constant(3), marker: .constant(m))
                .ignoresSafeArea()
                .frame(width: 400, height: 450, alignment: .center)
            StatsView(active: .constant(34), fedToday: .constant(861), fedAllTime: .constant(23156))
            pickCollegeContentView(buttonClick: $college)
                .ignoresSafeArea()
            BottomButtonsView()
        } else {
            var lat: Double = getLat(college: college)
            var long: Double = getLong(college: college)
            if (self.college != "bama") {
                GoogleMapsView(latitude: .constant(lat), longitude: .constant(long), zoom: .constant(14.5), marker: .constant(m))
                    .ignoresSafeArea()
                    .frame(width: 400, height: 450, alignment: .center)
            }
            StatsView(active: .constant(4), fedToday: .constant(86), fedAllTime: .constant(3176))
            CollegeContentView(college: $college)
                .ignoresSafeArea()
            BottomButtonsView()
        }
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

struct BottomButtonsView: View {
    var body: some View {
        HStack {
            Text("                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              ")
                .font(.system(size:1))
        }.background(Color.gray)
        HStack (spacing: 30) {
            Button(action: {
                withAnimation {
                    print("Profile Button Clicked")
                }
            }) {
                VStack {
                    Image("user")
                        .renderingMode(Image.TemplateRenderingMode?
                        .init(Image.TemplateRenderingMode.original))
                    Text("Profile\n")
                }
            }
            Button(action: {
                withAnimation {
                    print("About Us Button Clicked")
                }
            }) {
                VStack {
                    Image("team")
                        .renderingMode(Image.TemplateRenderingMode?
                        .init(Image.TemplateRenderingMode.original))
                    Text("About Us\n")
                }
            }
            Button(action: {
                withAnimation {
                    print("Feedback Button Clicked")
                }
            }) {
                VStack {
                    Image("feedback")
                        .renderingMode(Image.TemplateRenderingMode?
                        .init(Image.TemplateRenderingMode.original))
                    Text("Feedback\n")
                }
            }
            Button(action: {
                withAnimation {
                    print("Settings Clicked")
                }
            }) {
                VStack {
                    Image("settings")
                        .renderingMode(Image.TemplateRenderingMode?
                        .init(Image.TemplateRenderingMode.original))
                    Text("Settings\n")
                }
            }
        }
    }
}


struct MainPageContentView: View {
    @Binding var buttonClick: String

    var body: some View {
        VStack {
            Text("For Free Food: ")
                .font(.custom("Helvetica Neue", size: 25))
                .foregroundColor(.black)
                .position(x:200, y:20)
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
            }.position(x:200, y:30)
            HStack {
                Button(action: {
                    withAnimation {
                        //self.buttonClick = "pickCollege"
                    }
                }) {
                }
            }
        }.background(Color.white)
    }
}

struct pickCollegeContentView: View {
    @Binding var buttonClick: String

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
                Text("Select State:              ")
                    .font(.custom("Helvetica Neue", size: 12))
                    .foregroundColor(.black)
                Text("                              Use Current Location: ")
                    .font(.custom("Helvetica Neue", size: 12))
                    .foregroundColor(.black)
            }
            Text("Top Colleges In US: ")
                .font(.custom("Helvetica Neue", size: 14))
                .foregroundColor(.black)
                .underline()
            
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
            }
            
            HStack {
                Button(action: {
                    withAnimation {
                        self.buttonClick = "gastate"
                    }
                }) {
                    Image("gastateCopy")
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
                
            }.position(x:200, y:40)
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
                if (college == "bama") {
                    Image("jordandavis").position(x:100, y:200)
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
                }.position(x:200, y:10)
                HStack {
                    Button ("⚠️ Allow Notifications\n For Food at UGA") {
                        print("Hello")
                    }.border(Color.black)
                    Button ("⚠️ Set UGA as Your Default College") {
                        print("Hello")
                    }.border(Color.black)
                }
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
 
