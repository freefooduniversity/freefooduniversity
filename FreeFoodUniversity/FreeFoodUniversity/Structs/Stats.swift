//
//  Stats.swift
//  FreeFoodUniversity
//
//  Created by Stephen Nemeth on 8/12/22.
//

import Foundation

struct Stats: Codable, Identifiable {
    var id: Int
    var food_events: Int
    var fed_today: Int
    var fed_all_time: Int
}
