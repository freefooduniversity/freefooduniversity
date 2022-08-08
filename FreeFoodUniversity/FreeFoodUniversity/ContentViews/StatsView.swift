//
//  StatsView.swift
//  FreeFoodUniversity
//
//  Created by William Sirotkin on 7/10/22.
//

import Foundation
import SwiftUI
import CoreData
import UIKit

struct StatsView: View {
    @Binding var active: Int
    @Binding var fedToday: Int
    @Binding var fedAllTime: Int
    
    var body: some View {
        HStack {
            Text("Food Events:")
                .foregroundColor(.black)
                .font(.custom("Helvetica Neue", size: 14))
            Text(String(active) + "🍔  ")
                .foregroundColor(.blue)
                .font(.custom("Helvetica Neue", size: 14))
            Text("Today:")
                .foregroundColor(.black)
                .font(.custom("Helvetica Neue", size: 14))
            Text(String(fedToday) + "🧑🏻‍💼  ")
                .foregroundColor(.blue)
                .font(.custom("Helvetica Neue", size: 14))
            Text("All Time:")
                .foregroundColor(.black)
                .font(.custom("Helvetica Neue", size: 14))
            Text(String(fedAllTime) + "🧑🏻‍💼  ")
                .foregroundColor(.blue)
                .font(.custom("Helvetica Neue", size: 14))
        }
    }
}

func updateFoodEvents(college: String, food_events_change: Int) {
    guard let url = URL(string: "https://free-food-university.azurewebsites.net/stats/food_events/update/" + college) else {
        return
    }
   
    var request = URLRequest(url: url)
    
    request.httpMethod = "PATCH"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    
    let body: [String: AnyHashable] = [
        "food_events_change": food_events_change
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
