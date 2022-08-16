//
//  Utility.swift
//  FreeFoodUniversity
//
//  Created by Stephen Nemeth on 8/12/22.
//

import Foundation

var Markers: [Marker] = []

func getStats(completion: @escaping (Stats) -> (), college: String) {
    guard let url = URL(string: "https://free-food-university.azurewebsites.net/stats/" + college) else {
        return
    }
        
    URLSession.shared.dataTask(with: url) { (data, _, _) in
        let stats = try!JSONDecoder().decode(Stats.self, from: data!)
        DispatchQueue.main.async {
            print("1")
            print(stats)
            print("2")
            completion(stats)
        }
    }.resume()
}

func getAllMarkers(completion: @escaping ([Marker]) -> ()) {
    guard let url = URL(string: "https://free-food-university.azurewebsites.net/marker/all") else {
        return
    }
        
    URLSession.shared.dataTask(with: url) { (data, _, _) in
        let markers = try!JSONDecoder().decode([Marker].self, from: data!)
        DispatchQueue.main.async {
        //    print("1")
        //    print(markers)
        //    print("2")
           completion(markers)
        }
    }.resume()
}

func getAllMarkersForCollege(completion: @escaping ([Marker]) -> (), college: String) {
    guard let url = URL(string: "https://free-food-university.azurewebsites.net/marker/" + college) else {
        return
    }
        
    URLSession.shared.dataTask(with: url) { (data, _, _) in
        let markers = try!JSONDecoder().decode([Marker].self, from: data!)
        DispatchQueue.main.async {
            print("1")
            print(markers)
            print("2")
            completion(markers)
        }
    }.resume()
}

func getMarkerFromTitleAndCollege(completion: @escaping ([Marker]) -> (), college: String, food: String) {
    guard let url = URL(string: "https://free-food-university.azurewebsites.net/marker/" + college + "/" + food) else {
        return
    }
        
    URLSession.shared.dataTask(with: url) { (data, _, _) in
        let markers = try!JSONDecoder().decode([Marker].self, from: data!)
        DispatchQueue.main.async {
            print("1")
            print(markers)
            print("2")
            completion(markers)
        }
    }.resume()
}

func getMarkerFromTitleAndCollege(college: String, food: String) -> [Marker] {
    var Markers: [Marker] = []
    
    getMarkerFromTitleAndCollege (completion: { (marks) in
        Markers = marks
    }, college: college, food: food)
    
    return Markers
}

func saveMarkersForCollege(markers: [Marker]) {
    Markers = markers
}

func getFoodSortedByExistence(college: String) -> [String] {
    var dict = ["pizza": 0,
                "burger": 0,
                "breakfast": 0,
                "lunch": 0,
                "dinner": 0,
                "ice-cream": 0,
                "fruit": 0,
                "mexican": 0,
                "coffee": 0,
                "sandwich": 0,
                "chickfila": 0]
    
    for marker in Markers {
        dict[marker.food] = dict[marker.food]! + 1
    }
    
    var returnArray: [String] = []
    
    var length = dict.count
    
    for i in 1 ... length  {
        var key: String = (dict.max {$0.value < $1.value})!.key
        returnArray.append(key)
        dict.removeValue(forKey: key)
    }
    
    return returnArray
}
