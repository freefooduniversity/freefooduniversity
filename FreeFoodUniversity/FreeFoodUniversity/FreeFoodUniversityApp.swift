//
//  FreeFoodUniversityApp.swift
//  FreeFoodUniversity
//
//  Created by Stephen Nemeth on 6/5/22.
//

import GoogleMaps
import SwiftUI
import FirebaseAuthUI
import FirebaseUI
import FirebaseCore
import FirebaseOAuthUI

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

class AppDelegate: UIResponder, UIApplicationDelegate, GMSMapViewDelegate, FUIAuthDelegate{
     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
         GMSServices.provideAPIKey(APIKey)
         FirebaseApp.configure()
         let authUI = FUIAuth.defaultAuthUI()
         // You need to adopt a FUIAuthDelegate protocol to receive callback
         authUI?.delegate = self
         let providers: [FUIAuthProvider] = [
           FUIGoogleAuth(),
         ]
         self.authUI?.providers = providers
         return true
    }
    
    func application(_ app: UIApplication, open url: URL,
                     options: [UIApplication.OpenURLOptionsKey : Any]) -> Bool {
        let sourceApplication = options[UIApplication.OpenURLOptionsKey.sourceApplication] as! String?
      if FUIAuth.defaultAuthUI()?.handleOpen(url, sourceApplication: sourceApplication) ?? false {
        return true
      }
      // other URL handling goes here.
      return false
    }
    
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        print("you tapped something")
        return true
    }
 }
 
