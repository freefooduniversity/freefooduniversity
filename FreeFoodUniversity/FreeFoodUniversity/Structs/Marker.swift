//
//  Marker.swift
//  FreeFoodUniversity
//
//  Created by Stephen Nemeth on 8/12/22.
//

import Foundation

struct Marker: Codable, Identifiable {
    var id: Int
    var food: String
    var lat: Double
    var long: Double
}
