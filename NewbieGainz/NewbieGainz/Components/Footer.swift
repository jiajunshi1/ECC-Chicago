//
//  Footer.swift
//  NewbieGainz
//
//  Created by 39GOParticipant on 7/7/25.
//

import SwiftUI

struct Footer: View {
    var body: some View {
        Spacer()
        HStack
        {
            Spacer()
            NavigationLink(destination: InfoPage()) {
                Image("info")
                    .resizable()
                    .scaledToFit()
                    .ignoresSafeArea()
            }
            Spacer()
            NavigationLink(destination: WorkoutsList()) {
                Image("weight")
                    .resizable()
                    .scaledToFit()
                    .ignoresSafeArea()
            }
            Spacer()
            NavigationLink(destination: TodayWorkout()) {
                Image("calendar")
                    .resizable()
                    .scaledToFit()
                    .ignoresSafeArea()
            }
            Spacer()
            NavigationLink(destination: ProfilePage()) {
                Image("profile")
                    .resizable()
                    .scaledToFit()
                    .ignoresSafeArea()
            }
            Spacer()
        } // end hstack
        .padding(15)
        .frame(width: .infinity, height: 75)
        .background
        {
            Color(Color.black.opacity(0.9))
                .ignoresSafeArea()
        }
    }
}

#Preview {
    Footer()
}
