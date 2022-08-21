//
//  CollegeLocations.swift
//  FreeFoodUniversity
//
//  Created by William Sirotkin on 7/12/22.
//

import Foundation

struct CollegeLocations {
    
    var colleges: [String] = ["uga", "clemson", "gt", "bama", "florida", "gastate", "ksu", "michigan", "usc", "harvard", "auburn", "alabamastate", "alabamaa&m",
        "uabbirmingham", "arizonatucson", "arizonastate", "northernarizona", "alaskaanchorage", "alaskafairbanks", "alaskasoutheast", "arkansas",
                              "arkansasstate", "arkansastech", "centralarkansas", "southerncalifornia", "ucla", "berkeley", "fullerton", "northridge", "longbeach", "sandiego", "davis", "irvine", "boulder", "coloradostate", "coloradotech", "denver", "msudenver", "conneticut", "post", "yale", "central", "quinnipiac", "delaware", "wilmington", "delawaretech", "centralflorida", "fiu", "southflorida", "miamidade", "valencia", "fsu", "broward", "fau", "palmbeach", "gasouthern", "emory", "uwg", "hawaii", "boise", "idahostate", "idaho", "urbana", "uic", "devry", "northwestern", "ivytech", "purdue", "notredame", "iowastate", "iowa", "nebraskalincoln", "nebraskaomaha", "nebraskacc", "bellevue", "vegas", "southernnevada", "nevadareno", "snhu", "newhampshire", "dartmouth"]
    
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
        if (college == "auburn") { return 32.59360 }
        if (college == "alabamastate") { return 32.36328 }
        if (college == "alabamaa&m") { return 34.78427 }
        if (college == "uabbirmingham") { return 33.49770 }
        if (college == "arizonatucson") { return 32.23214 }
        if (college == "arizonastate") { return 33.42449 }
        if (college == "northernarizona") { return 35.18089 }
        if (college == "alaskaanchorage") { return 61.19127 }
        if (college == "alaskafairbanks") { return 64.85618 }
        if (college == "alaskasoutheast") { return 58.38526 }
        if (college == "arkansas") { return 36.06896 }
        if (college == "arkansasstate") { return 35.84339 }
        if (college == "arkansastech") { return 35.29410 }
        if (college == "centralarkansas") { return 35.07843 }
        if (college == "southerncalifornia") { return 34.02271 }
        if (college == "ucla") { return 34.06921 }
        if (college == "berkeley") { return 37.87226 }
        if (college == "fullerton") { return 33.88290 }
        if (college == "northridge") { return 34.24113 }
        if (college == "longbeach") { return 33.78425 }
        if (college == "sandiego") { return 32.87926 }
        if (college == "davis") { return 38.53860 }
        if (college == "irvine") { return 33.64096 }
        if (college == "boulder") { return 40.01061 }
        if (college == "coloradostate") { return 40.57367 }
        if (college == "coloradotech") { return 38.89512 }
        if (college == "denver") { return 39.74678 }
        if (college == "msudenver") { return 39.74363 }
        if (college == "conneticut") { return 41.80931 }
        if (college == "post") { return 41.53749 }
        if (college == "yale") { return 41.31723 }
        if (college == "central") { return 41.69463 }
        if (college == "quinnipiac") { return 41.41976 }
        if (college == "delaware") { return 39.67878 }
        if (college == "wilmington") { return 39.68429 }
        if (college == "delawaretech") { return 39.68992 }
        if (college == "centralflorida") { return 28.60499 }
        if (college == "fiu") { return 25.75752 }
        if (college == "southflorida") { return 28.05969 }
        if (college == "miamidade") { return 25.87882 }
        if (college == "valencia") { return 28.52272 }
        if (college == "fsu") { return 30.44277 }
        if (college == "broward") { return 26.08337 }
        if (college == "fau") { return 26.37633 }
        if (college == "palmbeach") { return 26.38205 }
        if (college == "gasouthern") { return 32.42074 }
        if (college == "emory") { return 33.79269 }
        if (college == "uwg") { return 33.57628 }
        if (college == "hawaii") { return 21.30202 }
        if (college == "byu") { return 43.81508 }
        if (college == "boise") { return 43.60368 }
        if (college == "idahostate") { return 43.62058 }
        if (college == "idaho") { return 46.72949 }
        if (college == "urbana") { return 40.10300 }
        if (college == "uic") { return 41.86971 }
        if (college == "devry") { return 41.88099 }
        if (college == "northwestern") { return 42.05713 }
        if (college == "ivytech") { return 41.43725 }
        if (college == "purdue") { return 40.42442 }
        if (college == "notredame") { return 41.70447 }
        if (college == "iowastate") { return 42.02739 }
        if (college == "iowa") { return 41.66341 }
        if (college == "nebraskalincoln") { return 40.82098 }
        if (college == "nebraskaomaha") { return 41.25829 }
        if (college == "nebraskacc") { return 41.20722 }
        if (college == "bellevue") { return 41.15077 }
        if (college == "vegas") { return 36.10777 }
        if (college == "southernnevada") { return 36.15615 }
        if (college == "nevadareno") { return 39.54395 }
        if (college == "snhu") { return 43.03848 }
        if (college == "newhampshire") { return 43.13921 }
        if (college == "dartmouth") { return 43.70467 }
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
        if (college == "auburn") { return -85.49519 }
        if (college == "alabamastate") { return -86.29387 }
        if (college == "alabamaa&m") { return -86.57223 }
        if (college == "uabbirmingham") { return -86.80019 }
        if (college == "arizonatucson") { return -110.95012 }
        if (college == "arizonastate") { return -111.92810 }
        if (college == "northernarizona") { return -111.65403 }
        if (college == "alaskaanchorage") { return -149.81966 }
        if (college == "alaskafairbanks") { return -147.83422 }
        if (college == "alaskasoutheast") { return -134.64053 }
        if (college == "arkansas") { return -94.17497 }
        if (college == "arkansasstate") { return -90.67496 }
        if (college == "arkansastech") { return -93.13614 }
        if (college == "centralarkansas") { return -92.45798 }
        if (college == "southerncalifornia") { return -118.28524 }
        if (college == "ucla") { return -118.44522 }
        if (college == "berkeley") { return -122.25860 }
        if (college == "fullerton") { return -117.88518 }
        if (college == "northridge") { return -118.53006 }
        if (college == "longbeach") { return -118.11414 }
        if (college == "sandiego") { return -117.23599 }
        if (college == "davis") { return -121.76173 }
        if (college == "irvine") { return -117.84439 }
        if (college == "boulder") { return -105.22641 }
        if (college == "coloradostate") { return -105.08661 }
        if (college == "coloradotech") { return -104.85619 }
        if (college == "denver") { return -105.00235 }
        if (college == "msudenver") { return -105.00557 }
        if (college == "conneticut") { return -72.25428 }
        if (college == "post") { return -73.08175 }
        if (college == "yale") { return -72.92247 }
        if (college == "central") { return -72.76419 }
        if (college == "quinnipiac") { return -72.89412 }
        if (college == "delaware") { return -75.75091 }
        if (college == "wilmington") { return -75.58669 }
        if (college == "delawaretech") { return -75.64889 }
        if (college == "centralflorida") { return -81.20019 }
        if (college == "fiu") { return -80.37584 }
        if (college == "southflorida") { return -82.41411 }
        if (college == "miamidade") { return -80.24638 }
        if (college == "valencia") { return -81.46594 }
        if (college == "fsu") { return -84.29870 }
        if (college == "broward") { return -80.23448 }
        if (college == "fau") { return -80.10106 }
        if (college == "palmbeach") { return -80.09916 }
        if (college == "gasouthern") { return -81.78442 }
        if (college == "emory") { return -84.32542 }
        if (college == "uwg") { return -85.10447 }
        if (college == "hawaii") { return -157.81508 }
        if (college == "byu") { return -111.78334 }
        if (college == "boise") { return -116.20009 }
        if (college == "idahostate") { return -116.19047 }
        if (college == "idaho") { return -117.01265 }
        if (college == "urbana") { return -88.22750 }
        if (college == "uic") { return -87.64888 }
        if (college == "devry") { return -87.63389 }
        if (college == "northwestern") { return -87.67544 }
        if (college == "ivytech") { return -87.33414 }
        if (college == "purdue") { return -86.92128 }
        if (college == "notredame") { return -86.23535 }
        if (college == "iowastate") { return -93.64679 }
        if (college == "iowa") { return -91.55493 }
        if (college == "nebraskalincoln") { return -96.70132 }
        if (college == "nebraskaomaha") { return -96.01077 }
        if (college == "nebraskacc") { return -95.95745 }
        if (college == "bellevue") { return -95.91820 }
        if (college == "vegas") { return -115.14356 }
        if (college == "southernnevada") { return -115.23228 }
        if (college == "nevadareno") { return -119.81425 }
        if (college == "snhu") { return -71.44948 }
        if (college == "newhampshire") { return -70.93712 }
        if (college == "dartmouth") { return -72.28877 }
        return DEFAULT_LONG
    }
    
    func getZoom(college: String) -> Float {
        return 14
        /*
        if (college == "uga") { return 13.5 }
        if (college == "clemson") { return 15}
        if (college == "gt") { return 14.5 }
        if (college == "bama") { return 15 }
        if (college == "florida") { return 15 }
        if (college == "gastate") { return 15 }
        if (college == "ksu") { return 15 }
        if (college == "michigan") { return 15.8 }
        if (college == "usc") { return 15 }
        if (college == "harvard") { return 15 }
        if (college == "auburn") { return 15 }
        if (college == "alabamastate") { return 14.7 }
        if (college == "alabamaa&m") { return 14.7 }
        if (college == "uabbirmingham") { return 14.7 }
        if (college == "arizonatucson") { return 14.7 }
        if (college == "arizonastate") { return 14.7 }
        if (college == "northernarizona") { return 14.7 }
        if (college == "alaskaanchorage") { return 14.7 }
        if (college == "alaskafairbanks") { return 14.7 }
        if (college == "alaskasoutheast") { return 14.7 }
        if (college == "arkansas") { return 14.7 }
        if (college == "arkansasstate") { return 14.7 }
        if (college == "arkansastech") { return 14.7 }
        if (college == "centralarkansas") { return 14.7 }
        if (college == "southerncalifornia") { return 14.7 }
        if (college == "ucla") { return 14.7 }
        if (college == "berkeley") { return 14.7 }
        if (college == "fullerton") { return 14.7 }
        if (college == "northridge") { return 14.7 }
        if (college == "longbeach") { return 14.7 }
        if (college == "sandiego") { return 14.7 }
        if (college == "davis") { return 14.7 }
        if (college == "irvine") { return 14.7 }
        if (college == "boulder") { return 14.7 }
        if (college == "coloradostate") { return 14.7 }
        if (college == "coloradotech") { return 14.7 }
        if (college == "denver") { return 14.7 }
        if (college == "msudenver") { return 14.7 }
        if (college == "conneticut") { return 14.5 }
        if (college == "post") { return 14.7 }
        if (college == "yale") { return 14.7 }
        if (college == "central") { return 14.7 }
        if (college == "quinnipiac") { return 14.7 }
        if (college == "delaware") { return 14.7 }
        if (college == "wilmington") { return 14.7 }
        if (college == "delawaretech") { return 14.7 }
        if (college == "centralflorida") { return 14.7 }
        if (college == "fiu") { return 14.7 }
        if (college == "southflorida") { return 14.7 }
        if (college == "miamidade") { return 14.7 }
        if (college == "valencia") { return 14.7 }
        if (college == "fsu") { return 14.7 }
        if (college == "broward") { return 14.7 }
        if (college == "fau") { return 14.7 }
        if (college == "palmbeach") { return 14.7 }
        if (college == "gasouthern") { return 14.7 }
        if (college == "emory") { return 14.7 }
        if (college == "uwg") { return 14.7 }
        if (college == "hawaii") { return 14.7 }
        if (college == "byu") { return 14.7 }
        if (college == "boise") { return 14.7 }
        if (college == "idahostate") { return 14.7 }
        if (college == "idaho") { return 14.7 }
        if (college == "urbana") { return 14.7 }
        if (college == "uic") { return 14.7 }
        if (college == "devry") { return 14.7 }
        if (college == "northwestern") { return 14.7 }
        if (college == "ivytech") { return 14.7 }
        if (college == "purdue") { return 14.7 }
        if (college == "notredame") { return 14.7 }
        if (college == "iowastate") { return 14.7 }
        if (college == "iowa") { return 14.7 }
        if (college == "nebraskalincoln") { return 14.5 }
        if (college == "nebraskaomaha") { return 14.7 }
        if (college == "nebraskacc") { return 14.7 }
        if (college == "bellevue") { return 14.7 }
        if (college == "vegas") { return 14.7 }
        if (college == "southernnevada") { return 14.7 }
        if (college == "nevadareno") { return 14.7 }
        return DEFAULT_ZOOM
         */
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
    if (state == "alabama") { return ["bama", "auburn", "alabamastate", "alabamaa&m", "uabbirmingham", " ", " ", " ", " ", " "] }
    if (state == "alaska") { return ["alaskaanchorage", "alaskafairbanks", "alaskasoutheast", " ", " ", " ", " ", " ", " ", " "] }
    if (state == "arizona") { return ["arizonatucson", "arizonastate", "northernarizona", " ", " ", " ", " ", " ", " ", " "] }
    if (state == "arkansas") { return ["arkansas", "arkansasstate", "arkansastech", "centralarkansas", " ", " ", " ", " ", " ", " "] }
    if (state == "california") { return ["usc", "southerncalifornia", "ucla", "berkeley", "fullerton", "northridge", "longbeach", "sandiego", "davis", "irvine"] }
    if (state == "colorado") { return ["boulder", "coloradostate", "coloradotech", "denver", "msudenver", " ", " ", " ", " ", " "] }
    if (state == "conneticut") { return ["conneticut", "post", "yale", "central", "quinnipiac", " ", " ", " ", " ", " "] }
    if (state == "delaware") { return ["delaware", "wilmington", "delawaretech", " ", " ", " ", " ", " ", " ", " "] }
    if (state == "florida") { return ["florida", "centralflorida", "fiu", "southflorida", "miamidade", "valencia", "fsu", "broward", "fau", "palmbeach"] }
    if (state == "georgia") { return ["uga", "gt", "ksu", "gastate", "gasouthern", "emory", "uwg", " ", " ", " "] }
    if (state == "hawaii") { return ["hawaii", " ", " ", " ", " ", " ", " ", " ", " ", " "] }
    if (state == "idaho") { return ["byu", "boise", "idahostate", "idaho", " ", " ", " ", " ", " ", " "] }
    if (state == "illinois") { return ["urbana", "uic", "devry", "northwestern", " ", " ", " ", " ", " ", " "] }
    if (state == "indiana") { return ["ivytech", "purdue", "notredame", " ", " ", " ", " ", " ", " ", " "] }
    if (state == "iowa") { return ["iowastate", "iowa", " ", " ", " ", " ", " ", " ", " ", " "] }
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
    
    if (state == "nebraska") { return ["nebraskalincoln", "nebraskaomaha", "nebraskacc", "bellevue", " ", " ", " ", " ", " ", " "] }
    if (state == "nevada") { return ["vegas", "southernnevada", "nevadareno", " ", " ", " ", " ", " ", " ", " "] }
    if (state == "new hampshire") { return ["snhu", "newhampshire", "dartmouth", " ", " ", " ", " ", " ", " ", " "] }
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
    return ["uga", "bama", "gt", "clemson", "florida", "michigan", "ksu", "gastate", "usc", "harvard"]
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
    if (state == "hawaii") { return 7.2 }
    if (state == "idaho") { return 6.1 }
    if (state == "illinois") { return 6.3 }
    if (state == "indiana") { return 6.3 }
    /*
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
     if (state == "hawaii") { return 19.8968 }
     if (state == "idaho") { return 44.0682 }
    if (state == "illinois") { return 40.6331 }
    if (state == "indiana") { return 40.2672 }
    /*
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
     if (state == "hawaii") { return -156.5828 }
    if (state == "idaho") { return -114.7420 }
    if (state == "illinois") { return -89.3985 }
    if (state == "indiana") { return -86.1349 }
    /*
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
