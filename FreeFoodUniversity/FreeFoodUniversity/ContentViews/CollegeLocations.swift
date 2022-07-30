//
//  CollegeLocations.swift
//  FreeFoodUniversity
//
//  Created by William Sirotkin on 7/12/22.
//

import Foundation

struct CollegeLocations {
    
    var colleges: [String] = ["uga", "clemson", "gt", "bama", "florida", "gastate", "ksu", "michigan", "usc", "harvard"]
    
    var DEFAULT_LAT: Double = 37.0902
    var DEFAULT_LONG: Double = -95.7129
    var DEFAULT_ZOOM: Float = 15.0
    
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
        return DEFAULT_LAT
    }

    func getLong(college: String) -> Double {
        if (college == "uga") { return -83.3773 }
        if (college == "clemson") { return -82.8374 }
        if (college == "gt") { return -84.3963 }
        if (college == "bama") { return -87.5391 }
        if (college == "florida") { return -82.3549 }
        if (college == "gastate") { return -84.3853 }
        if (college == "ksu") { return -84.5827 }
        if (college == "michigan") { return -83.7382 }
        if (college == "usc") { return -118.2851 }
        if (college == "harvard") { return -71.1167 }
        return DEFAULT_LONG
    }
    
    func getZoom(college: String) -> Float {
        if (college == "uga") { return 14.8 }
        if (college == "clemson") { return 15}
        if (college == "gt") { return 15 }
        if (college == "bama") { return 15 }
        if (college == "florida") { return 15 }
        if (college == "gastate") { return 15 }
        if (college == "ksu") { return 15 }
        if (college == "michigan") { return 15.8 }
        if (college == "usc") { return 15 }
        if (college == "harvard") { return 15 }
        return DEFAULT_ZOOM
    }
    
    func getState(college: String) -> String {
        if (college == "uga") { return "georgia" }
        if (college == "clemson") { return "south-carolina"}
        if (college == "gt") { return "georgia" }
        if (college == "bama") { return "alabama" }
        if (college == "florida") { return "florida" }
        if (college == "gastate") { return "georgia" }
        if (college == "ksu") { return "georgia" }
        if (college == "michigan") { return "michigan" }
        if (college == "usc") { return "california" }
        if (college == "harvard") { return "massachusetts" }
        return "georgia"
    }
    
    
    
    //Lat + Long. Used for nearest college to person with good accuracy
    func closestCollege(lat: Double, long: Double) -> String {
        var nearestDistance: Double = 10000
        var nearestCollege: String = "uga"
        var distance: Double
        for i in 0 ... colleges.count - 1 {
            distance = abs(getLat(college: colleges[i]) + getLong(college: colleges[i]) - lat - long)
            if (distance < nearestDistance) {
                nearestCollege = colleges[i]
                nearestDistance = distance
            }
        }
        return nearestCollege
    }
}
