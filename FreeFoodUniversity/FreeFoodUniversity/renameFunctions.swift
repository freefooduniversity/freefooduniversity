//
//  renameFunctions.swift
//  FreeFoodUniversity
//
//  Created by William Sirotkin on 8/12/22.
//
/*
 
 All functions for renaming something for user display should be here
 
 */


import Foundation

func getFoodDisplayName(food: String) -> String {
    if (food == "chickfila") {return "Chick-Fil-A"}
    if (food == "sandwich") {return "Sandwiches"}
    if (food == "mexican") {return "Mexican Food"}
    if (food == "ice-cream") {return "Dessert"}
    if (food == "fruit") {return "Fruit"}
    if (food == "coffee") {return "Coffee"}
    if (food == "breakfast") {return "Breakfast"}
    if (food == "lunch") {return "Lunch"}
    if (food == "dinner") {return "Dinner"}
    if (food == "pizza") {return "Pizza"}
    if (food == "burger") {return "Burgers"}
    return "ERROR IN DISPLAY NAME"
}
