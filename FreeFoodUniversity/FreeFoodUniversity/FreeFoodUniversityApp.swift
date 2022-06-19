//
//  FreeFoodUniversityApp.swift
//  FreeFoodUniversity
//
//  Created by Stephen Nemeth on 6/5/22.
//

import GoogleMaps
import SwiftUI

let APIKey = "AIzaSyCgBb4hG2hijjScdCmZy6jKm2K8_VAgq3Q"

@main
struct FreeFoodUniversityApp: App {
    let persistenceController = PersistenceController.shared
//  @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

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
/*
class AppDelegate: NSObject, UIApplicationDelegate    {
     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
         GMSServices.provideAPIKey(APIKey)
         return true
     }
 }
 */
