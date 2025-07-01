//
//  DestinationView.swift
//  Intergalatic Traveler
//
//  Created by 56GOParticipant on 7/1/25.
//

import SwiftUI

struct DestinationView: View {
    @State var starImage = "redOne"
    var travelingToRedDwarf: Bool
    
    let redDwarfStars = ["redOne", "redTwo", "redThree"]
    let blueDwarfStars = ["blueOne", "blueTwo", "blueThree"]
    
    var body: some View {
        ZStack {
            Image("spaceBackground")
                .resizable()
                .ignoresSafeArea()
            VStack {
                Image (starImage)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Ellipse())
                    .padding()
            }
        }
        .onAppear{
            if travelingToRedDwarf == true {
                starImage = redDwarfStars[Int.random(in: 0...2)]
            }
            else {
                starImage = blueDwarfStars[Int.random(in: 0...2)]
            }
        }
        
        
    }
}

#Preview {
    DestinationView(travelingToRedDwarf: true)
}
