//
//  Utility.swift
//  FreeFoodUniversity
//
//  Created by Stephen Nemeth on 8/12/22.
//

import Foundation

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
