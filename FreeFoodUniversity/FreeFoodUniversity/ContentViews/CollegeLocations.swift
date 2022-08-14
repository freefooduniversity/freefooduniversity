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

// Use this function to get colleges for select state drop down menu results
// Max 10 colleges per state
func getCollegesByState(selectedState: String) -> [String] {
    var state = selectedState.lowercased()
    if (state == "alabama") { return ["bama", " ", " ", " ", " ", " ", " ", " ", " ", " "] }
    if (state == "alaska") { return [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "] }
    if (state == "arizona") { return [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "] }
    if (state == "arkansas") { return [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "] }
    if (state == "california") { return ["usc", " ", " ", " ", " ", " ", " ", " ", " ", " "] }
    if (state == "colorado") { return [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "] }
    if (state == "conneticut") { return [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "] }
    if (state == "delaware") { return [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "] }
    if (state == "florida") { return ["florida", " ", " ", " ", " ", " ", " ", " ", " ", " "] }
    if (state == "georgia") { return ["uga", "gt", "ksu", "gastate", " ", " ", " ", " ", " ", " "] }
    if (state == "hawaii") { return [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "] }
    if (state == "idaho") { return [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "] }
    if (state == "illinois") { return [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "] }
    if (state == "indiana") { return [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "] }
    if (state == "iowa") { return [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "] }
    if (state == "kansas") { return [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "] }
    if (state == "kentucky") { return [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "] }
    if (state == "lousiana") { return [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "] }
    if (state == "maine") { return [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "] }
    if (state == "maryland") { return [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "] }
    if (state == "massachussetts") { return ["harvard", " ", " ", " ", " ", " ", " ", " ", " ", " "] }
    if (state == "michigan") { return ["michigan", " ", " ", " ", " ", " ", " ", " ", " ", " "]}
    if (state == "minnesota") { return [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "] }
    if (state == "mississippi") { return [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "] }
    if (state == "missouri") { return [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "] }
    if (state == "montana") { return [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "] }
    if (state == "nebraska") { return [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "] }
    if (state == "nevada") { return [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "] }
    if (state == "new hampshire") { return [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "] }
    if (state == "new jersey") { return [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "] }
    if (state == "new mexico") { return [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "] }
    if (state == "new york") { return [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "] }
    if (state == "north carolina") { return [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "] }
    if (state == "north dakota") { return [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "] }
    if (state == "ohio") { return [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "] }
    if (state == "oklahoma") { return [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "] }
    if (state == "oregon") { return [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "] }
    if (state == "pennsylvania") { return [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "] }
    if (state == "rhode island") { return [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "] }
    if (state == "south carolina") { return ["clemson", " ", " ", " ", " ", " ", " ", " ", " ", " "] }
    if (state == "south dakota") { return [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "] }
    if (state == "tennessee") { return [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "] }
    if (state == "texas") { return [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "] }
    if (state == "utah") { return [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "] }
    if (state == "vermont") { return [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "] }
    if (state == "virginia") { return [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "] }
    if (state == "washington") { return [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "] }
    if (state == "west virginia") { return [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "] }
    if (state == "wisconsin") { return [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "] }
    if (state == "wyoming") { return [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "] }
    return ["uga", "clemson", "gt", "bama", "florida", "michigan", "ksu", "gastate", "usc", "harvard"]
}

func getStateZoom(selectedState: String) -> Float {
    var state = selectedState.lowercased()
    
    if (state == "alabama") { return 6.5 }
    if (state == "alaska") { return 4 }
    if (state == "arizona") { return 6.3 }
    if (state == "arkansas") { return 6.5 }
    if (state == "california") { return 5.6 }
    if (state == "colorado") { return 6.1}
    if (state == "conneticut") { return 7.7 }
    if (state == "delaware") { return 7.7 }
    if (state == "florida") { return 6 }
    if (state == "georgia") { return 6.4 }
    /*
    if (state == "hawaii") { return [] }
    if (state == "idaho") { return [] }
    if (state == "illinois") { return [] }
    if (state == "indiana") { return [] }
    if (state == "iowa") { return [] }
    if (state == "kansas") { return [] }
    if (state == "kentucky") { return [] }
    if (state == "lousiana") { return [] }
    if (state == "maine") { return [] }
    if (state == "maryland") { return [] }
    if (state == "massachussetts") { return ["harvard"] }
    if (state == "michigan") { return ["michigan"] }
    if (state == "minnesota") { return [] }
    if (state == "mississippi") { return [] }
    if (state == "missouri") { return [] }
    if (state == "montana") { return [] }
    if (state == "nebraska") { return [] }
    if (state == "nevada") { return [] }
    if (state == "new hampshire") { return [] }
    if (state == "new jersey") { return [] }
    if (state == "new mexico") { return [] }
    if (state == "new york") { return [] }
    if (state == "north carolina") { return [] }
    if (state == "north dakota") { return [] }
    if (state == "ohio") { return [] }
    if (state == "oklahoma") { return [] }
    if (state == "oregon") { return [] }
    if (state == "pennsylvania") { return [] }
    if (state == "rhode island") { return [] }
    if (state == "south carolina") { return ["clemson"] }
    if (state == "south dakota") { return [] }
    if (state == "tennessee") { return [] }
    if (state == "texas") { return [] }
    if (state == "utah") { return [] }
    if (state == "vermont") { return [] }
    if (state == "virginia") { return [] }
    if (state == "washington") { return [] }
    if (state == "west virginia") { return [] }
    if (state == "wisconsin") { return [] }
    if (state == "wyoming") { return [] }
     */
    return 1.0
}

func getStateLat(selectedState: String) -> Double {
    var state = selectedState.lowercased()
    if (state == "alabama") { return 32.3182 }
    if (state == "alaska") { return 64.2008 }
    if (state == "arizona") { return 34.0489 }
    if (state == "arkansas") {return 34.5574 }
    if (state == "california") {return 36.7783 }
    if (state == "colorado") { return 39.5501 }
    if (state == "conneticut") { return 41.6032 }
    if (state == "delaware") { return 38.9108 }
    if (state == "florida") { return 28.8648 }
    if (state == "georgia") { return 32.1656 }
    /*
     if (state == "hawaii") { return [] }
     if (state == "idaho") { return [] }
     if (state == "illinois") { return [] }
     if (state == "indiana") { return [] }
     if (state == "iowa") { return [] }
     if (state == "kansas") { return [] }
     if (state == "kentucky") { return [] }
     if (state == "lousiana") { return [] }
     if (state == "maine") { return [] }
     if (state == "maryland") { return [] }
     if (state == "massachussetts") { return ["harvard"] }
     if (state == "michigan") { return ["michigan"] }
     if (state == "minnesota") { return [] }
     if (state == "mississippi") { return [] }
     if (state == "missouri") { return [] }
     if (state == "montana") { return [] }
     if (state == "nebraska") { return [] }
     if (state == "nevada") { return [] }
     if (state == "new hampshire") { return [] }
     if (state == "new jersey") { return [] }
     if (state == "new mexico") { return [] }
     if (state == "new york") { return [] }
     if (state == "north carolina") { return [] }
     if (state == "north dakota") { return [] }
     if (state == "ohio") { return [] }
     if (state == "oklahoma") { return [] }
     if (state == "oregon") { return [] }
     if (state == "pennsylvania") { return [] }
     if (state == "rhode island") { return [] }
     if (state == "south carolina") { return ["clemson"] }
     if (state == "south dakota") { return [] }
     if (state == "tennessee") { return [] }
     if (state == "texas") { return [] }
     if (state == "utah") { return [] }
     if (state == "vermont") { return [] }
     if (state == "virginia") { return [] }
     if (state == "washington") { return [] }
     if (state == "west virginia") { return [] }
     if (state == "wisconsin") { return [] }
     if (state == "wyoming") { return [] }
     */
     
    return -30.0
}

func getStateLong(selectedState: String) -> Double {
    var state = selectedState.lowercased()
    
    if (state == "alabama") { return -86.9023}
    if (state == "alaska") { return -152.4937 }
    if (state == "arizona") { return -112.0937 }
     if (state == "arkansas") { return -92.2863 }
    if (state == "california") { return -119.4179 }
    if (state == "colorado") { return -105.7821 }
    if (state == "conneticut") { return -72.8877 }
    if (state == "delaware") { return -75.5277 }
    if (state == "florida") { return -83.4158 }
    if (state == "georgia") { return -82.9001 }
    /*
     if (state == "hawaii") { return [] }
     if (state == "idaho") { return [] }
     if (state == "illinois") { return [] }
     if (state == "indiana") { return [] }
     if (state == "iowa") { return [] }
     if (state == "kansas") { return [] }
     if (state == "kentucky") { return [] }
     if (state == "lousiana") { return [] }
     if (state == "maine") { return [] }
     if (state == "maryland") { return [] }
     if (state == "massachussetts") { return ["harvard"] }
     if (state == "michigan") { return ["michigan"] }
     if (state == "minnesota") { return [] }
     if (state == "mississippi") { return [] }
     if (state == "missouri") { return [] }
     if (state == "montana") { return [] }
     if (state == "nebraska") { return [] }
     if (state == "nevada") { return [] }
     if (state == "new hampshire") { return [] }
     if (state == "new jersey") { return [] }
     if (state == "new mexico") { return [] }
     if (state == "new york") { return [] }
     if (state == "north carolina") { return [] }
     if (state == "north dakota") { return [] }
     if (state == "ohio") { return [] }
     if (state == "oklahoma") { return [] }
     if (state == "oregon") { return [] }
     if (state == "pennsylvania") { return [] }
     if (state == "rhode island") { return [] }
     if (state == "south carolina") { return ["clemson"] }
     if (state == "south dakota") { return [] }
     if (state == "tennessee") { return [] }
     if (state == "texas") { return [] }
     if (state == "utah") { return [] }
     if (state == "vermont") { return [] }
     if (state == "virginia") { return [] }
     if (state == "washington") { return [] }
     if (state == "west virginia") { return [] }
     if (state == "wisconsin") { return [] }
     if (state == "wyoming") { return [] }
     */
     
    return 83.0
}
