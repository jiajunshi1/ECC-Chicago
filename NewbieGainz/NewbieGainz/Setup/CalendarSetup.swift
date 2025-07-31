//
//  CalendarSetup.swift
//  NewbieGainz
//
//  Created by 39GOParticipant on 7/7/25.
//

import SwiftUI

struct CalendarSetup: View {
    @EnvironmentObject private var userSettings: UserSettings
    
    @State private var selectedDay: String? = nil
    @State private var workoutPressed: String? = nil
    
    
    var body: some View {
        NavigationStack() {
            VStack() {
                HStack() {
                    NavigationLink(destination: FitnessGoalsSetup() .navigationBarBackButtonHidden(true)) {
                        Image("left")
                            .resizable()
                            .frame(width: 50, height: 50)
                    }
                                        
                    Spacer()
                    
                    VStack() {
                        Text("Set Up Your")
                            .bold()
                            .foregroundColor(Color.white)
                            .font(.title)
                        Text("Workout Schedule")
                            .bold()
                            .foregroundColor(Color.white)
                            .font(.title)
                    }
                    
                    Spacer()
                    
                    // next button
                    NavigationLink(destination: TutorialPage() .navigationBarBackButtonHidden(true)) {
                        Image("right")
                            .resizable()
                            .frame(width: 50, height: 50)
                    }
                }
                Text("Click on a day and choose a")
                    .padding(.top)
                    .foregroundColor(Color.white)
                    .font(.headline)
                Text("workout routine for that day.")
                    .padding(.bottom)
                    .foregroundColor(Color.white)
                    .font(.headline)
                
                ScrollView(.horizontal) {
                    HStack() {
                        
                        CalendarButton(label: "Su", selected: $selectedDay, map: $userSettings.workoutSchedule)
                        CalendarButton(label: "M", selected: $selectedDay, map: $userSettings.workoutSchedule)
                        CalendarButton(label: "Tu", selected: $selectedDay, map: $userSettings.workoutSchedule)
                        CalendarButton(label: "W", selected: $selectedDay, map: $userSettings.workoutSchedule)
                        CalendarButton(label: "Th", selected: $selectedDay, map: $userSettings.workoutSchedule)
                        CalendarButton(label: "F", selected: $selectedDay, map: $userSettings.workoutSchedule)
                        CalendarButton(label: "Sa", selected: $selectedDay, map: $userSettings.workoutSchedule)
                        
                    } // end hstack
                } // end scroll view
                
                Spacer()
                
                // buttons
                Button("Push", action: {userSettings.workoutSchedule[selectedDay ?? ""] = "Push"})
                    .foregroundColor(Color.white)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding()
                    .frame(width: 150, height: 75)
                    .background(Rectangle().fill(Color.gray))
                    .font(.title)
                    .contentShape(Rectangle())
                    .cornerRadius(5)
                Button("Pull", action: {userSettings.workoutSchedule[selectedDay ?? ""] = "Pull"})
                    .foregroundColor(Color.white)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding()
                    .frame(width: 150, height: 75)
                    .background(Rectangle().fill(Color.gray))
                    .font(.title)
                    .contentShape(Rectangle())
                    .cornerRadius(5)
                Button("Leg", action: {userSettings.workoutSchedule[selectedDay ?? ""] = "Leg"})
                    .foregroundColor(Color.white)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding()
                    .frame(width: 150, height: 75)
                    .background(Rectangle().fill(Color.gray))
                    .font(.title)
                    .contentShape(Rectangle())
                    .cornerRadius(5)
                Button("None", action: {userSettings.workoutSchedule[selectedDay ?? ""] = ""})
                    .foregroundColor(Color.white)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding()
                    .frame(width: 100, height: 50)
                    .background(Rectangle().fill(Color.gray).opacity(0.5))
                    .font(.title2)
                    .contentShape(Rectangle())
                    .cornerRadius(5)
                
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

struct CalendarButton: View {
    let label: String
    @Binding var selected: String?
    @Binding var map: [String:String]
    var body: some View {
        Button(action: {
            selected = label
        }) {
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
            .background(selected == label ? Color.gray.opacity(0.5) : Color.gray.opacity(1))
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(selected == label ? Color.white : Color.clear, lineWidth: 2)
            )
            .cornerRadius(15)
            .navigationBarBackButtonHidden(true)
        } // end button
    } // end body
}

#Preview {
    CalendarSetup()
        .environmentObject(UserSettings())
}
