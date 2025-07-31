//
//  NewbieGainzApp.swift
//  NewbieGainz
//
//  Created by 39GOParticipant on 7/7/25.
//

import SwiftUI


class UserSettings: ObservableObject {
    @Published var workoutGoal: String?
    @Published var workoutSchedule: [String:String]
    @Published var backgroundColor: Color

    init() {
        self.workoutGoal = ""
        self.workoutSchedule = ["Su":"", "M":"", "Tu":"", "W":"", "Th":"", "F": "", "Sa": ""]
        self.backgroundColor = Color(.black).opacity(0.9)
    }
}

@main
struct NewbieGainzApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(UserSettings())
        }
    }
}
