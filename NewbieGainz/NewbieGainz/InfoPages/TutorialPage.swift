//
//  TutorialPage.swift
//  NewbieGainz
//
//  Created by 39GOParticipant on 7/22/25.
//

import SwiftUI

struct TutorialPage: View {
    @EnvironmentObject private var userSettings: UserSettings
    
    var body: some View {
        NavigationStack() {
            VStack() {
                
                
                HStack() {
                    NavigationLink(destination: CalendarSetup() .navigationBarBackButtonHidden(true)) {
                        Image("left")
                            .resizable()
                            .frame(width: 50, height: 50)
                    }
                    Spacer()
                    
                    Image("logo")
                        .resizable()
                        .frame(width: 150, height: 100)
                    
                    Spacer()
                    
                    // next button
                    NavigationLink(destination: TodayWorkout() .navigationBarBackButtonHidden(true)) {
                        Image("right")
                            .resizable()
                            .frame(width: 50, height: 50)
                    }
                }
                
                
                VStack() {
                    // setup
                    Text("Welcome to")
                        .bold()
                        .foregroundColor(Color.white)
                        .font(.title)
                    Text("NewbieGainz")
                        .bold()
                        .foregroundColor(Color.white)
                        .font(.title)
                }
                
                Spacer()
                Text("You are all set!")
                    .bold()
                    .foregroundColor(Color.white)
                    .font(.title2)
                
                Text("Click the icons to navigate")
//                    .bold()
                    .foregroundColor(Color.white)
                    .font(.title3)
                
                Spacer()
                
                HStack() {
                    NavigationLink(destination: ContentView2()){
                        Image("newbiebot")
                            .resizable()
                            .frame(width: 75, height: 50)
                    }
                    Spacer()
                    Text("Talk to NewbieBot for assistance")
                        .bold()
                        .foregroundColor(Color.white)
                        .font(.headline)
                        .frame(width: 200)
                }
                .frame(width:300)
                
                Spacer()
                
                HStack() {
                    NavigationLink(destination: InfoPage()){
                        Image("info")
                            .resizable()
                            .frame(width: 50, height: 50)
                    }
                    Spacer()
                    Text("Learn about the basics of working out")
                        .bold()
                        .foregroundColor(Color.white)
                        .font(.headline)
                        .frame(width: 200)
                }
                .frame(width:300)
                
                Spacer()
                
                HStack() {
                    NavigationLink(destination: WorkoutsList()){
                        Image("weight")
                            .resizable()
                            .frame(width: 50, height: 50)
                    }
                    Spacer()
                    Text("Learn about beginner workouts and routines")
                        .bold()
                        .foregroundColor(Color.white)
                        .font(.headline)
                        .frame(width: 200)
                }
                .frame(width:300)
                
                Spacer()
                
                HStack() {
                    NavigationLink(destination: TodayWorkout()){
                        Image("calendar")
                            .resizable()
                            .frame(width: 50, height: 50)
                    }
                    Spacer()
                    Text("Track your progress and view today's workout")
                        .bold()
                        .foregroundColor(Color.white)
                        .font(.headline)
                        .frame(width: 200)
                }
                .frame(width:300)
                
                Spacer()
                
                HStack() {
                    NavigationLink(destination: ProfilePage()){
                        Image("profile")
                            .resizable()
                            .frame(width: 50, height: 50)
                    }
                    Spacer()
                    Text("Visit profile and change settings")
                        .bold()
                        .foregroundColor(Color.white)
                        .font(.headline)
                        .frame(width: 200)
                }
                .frame(width:300)
                
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

#Preview {
    TutorialPage()
        .environmentObject(UserSettings())
}
