//
//  GoogleAddFoodView.swift
//  FreeFoodUniversity
//
//  Created by William Sirotkin on 8/16/22.
//

import Foundation
import SwiftUI

struct GoogleAddFoodView: View {
    @Binding var isSignedIntoGoogle: Bool
    var body: some View {
        VStack {
            Image("google")
            Button(action: {
                isSignedIntoGoogle = true // change this after done testing
            }) {
                HStack {
                    Image("blue")
                    Text("Sign in with Google To Add Food      ")
                        .font(.custom("Helvetica Neue", size: 16))
                        .foregroundColor(.white)
                }
            }.background(Color.green).cornerRadius(15)
        }.position(x: 195, y: 115)
    }
}


