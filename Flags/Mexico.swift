//
//  Mexico.swift
//  Flags1
//
//  Created by 56GOParticipant on 6/25/25.
//

import SwiftUI

struct Mexico: View {
    var body: some View {
        ZStack {
            HStack {
                Color(red:0, green: 102/255, blue: 51/255)
                Color.white
                Color.red
            }
            Image("mexicanEagle")
                .resizable()
                .scaledToFit()
                .frame(width:150, height:150)
            
        }
        .ignoresSafeArea()
        
    }
}

#Preview {
    Mexico()
}
