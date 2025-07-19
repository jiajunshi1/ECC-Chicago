//
//  FitnessGoalsSetup.swift
//  NewbieGainz
//
//  Created by 39GOParticipant on 7/7/25.
//

import SwiftUI

struct FitnessGoalsSetup: View {
    @State private var selectedGoal = ""
    
    func changeSelected(buttonPressed: String) {
        
    }
    
    var body: some View {
        NavigationStack() {
            VStack() {
                HStack() {
                    NavigationLink(destination: InfoPage() .navigationBarBackButtonHidden(true)) {
                        Image("left")
                            .resizable()
                            .frame(width: 50, height: 50)
                    }
                    Spacer()
                    VStack() {
                        // setup
                        Text("Choose Your")
                            .bold()
                            .foregroundColor(Color.white)
                            .font(.title)
                        Text("Fitness Goal")
                            .bold()
                            .foregroundColor(Color.white)
                            .font(.title)
                    }
                    
                    Spacer()
                    
                    // next button
                    NavigationLink(destination: CalendarSetup() .navigationBarBackButtonHidden(true)) {
                        Image("right")
                            .resizable()
                            .frame(width: 50, height: 50)
                    }
                }
                
                Text("Click the icon to learn more")
                    .bold()
                    .foregroundColor(Color.white)
                    .font(.headline)
                Spacer()
                Button(action: {}, label: {
                    Spacer()
                    Text("Toning")
                    Spacer()
                    Button(action: {}, label: {Image("info")
                            .resizable()
                        .frame(width: 50, height: 50)})
                })
                .id("toningButton")
                .foregroundColor(Color.white)
                .fixedSize(horizontal: false, vertical: true)
                .padding()
                .frame(width: 300, height: 150)
                .background(Rectangle().fill(Color.gray))
                .font(.title)
                .contentShape(Rectangle())
                .cornerRadius(25)
                
                Spacer()
                
                Button(action: {}, label: {
                    Spacer()
                    VStack() {
                        Text("Both")
                        Text("(Recommended)")
                            .font(.title2)
                    }
                    Spacer()
                    Button(action: {}, label: {Image("info")
                            .resizable()
                        .frame(width: 50, height: 50)})
                })
                .id("bothButton")
                .foregroundColor(Color.white)
                .fixedSize(horizontal: false, vertical: true)
                .padding()
                .frame(width: 300, height: 150)
                .background(Rectangle().fill(Color.gray))
                .font(.title)
                .contentShape(Rectangle())
                .cornerRadius(25)
                
                Spacer()
                
                Button(action: {}, label: {
                    Spacer()
                    Text("Strength Building")
                    Spacer()
                    Button(action: {}, label: {Image("info")
                            .resizable()
                        .frame(width: 50, height: 50)})
                })
                .id("strengthButton")
                .foregroundColor(Color.white)
                .fixedSize(horizontal: false, vertical: true)
                .padding()
                .frame(width: 300, height: 150)
                .background(Rectangle().fill(Color.gray))
                .font(.title)
                .contentShape(Rectangle())
                .cornerRadius(25)
                
                // buttons
                Spacer()
            } // end vstack
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()
            .background
            {
                Color(Color.black.opacity(0.9))
                    .ignoresSafeArea()
            }
            Footer()
                .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    FitnessGoalsSetup()
}
