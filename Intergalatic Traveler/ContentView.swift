//
//  ContentView.swift
//  Intergalatic Traveler
//
//  Created by 56GOParticipant on 7/1/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Image("spaceBackground")
                    .resizable()
                    .ignoresSafeArea()
                VStack {
                    Text ("Choose Your Destination")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    NavigationLink(destination: DestinationView(travelingToRedDwarf: true)) {
                        Text ("Red Dwarf Star")
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.red)
                            .cornerRadius(20)
                    }
                    NavigationLink(destination: DestinationView(travelingToRedDwarf: false)) {
                        Text ("Blue Dwarf Star")
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .cornerRadius(20)
                    }
                    
                }
            }
            
            
        }
        
        
    }
}

#Preview {
    ContentView()
}
