//
//  BamaView.swift
//  FreeFoodUniversity
//
//  Created by Stephen Nemeth on 8/12/22.
//

import SwiftUI

struct BamaView: View {
    @Binding var college: String
    
    var body: some View {
        VStack {
            Image("jordandavis")
                .resizable()
                .frame(width: 400, height: 500)
        }
    }
}
