//
//  FreeFoodUniversityApp.swift
//  FreeFoodUniversity
//
//  Created by Stephen Nemeth on 6/5/22.
//

import GoogleMaps
import SwiftUI
import FirebaseAuthUI

//Can't leave credentials open like this, will change APIKey and fix later
var APIKey: String = "AIzaSyCgBb4hG2hijjScdCmZy6jKm2K8_VAgq3Q"

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

class AppDelegate: UIResponder, UIApplicationDelegate, GMSMapViewDelegate{
     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
         GMSServices.provideAPIKey(APIKey)
         FirebaseApp.configure()
         let authUI = FUIAuth.defaultAuthUI()
         // You need to adopt a FUIAuthDelegate protocol to receive callback
         authUI?.delegate = self
         return true
     }
    
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        print("you tapped something")
        return true
    }
 }
 
