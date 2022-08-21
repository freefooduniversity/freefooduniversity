//
//  Utility.swift
//  FreeFoodUniversity
//
//  Created by Stephen Nemeth on 8/12/22.
//

import Foundation

var Markers: [Marker] = []
let foo = Bundle.main.object(forInfoDictionaryKey: "food")as! String

func getStats(completion: @escaping (Stats) -> (), college: String) {
    print(Bundle.main.object)
    guard let url = URL(string: "https://free-food-university.azurewebsites.net/" + foo + "/stats/" + college) else {
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
    guard let url = URL(string: "https://free-food-university.azurewebsites.net/" + foo + "/marker/all") else {
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
    guard let url = URL(string: "https://free-food-university.azurewebsites.net/" + foo + "/marker/" + college) else {
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
    guard let url = URL(string: "https://free-food-university.azurewebsites.net/" + foo + "/marker/" + college + "/" + food) else {
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
/*
func getMarkerFromTitleAndCollege(college: String, food: String) -> [Marker] {
    var Markers: [Marker] = []
    
    getMarkerFromTitleAndCollege (completion: { (marks) in
        Markers = marks
    }, college: college, food: food)
    
    return Markers
}
*/

func getMarkerFromTitleAndCollege(completion: @escaping ([Marker]) -> (), college: String, title: String) {
    var food = ""
    var building = ""
    
    let index = title.firstIndex(of: "|")
    let fromIndex = title.index(title.startIndex, offsetBy: title.distance(from: title.startIndex, to: index!) + 1)
    food = String(title.prefix(upTo: index!))
    building = String(title.substring(from: fromIndex))

    guard let url = URL(string: "https://free-food-university.azurewebsites.net/" + foo + "/marker/title/college/" + food + "/" + building + "/" + college) else {
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

func saveMarkersForCollege(markers: [Marker]) {
    Markers = markers
}

func getFoodSortedByExistence(college: String) -> [(String, Int)] {
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
    
    var returnArray: [(String, Int)] = []
    
    var length = dict.count
    
    for i in 1 ... length  {
        var pair: (String, Int) = (dict.max {$0.value < $1.value})!
        returnArray.append(pair)
        dict.removeValue(forKey: pair.0)
    }
    
    return returnArray
}


func makeMarkerTitle(food: String, building: String)  -> String{
    return "Free " + getFoodDisplayName(food: food) +  " at " + building + "!"
}



func updateMarkerButton(id: Int, button: String, college: String) {
    guard let url = URL(string: "https://free-food-university.azurewebsites.net/" + foo + "/marker/button/" + String(id) + "/" + button + "/" + college) else {
        return
    }
    
    URLSession.shared.dataTask(with: url) { (data, _, _) in
     //   let stats = try!JSONDecoder().decode([String].self, from: data!)
    }.resume()
   
}

func deleteFedToday() {
    guard let url = URL(string: "https://free-food-university.azurewebsites.net/" + foo + "/stats/fed_today/reset") else {
        return
    }
    
    URLSession.shared.dataTask(with: url) { (data, _, _) in
     //   let stats = try!JSONDecoder().decode([String].self, from: data!)
    }.resume()
}

func addMarker(id: Int, foodSelection: String, lat: Double, long: Double, college: String, duration : String, capacity: Int, building: String, event: String, additional_info: String, email: String) {
    setUserActiveMarkerId(email: email, id: id)
    getTimeZone()
    if (lat == 37.0902 || long == -95.7129) {
        print("TURN LOCATION ON")
        return
    }
    
    if (emailSet.contains(email) && email != "BB3228D8-50BB-4E83-A7B7-E468E34B59DE") {
        print("You've already placed a marker")
        return
    }
    guard let url = URL(string: "https://free-food-university.azurewebsites.net/" + foo + "/marker/add") else {
        return
    }
   
    var request = URLRequest(url: url)
    
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    
    var food = getFoodFromDropDownName(food: foodSelection)
    let body: [String: AnyHashable] = [
        "id": id,
        "food": food,
        "lat": lat,
        "long": long,
        "college": college,
        "start_time": getStartTime(),
        "end_time": getEndTime(duration: duration),
        "time_zone": getTimeZone(),
        "capacity": capacity,
        "dibs": 0,
        "likes": 0,
        "dislikes": 0,
        "reports": 0,
        "creator_email": email,
        "pic_url": "place_holder",
        "event": event,
        "building": building,
        "additional_info": additional_info
    ]
     
   request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
    
    
    // Make the Request
    let task = URLSession.shared.dataTask(with: request) { data, _, error in
        guard let data = data, error == nil else {
            return
        }
        
        do {
            let response = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
            print("SUCESSS")
            print(response)
        } catch {
            print("An error occured: ")
            print(error)
        }
         
    }
    task.resume()
    
}

func getStatsForState(completion: @escaping (Stats) -> (), state: String) {
    guard let url = URL(string: "https://free-food-university.azurewebsites.net/" + foo + "/stats/state") else {
        return
    }
   
    var request = URLRequest(url: url)
    
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    
    let body: [String: AnyHashable] = [
        "colleges": getCollegesByState(selectedState: state)
    ]
     
   request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
    
    
    // Make the Request
    /*
    let task = URLSession.shared.dataTask(with: request) { data, _, error in
        guard let data = data, error == nil else {
            return
        }
        
        do {
            let response = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
            print("SUCESSS")
            print(response)
        } catch {
            print("An error occured: ")
            print(error)
        }
         
    }
    task.resume()
     */
    URLSession.shared.dataTask(with: request) { (data, _, _) in
        let stats = try!JSONDecoder().decode(Stats.self, from: data!)
        DispatchQueue.main.async {
            completion(stats)
        }
    }.resume()
    
}

func getMarkersForState(completion: @escaping ([Marker]) -> (), state: String) {
    guard let url = URL(string: "https://free-food-university.azurewebsites.net/" + foo + "/marker/state") else {
        return
    }
   
    var request = URLRequest(url: url)
    
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    
    let body: [String: AnyHashable] = [
        "colleges": getCollegesByState(selectedState: state)
    ]
     
   request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
    
    
    // Make the Request
    /*
    let task = URLSession.shared.dataTask(with: request) { data, _, error in
        guard let data = data, error == nil else {
            return
        }
        
        do {
            let response = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
            print("SUCESSS")
            print(response)
        } catch {
            print("An error occured: ")
            print(error)
        }
         
    }
    task.resume()
     */
    URLSession.shared.dataTask(with: request) { (data, _, _) in
        let markers = try!JSONDecoder().decode([Marker].self, from: data!)
        DispatchQueue.main.async {
            completion(markers)
        }
    }.resume()
    
}

func updateFoodEvents(college: String, food_events: Int) {
    guard let url = URL(string: "https://free-food-university.azurewebsites.net/" + foo + "/stats/food_events/update/" + college) else {
        return
    }
   
    var request = URLRequest(url: url)
    
    request.httpMethod = "PATCH"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    
    let body: [String: AnyHashable] = [
        "food_events": food_events
    ]
     
   request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
    
    
    // Make the Request
    let task = URLSession.shared.dataTask(with: request) { data, _, error in
        guard let data = data, error == nil else {
            return
        }
        
        do {
            let response = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
            print("SUCESSS")
            print(response)
        } catch {
            print("An error occured: ")
            print(error)
        }
         
    }
    task.resume()
    
}

func getUser(completion: @escaping ([User]) -> (), email: String) {
    guard let url = URL(string: "https://free-food-university.azurewebsites.net/" + foo + "/user/" + email) else {
        return
    }
        
    URLSession.shared.dataTask(with: url) { (data, _, _) in
        let users = try!JSONDecoder().decode([User].self, from: data!)
        DispatchQueue.main.async {
            completion(users)
        }
    }.resume()
}

func addUser(email: String) {
        guard let url = URL(string: "https://free-food-university.azurewebsites.net/" + foo + "/user/add") else {
            return
        }
       
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body: [String: AnyHashable] = [
            "email": email,
        ]
         
       request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
        
        
        // Make the Request
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let response = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                print("SUCESSS")
                print(response)
            } catch {
                print("An error occured: ")
                print(error)
            }
             
        }
        task.resume()
}

func incrementUser(email: String, action: String) {
    guard let url = URL(string: "https://free-food-university.azurewebsites.net/" + foo + "/user/" + action + "/increment/" + email) else {
        return
    }
        
    URLSession.shared.dataTask(with: url) { (data, _, _) in
     //   let users = try!JSONDecoder().decode([User].self, from: data!)
    }.resume()
}

func getMarkerById(completion: @escaping ([Marker]) -> (), id: Int) {
    guard let url = URL(string: "https://free-food-university.azurewebsites.net/" + foo + "/marker/id/" + String(id)) else {
        return
    }
        
    URLSession.shared.dataTask(with: url) { (data, _, _) in
        let markers = try!JSONDecoder().decode([Marker].self, from: data!)
        DispatchQueue.main.async {
            completion(markers)
        }
    }.resume()
}

func setUserActiveMarkerId(email: String, id: Int) {
    guard let url = URL(string: "https://free-food-university.azurewebsites.net/" + foo + "/user/marker/set/" + String(email) + "/" + String(id)) else {
        return
    }
        
    URLSession.shared.dataTask(with: url) { (data, _, _) in
   //     let markers = try!JSONDecoder().decode([Marker].self, from: data!)
    }.resume()
}

func removeUserActiveMarkerId(email: String, id: Int) {
    guard let url = URL(string: "https://free-food-university.azurewebsites.net/" + foo + "/user/marker/remove/" + String(email) + "/" + String(id)) else {
        return
    }
        
    URLSession.shared.dataTask(with: url) { (data, _, _) in
   //     let markers = try!JSONDecoder().decode([Marker].self, from: data!)
    }.resume()
}

func getBannedPhrases(completion: @escaping ([Phrase]) -> ()) {
    guard let url = URL(string: "https://free-food-university.azurewebsites.net/" + foo + "/banned/phrases") else {
        return
    }
        
    URLSession.shared.dataTask(with: url) { (data, _, _) in
        let phrases = try!JSONDecoder().decode([Phrase].self, from: data!)
        DispatchQueue.main.async {
            completion(phrases)
        }
    }.resume()
}
