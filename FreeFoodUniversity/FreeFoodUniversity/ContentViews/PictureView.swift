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
                    AsyncImage(url: URL(string: "https://firebasestorage.googleapis.com/v0/b/free-food-university.appspot.com/o/food-images%2FHeadshot.jpg?alt=media&token=c38c2460-f5eb-4256-a82f-d2d894516a5b"), scale: 2) { image in
                                image
                                  .resizable()
                          //        .aspectRatio(contentMode: .fill)
                                  .frame(width: 200, height: 289)
                            } placeholder: {
                                ProgressView()
                                        .progressViewStyle(.circular)
                            }
                            .frame(width: 200, height:289)
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
 

