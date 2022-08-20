//
//  Users.swift
//  FreeFoodUniversity
//
//  Created by William Sirotkin on 8/20/22.
//

import Foundation

struct User: Codable, Identifiable {
    var id: Int
    var email: String
    var likes: Int
    var dislikes: Int
    var banned_status: Int
    var num_ppl_fed: Int
    var active_marker_id: Int
}
