//
//  FitnessGoalsSetup.swift
//  NewbieGainz
//
//  Created by 39GOParticipant on 7/7/25.
//

import SwiftUI

struct FitnessGoalsSetup: View {
    @EnvironmentObject private var userSettings: UserSettings
        
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
                
                GoalButton(label: "Toning", selected: $userSettings.workoutGoal)
                Spacer()
                GoalButton(label: "Both", selected: $userSettings.workoutGoal)
                Spacer()
                GoalButton(label: "Strength Building", selected: $userSettings.workoutGoal)
                
                // end buttons
                Spacer()
            } // end vstack
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()
            .background
            {
                Color(userSettings.backgroundColor)
                    .ignoresSafeArea()
            }
            Footer()
                .navigationBarBackButtonHidden(true)
        }
    }
}


struct GoalButton: View {
    let label: String
    @Binding var selected: String?
    
//    private var link: View
    
    var body: some View {
        Button(action: {
            selected = label
        }) {
            HStack {
                Spacer()
                VStack() {
                    Spacer()
                    Text(label)
                    Text(label=="Both" ? "(Recommended)" : "")
                        .font(.title2)
                }
                Spacer()
                NavigationLink(destination: FitnessGoalsSetup()) {
                    Image("info")
                        .resizable()
                }
                .frame(width: 50, height: 50)
                .navigationBarBackButtonHidden(true)
            }
            
            .foregroundColor(Color.white)
            .fixedSize(horizontal: false, vertical: true)
            .padding()
            .frame(width: 300, height: 150)
            .background(selected == label ? Color.black.opacity(0.7) : Color.gray.opacity(0.8))
            .font(.title)
            .contentShape(Rectangle())
            .cornerRadius(25)
            .overlay(
                RoundedRectangle(cornerRadius: 25)
                    .stroke(selected == label ? Color.white : Color.clear, lineWidth: 2)
            )
            .navigationBarBackButtonHidden(true)
        } // end button
    } // end body
}

#Preview {
    FitnessGoalsSetup()
        .environmentObject(UserSettings())
}
