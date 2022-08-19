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
    @Binding var imageId: String
    
    var body: some View {
        VStack {
            Button(action: {
               imageId = ""
               enlargeImage = false
            }) {
                HStack {
                    AsyncImage(url: URL(string: "https://firebasestorage.googleapis.com/v0/b/free-food-university.appspot.com/o/food-images%2F" + imageId + "?alt=media&token=443b7066-9c00-477a-875c-efe7b2db19df"), scale: 2) { image in
                                image
                                  .resizable()
                          //        .aspectRatio(contentMode: .fill)
                                  .frame(width: 289, height: 200)
                            } placeholder: {
                                ProgressView()
                                        .progressViewStyle(.circular)
                            }
                            .rotationEffect(Angle(degrees: 90))
                            .frame(width: 289, height:200)
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
 

