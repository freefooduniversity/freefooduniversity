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
    var end_time: Int32
    var start_time : String
    var time_zone: Int
    var college : String
    var capacity : Int32
    var dibs : Int32
    var likes : Int32
    var dislikes : Int32
    var creator_email : String
    var pic_url : String
    var building : String
    var event: String
    var additional_info: String
}
