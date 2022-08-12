//
//  renameFunctions.swift
//  FreeFoodUniversity
//
//  Created by William Sirotkin on 8/12/22.
//
/*
 
 All functions for renaming foods to and from display names
 
 */


import Foundation

func getFoodDisplayName(food: String) -> String {
    if (food == "chickfila") {return "Chick-fil-A"}
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

func getFoodFromDropDownName(food: String) -> String {
    if (food == " Chick-fil-A 🐄 ") {return "chickfila"}
    if (food == " Sandwiches 🥪 ") {return "sandwich"}
    if (food == " Mexican 🌮 ") {return "mexican"}
    if (food == " Dessert 🍦 ") {return "ice-cream"}
    if (food == " Fruit 🍉 ") {return "fruit"}
    if (food == " Coffee ☕️ ") {return "coffee"}
    if (food == " Breakfast 🍳 ") {return "breakfast"}
    if (food == " Lunch 🥘 ") {return "lunch"}
    if (food == " Dinner 🍽️ ") {return "dinner"}
    if (food == " Pizza 🍕 ") {return "pizza"}
    if (food == " Burgers 🍔 ") {return "burger"}
    return "ERROR IN DROP DOWN NAME"
}
