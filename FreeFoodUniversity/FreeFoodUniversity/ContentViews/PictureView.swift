//
//  PictureView.swift
//  FreeFoodUniversity
//
//  Created by William Sirotkin on 8/17/22.
//

import Foundation
import SwiftUI
import UIKit


struct PictureView: View {
    @Binding var enlargeImage: Bool
    var image: String
    
    var body: some View {
        VStack {
            Button(action: {
               enlargeImage = false
            }) {
                HStack {
                    Image("Headshot")
                        .resizable()
                        .frame(width: 200, height: 289)
                }
            }.position(x:195, y: 137)
            ZStack {
                Button(action: {
                   enlargeImage = false
                }) {
                    HStack {
                        Image("minimize")
                            .resizable()
                            .frame(width: 70, height: 70)
                    }
                }.position(x:285, y: -130)
            }
        }
    }
}
 

