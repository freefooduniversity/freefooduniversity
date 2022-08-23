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
                              "arkansasstate", "arkansastech", "centralarkansas", "southerncalifornia", "ucla", "berkeley", "fullerton", "northridge", "longbeach", "sandiego", "davis", "irvine", "boulder", "coloradostate", "coloradotech", "denver", "msudenver", "conneticut", "post", "yale", "central", "quinnipiac", "delaware", "wilmington", "delawaretech", "centralflorida", "fiu", "southflorida", "miamidade", "valencia", "fsu", "broward", "fau", "palmbeach", "gasouthern", "emory", "uwg", "hawaii", "boise", "idahostate", "idaho", "urbana", "uic", "devry", "northwestern", "ivytech", "purdue", "notredame", "iowastate", "iowa", "nebraskalincoln", "nebraskaomaha", "nebraskacc", "bellevue", "vegas", "southernnevada", "nevadareno", "snhu", "newhampshire", "dartmouth", "newbrunswick", "montclair", "rowan", "kean", "newark", "njit", "newmexico", "cnmcc", "nmstate", "nyu", "buffalo", "columbia", "stonybrook", "cunyhunter", "cornell", "suffolk", "cunyborough", "syracuse", "stjohns", "ncstate", "nccharlotte", "chapelhill", "eastcarolina", "waketech", "appalachian", "greensboro", "uncwilmington", "centralpiedmont", "duke", "northdakota", "ndsu", "oregonstate", "portland", "portlandcc", "oregon", "oaklahoma", "osu", "pennstate", "temple", "pitt", "upenn", "drexel", "ohiostate", "cincinnati", "kentstate", "ohiou", "brown", "rhodeisland"]
    
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
        if (college == "kansas") { return 38.9543 }
        if (college == "kansasstate") { return 39.1974 }
        if (college == "wichita") { return 37.7191 }
        if (college == "kentucky") { return 38.0307 }
        if (college == "louisville") { return 38.2123 }
        if (college == "lsu") { return 30.4133 }
        if (college == "lafayette") { return 30.2241 }
        if (college == "tulane") { return 29.9407 }
        if (college == "maine") { return 44.9019 }
        if (college == "maryland") { return 38.9869}
        if (college == "johnshopkins") { return 39.3299}
        if (college == "towson") { return 39.3925}
        if (college == "umass") { return 42.3868}
        if (college == "michstate") { return 42.7018}
        if (college == "wsu") { return 46.7319}
        if (college == "minnesota") { return 44.9740}
        if (college == "walden") { return 44.9812}
        if (college == "olemiss") { return 34.3647}
        if (college == "missstate") { return 33.4552}
        if (college == "mizzou") { return 38.9404}
        if (college == "missouristate") { return 37.2006}
        if (college == "montanastate") { return 45.6674}
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
        if (college == "newbrunswick") { return 40.50149 }
        if (college == "montclair") { return 40.86679 }
        if (college == "rowan") { return 39.71025 }
        if (college == "kean") { return 40.68043 }
        if (college == "newark") { return 40.74228 }
        if (college == "njit") { return 40.74263 }
        if (college == "newmexico") { return 35.08471 }
        if (college == "cnmcc") { return 35.07171 }
        if (college == "nmstate") { return 32.27966 }
        if (college == "nyu") { return 40.73040 }
        if (college == "buffalo") { return 43.00102 }
        if (college == "columbia") { return 40.80779 }
        if (college == "stonybrook") { return 40.90499 }
        if (college == "cunyhunter") { return 40.76827 }
        if (college == "cornell") { return 42.45531 }
        if (college == "suffolk") { return 40.79760 }
        if (college == "cunyborough") { return 40.71888 }
        if (college == "syracuse") { return 43.03934 }
        if (college == "stjohns") { return 40.62161 }
        if (college == "ncstate") { return 35.78502 }
        if (college == "nccharlotte") { return 35.30741 }
        if (college == "chapelhill") { return 35.90528 }
        if (college == "eastcarolina") { return 35.60709 }
        if (college == "waketech") { return 35.65202 }
        if (college == "appalachian") { return 36.21388 }
        if (college == "greensboro") { return 36.06623 }
        if (college == "wilmington") { return 34.22575 }
        if (college == "centralpiedmont") { return 35.21790 }
        if (college == "duke") { return 36.00165 }
        if (college == "northdakota") { return 47.92313 }
        if (college == "ndsu") { return 46.89806 }
        if (college == "oregonstate") { return 44.56399 }
        if (college == "portland") { return 45.51134 }
        if (college == "portlandcc") { return 45.43655 }
        if (college == "oregon") { return 44.04506 }
        if (college == "oaklahoma") { return 35.20613 }
        if (college == "osu") { return 36.12735 }
        if (college == "pennstate") { return 40.79846 }
        if (college == "temple") { return 39.98137 }
        if (college == "pitt") { return 40.44463 }
        if (college == "upenn") { return 39.95240 }
        if (college == "drexel") { return 39.95682 }
        if (college == "ohiostate") { return 40.00690 }
        if (college == "cincinnati") { return 39.13256 }
        if (college == "kentstate") { return 41.15005 }
        if (college == "ohiou") { return 39.32416 }
        if (college == "brown") { return 41.82681}
        if (college == "rhodeisland") { return 41.48621}
        if (college == "southcarolina") {return 33.99381}
        if (college == "charleston") {return 32.78821}
        if (college == "coastalcarolina") {return 33.79611}
        if (college == "southdakota") {return 42.78831}
        if (college == "southdakotastate") {return 44.31911}
        if (college == "augustana") {return 43.52241}
        if (college == "washington") {return 47.6553}
        if (college == "washingtonstate") {return 46.7319}
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
        if (college == "kansas") { return -95.2558 }
        if (college == "kansasstate") { return -96.5847}
        if (college == "wichita") { return -97.2899 }
        if (college == "kentucky") { return -84.5040 }
        if (college == "louisville") { return -85.7585 }
        if (college == "lsu") { return -91.1800 }
        if (college == "lafayette") { return -92.0198 }
        if (college == "tulane") { return -90.1203 }
        if (college == "maine") { return -68.6688}
        if (college == "maryland") { return -76.9426}
        if (college == "johnshopkins") { return -76.6205}
        if (college == "towson") { return -76.6126}
        if (college == "umass") { return -72.5301}
        if (college == "michstate") { return -84.4822}
        if (college == "wsu") { return -117.1542}
        if (college == "minnesota") { return -93.2277}
        if (college == "walden") { return -93.2658}
        if (college == "olemiss") { return -89.5384}
        if (college == "missstate") { return -88.7944}
        if (college == "mizzou") { return -92.3277}
        if (college == "missouristate") { return -93.2807}
        if (college == "montanastate") { return -111.0546}
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
        if (college == "newbrunswick") { return -74.44835 }
        if (college == "montclair") { return -74.19768 }
        if (college == "rowan") { return -75.11927 }
        if (college == "kean") { return -74.23320 }
        if (college == "newark") { return -74.17287 }
        if (college == "njit") { return -74.17933 }
        if (college == "newmexico") { return -106.61975 }
        if (college == "cnmcc") { return -106.62898 }
        if (college == "nmstate") { return -106.74914 }
        if (college == "nyu") { return -73.99646 }
        if (college == "buffalo") { return -78.78904 }
        if (college == "columbia") { return -73.96260 }
        if (college == "stonybrook") { return -73.12399 }
        if (college == "cunyhunter") { return -73.96461 }
        if (college == "cornell") { return -76.47445 }
        if (college == "suffolk") { return -73.27121 }
        if (college == "cunyborough") { return -74.01162 }
        if (college == "syracuse") { return -76.13524 }
        if (college == "stjohns") { return -74.09087 }
        if (college == "ncstate") { return -78.68215 }
        if (college == "nccharlotte") { return -80.735206 }
        if (college == "chapelhill") { return -79.04703 }
        if (college == "eastcarolina") { return -77.36654 }
        if (college == "waketech") { return -78.70475 }
        if (college == "appalachian") { return -81.68435 }
        if (college == "greensboro") { return -79.81204 }
        if (college == "wilmington") { return -77.87779 }
        if (college == "centralpiedmont") { return -80.83059 }
        if (college == "duke") { return -78.93828 }
        if (college == "northdakota") { return -97.07698 }
        if (college == "ndsu") { return -96.80254 }
        if (college == "oregonstate") { return -123.27949 }
        if (college == "portland") { return -122.68346 }
        if (college == "portlandcc") { return -122.72973 }
        if (college == "oregon") { return -123.07278 }
        if (college == "oaklahoma") { return -97.44586 }
        if (college == "osu") { return -97.07376 }
        if (college == "pennstate") { return -77.85998 }
        if (college == "temple") { return -75.15543 }
        if (college == "pitt") { return -79.96092 }
        if (college == "upenn") { return -75.19337 }
        if (college == "drexel") { return -75.18993 }
        if (college == "ohiostate") { return -83.03049 }
        if (college == "cincinnati") { return -84.51496 }
        if (college == "kentstate") { return -81.34339 }
        if (college == "ohiou") { return -82.10141 }
        if (college == "brown") {return -71.40251}
        if (college == "rhodeisland") {return -71.53071}
        if (college == "southcarolina") {return -81.02991}
        if (college == "charleston") {return -79.95911}
        if (college == "coastalcarolina") {return -79.01371}
        if (college == "southdakota") {return -96.92531}
        if (college == "southdakotastate") {return -96.78351}
        if (college == "augustana") {return 96.7394}
        if (college == "washington") {return -122.3035}
        if (college == "washingtonstate") {return -117.1542}
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
    if (state == "kansas") { return ["kansas", "kansasstate", "wichita", " ", " ", " ", " ", " ", " ", " "] }
    if (state == "kentucky") { return ["kentucky", "louisville", " ", " ", " ", " ", " ", " ", " ", " "] }
    if (state == "lousiana") { return ["lsu", "lafayette", "tulane", " ", " ", " ", " ", " ", " ", " "] }
    if (state == "maine") { return ["maine", " ", " ", " ", " ", " ", " ", " ", " ", " "] }
    if (state == "maryland") { return ["maryland", "johnshopkins", "towson", " ", " ", " ", " ", " ", " ", " "] }
    if (state == "massachussetts") { return ["harvard", "umass", " ", " ", " ", " ", " ", " ", " ", " "] }
    if (state == "michigan") { return ["michigan", "michstate", "wsu", " ", " ", " ", " ", " ", " ", " "]}
    if (state == "minnesota") { return ["minnesota", "walden", " ", " ", " ", " ", " ", " ", " ", " "] }
    if (state == "mississippi") { return ["olemiss", "missstate", " ", " ", " ", " ", " ", " ", " ", " "] }
    if (state == "missouri") { return ["mizzou", "missouristate", " ", " ", " ", " ", " ", " ", " ", " "] }
    if (state == "montana") { return ["montanastate", " ", " ", " ", " ", " ", " ", " ", " ", " "] }
    
    if (state == "nebraska") { return ["nebraskalincoln", "nebraskaomaha", "nebraskacc", "bellevue", " ", " ", " ", " ", " ", " "] }
    if (state == "nevada") { return ["vegas", "southernnevada", "nevadareno", " ", " ", " ", " ", " ", " ", " "] }
    if (state == "new hampshire") { return ["snhu", "newhampshire", "dartmouth", " ", " ", " ", " ", " ", " ", " "] }
    if (state == "new jersey") { return ["newbrunswick", "montclair", "rowan", "kean", "newark", "njit", " ", " ", " ", " "] }
    if (state == "new mexico") { return ["newmexico", "cnmcc", "nmstate", " ", " ", " ", " ", " ", " ", " "] }
    if (state == "new york") { return ["nyu", "buffalo", "columbia", "stonybrook", "cunyhunter", "cornell", "suffolk", "cunyborough", "syracuse", "stjohns"] }
    if (state == "north carolina") { return ["ncstate", "nccharlotte", "chapelhill", "eastcarolina", "waketech", "appalachian", "greensboro", "uncwilmington", "centralpiedmont", "duke"] }
    if (state == "north dakota") { return ["northdakota", "ndsu", " ", " ", " ", " ", " ", " ", " ", " "] }
    if (state == "ohio") { return ["ohiostate", "cincinnati", "kentstate", "ohiou", " ", " ", " ", " ", " ", " "] }
    if (state == "oklahoma") { return ["oaklahoma", "osu", " ", " ", " ", " ", " ", " ", " ", " "] }
    if (state == "oregon") { return ["oregonstate", "portland", "portlandcc", "oregon", " ", " ", " ", " ", " ", " "] }
    if (state == "pennsylvania") { return ["pennstate", "temple", "pitt", "upenn", "drexel", " ", " ", " ", " ", " "] }
    
    if (state == "rhode island") { return ["brown", "rhodeisland", " ", " ", " ", " ", " ", " ", " ", " "] }
    if (state == "south carolina") { return ["clemson", "southcarolina", "charleston", "coastalcarolina", " ", " ", " ", " ", " ", " "] }
    if (state == "south dakota") { return ["southdakota", "southdakotastate", "augustana", " ", " ", " ", " ", " ", " ", " "] }
    if (state == "tennessee") { return [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "] }
    if (state == "texas") { return [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "] }
    if (state == "utah") { return [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "] }
    if (state == "vermont") { return [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "] }
    if (state == "virginia") { return [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "] }
    if (state == "washington") { return ["washington", "washingtonstate", " ", " ", " ", " ", " ", " ", " ", " "] }
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
    return 6
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
    if (state == "iowa") { return 41.8780 }
    if (state == "kansas") { return 39.0119 }
    if (state == "kentucky") { return 37.8393 }
    if (state == "lousiana") { return 30.9843}
    if (state == "maine") { return 45.2538 }
    if (state == "maryland") { return 39.0458 }
    if (state == "massachussetts") { return 42.4072 }
    if (state == "michigan") { return 44.3148}
    if (state == "minnesota") { return 46.7296 }
    if (state == "mississippi") { return 32.3547}
    if (state == "missouri") { return 37.9643 }
    if (state == "montana") { return 46.8797 }
    if (state == "nebraska") { return 41.4925 }
    if (state == "nevada") { return 38.8026 }
    if (state == "new hampshire") { return 43.1939 }
    if (state == "new jersey") { return 40.0583 }
    if (state == "new mexico") { return 34.5199 }
    if (state == "new york") { return 40.7128}
    if (state == "north carolina") { return 35.7596 }
    if (state == "north dakota") { return 47.5515 }
    if (state == "ohio") { return 40.4173 }
    if (state == "oklahoma") { return 35.0078}
    if (state == "oregon") { return 43.8041 }
    if (state == "pennsylvania") { return 41.2033 }
    if (state == "rhode island") { return 41.5801 }
    if (state == "south carolina") { return 33.8361 }
    if (state == "south dakota") { return 43.9695 }
    if (state == "tennessee") { return 35.5175 }
    if (state == "texas") { return 31.9686 }
    if (state == "utah") { return 39.3210 }
    if (state == "vermont") { return 44.5588 }
    if (state == "virginia") { return 37.4316 }
    if (state == "washington") { return 47.7511 }
    if (state == "west virginia") { return 38.5976 }
    if (state == "winsconsin") { return 43.7844 }
    if (state == "wyoming") { return 43.0760 }
     
     
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
    if (state == "iowa") { return -93.0977 }
    if (state == "kansas") { return -98.4842 }
    if (state == "kentucky") { return -84.2700 }
    if (state == "lousiana") { return -91.9623 }
    if (state == "maine") { return -69.4455 }
    if (state == "maryland") { return -76.6413 }
    if (state == "massachussetts") { return -71.3824 }
    if (state == "michigan") { return -85.6024 }
    if (state == "minnesota") { return -94.6859 }
    if (state == "mississippi") { return -89.3985 }
    if (state == "missouri") { return -91.8318 }
    if (state == "montana") { return -110.3626 }
    if (state == "nebraska") { return -99.9018 }
    if (state == "nevada") { return -116.4194 }
    if (state == "new hampshire") { return -71.5724 }
    if (state == "new jersey") { return -74.4057 }
    if (state == "new mexico") { return -105.8701 }
    if (state == "new york") { return -74.0060 }
    if (state == "north carolina") { return -79.0193 }
    if (state == "north dakota") { return -101.0020 }
    if (state == "ohio") { return -82.9071 }
    if (state == "oklahoma") { return -97.0929 }
    if (state == "oregon") { return -120.5542 }
    if (state == "pennsylvania") { return -77.1945 }
    if (state == "rhode island") { return -71.4774 }
    if (state == "south carolina") { return -81.1637}
    if (state == "south dakota") { return -99.9018 }
    if (state == "tennessee") { return -86.5804 }
    if (state == "texas") { return -99.9018 }
    if (state == "utah") { return -111.0937 }
    if (state == "vermont") { return -72.5778 }
    if (state == "virginia") { return -78.6569 }
    if (state == "washington") { return -120.7401 }
    if (state == "west virginia") { return -80.4549 }
    if (state == "winsconsin") { return -88.7879 }
    if (state == "wyoming") { return -107.2903  }
     
     
    return 83.0
}
