//
//  TodayWorkout.swift
//  NewbieGainz
//
//  Created by 39GOParticipant on 7/15/25.
//

import SwiftUI

struct TodayWorkout: View {
    @EnvironmentObject private var userSettings: UserSettings
    
    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter.string(from: Date())
    }
    
    var body: some View {
        NavigationStack() {
            VStack() {
                Image("calendar")
                    .resizable()
                    .frame(width: 100, height: 100)
                ScrollView(.horizontal) {
                    HStack() {
                        CalendarDay(label: "Su", map: $userSettings.workoutSchedule)
                        CalendarDay(label: "M", map: $userSettings.workoutSchedule)
                        CalendarDay(label: "Tu", map: $userSettings.workoutSchedule)
                        CalendarDay(label: "W", map: $userSettings.workoutSchedule)
                        CalendarDay(label: "Th", map: $userSettings.workoutSchedule)
                        CalendarDay(label: "F", map: $userSettings.workoutSchedule)
                        CalendarDay(label: "Sa", map: $userSettings.workoutSchedule)
                        
                    } // end hstack
                } // end scroll view
                HStack() {
                    NavigationLink(destination: FitnessGoalsSetup())
                    {
                        Text("Edit Goals")
                    }
                    
                    Spacer()
                    
                    NavigationLink(destination: CalendarSetup())
                    {
                        Text("Edit Workout")
                    }
                }
                .font(.system(size: 20))
                .foregroundStyle(.gray)
                .navigationBarBackButtonHidden(true)
                
                Spacer()
                
                HStack() {
                    Spacer()
                    VStack() {
                        Text(formattedDate)
                            .bold()
                            .foregroundColor(Color.white)
                            .font(.title)
                        Text("Today's Workout")
                            .bold()
                            .foregroundColor(Color.white)
                            .font(.title)
                    }
                    Spacer()
                }
                
                Spacer()
                
                VStack() {
                    Text("Push Day")
                        .bold()
                        .foregroundColor(Color.white)
                        .font(.title)
                    
                    Rectangle()
                        .padding()
                        .background(.gray)
                        .foregroundColor(.gray)
                        .frame(height: 25)
                    
                    NavigationLink(destination: WorkoutTrack())
                    {
                        VStack()
                        {
                            Text("Start")
                            Text("Workout")
                        }
                        .fixedSize(horizontal: false, vertical: true)
                        .padding()
                        .frame(width: 150, height: 150)
                        .background(Rectangle().fill(Color.black.opacity(0.3)))
                        .cornerRadius(25)
                    }
                }
                .foregroundColor(Color.white)
                .fixedSize(horizontal: false, vertical: true)
                .padding()
                .frame(width: 300, height: 300)
                .background(Rectangle().fill(Color.gray))
                .font(.title)
                .contentShape(Rectangle())
                .cornerRadius(25)
                
                Spacer()
                
            } // end vbox
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()
            .background
            {
                Color(userSettings.backgroundColor)
                    .ignoresSafeArea()
            }
            
            Footer()
                .navigationBarBackButtonHidden(true)
        } // end nav stack
    } // end body
}

struct CalendarDay: View {
    let label: String
    @Binding var map: [String:String]
    var body: some View {
        Button(action: {}) {
            VStack() {
                Text(label)
                    .bold()
                    .foregroundStyle(.black)
                    .font(.title)
                Text(map[label] ?? "")
                    .bold()
                    .foregroundStyle(.white)
                    .font(.title2)
            }
            .fixedSize(horizontal: false, vertical: true)
            .padding()
            .frame(width: 125, height: 125)
            .contentShape(Rectangle())
            .background(.gray)
            .cornerRadius(15)
            .navigationBarBackButtonHidden(true)
        } // end button
    } // end body
}

#Preview {
    TodayWorkout()
        .environmentObject(UserSettings())
}
