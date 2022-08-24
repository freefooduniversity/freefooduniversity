//
//  FreeFoodUniversityApp.swift
//  FreeFoodUniversity
//
//  Created by Stephen Nemeth on 6/5/22.
//

import GoogleMaps
import SwiftUI
import FirebaseCore
import FirebaseStorage

@main
struct FreeFoodUniversityApp: App {
    let persistenceController = PersistenceController.shared
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            /*
            GoogleMapsView()
                .edgesIgnoringSafeArea(.all)
             */
            
            MainContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .edgesIgnoringSafeArea(.bottom)
             
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate, GMSMapViewDelegate{
     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
      //   GMSServices.provideAPIKey(value)
         return true
     }
    
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        print("you tapped something")
        return true
    }
 }
 
let value = Bundle.main.object(forInfoDictionaryKey: "other") as? String
