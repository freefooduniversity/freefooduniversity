//
//  GoogleMapsView.swift
//  FreeFoodUniversity
//
//  Created by Stephen Nemeth on 8/12/22.
//

import Foundation
import SwiftUI
import GoogleMaps

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
             uiView.clear()
//            let marker : GMSMarker = GMSMarker()
//            marker.position = CLLocationCoordinate2D(latitude: 33.9480, longitude: -83.3773 )
//            marker.title = ""
//            marker.snippet = "Welcome to Hello World"
//            marker.icon = UIImage(named: "burger")!.withRenderingMode(.alwaysTemplate)
            if (marker.count > 0) {
                for i in 0 ... marker.count - 1 {
                        marker[i].map = uiView
                }
            }
        }
 }
