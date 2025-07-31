    //
//  ProfilePage.swift
//  NewbieGainz
//
//  Created by 39GOParticipant on 7/15/25.
//

import SwiftUI

struct ProfilePage: View {
    @EnvironmentObject private var userSettings: UserSettings
    
    @State private var bgColor = Color(Color.black.opacity(0.9))
    @State private var notifs = true
    
    var body: some View {
        NavigationStack() {
            VStack() {
                Image("profile")
                    .resizable()
                    .frame(width: 100, height: 100)
                
                HStack() {
                    // prev button
                    NavigationLink(destination: TodayWorkout() .navigationBarBackButtonHidden(true)) {
                        Image("left")
                            .resizable()
                            .frame(width: 50, height: 50)
                    }
                    
                    Spacer()
                    Text("Profile")
                        .foregroundColor(.white)
                        .bold(true)
                        .font(.system(size: 45))
                    
                    Spacer()
                    Spacer()
                    
                }
                Spacer()
                
                HStack() {
                    Text("Email: ")
                        .foregroundColor(.white)
                        .bold()
                        .font(.title)
                    Spacer()
                    Text("newbiegainz@icloud.com")
                        .frame(width:200)
                        .padding()
                        .background(.white)
                        .cornerRadius(15)
                        .font(.system(size: 17))
                }
                .padding(.horizontal)
                
                HStack() {
                    Spacer()
                    Text("Change Password")
                        .foregroundColor(.white)
                        .font(.system(size: 25))
                }
                .padding(.horizontal)
                
                Spacer()
                
                HStack() {
                    Text("Change Theme: ")
                        .foregroundColor(.white)
                        .bold()
                        .font(.title)
                    
                    Spacer()
                    
                    ColorPicker("Select Color", selection: $bgColor, supportsOpacity: false)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(100)
                        .labelsHidden()
                        .onChange(of: bgColor) { userSettings.backgroundColor = bgColor }
                }
                .padding(.horizontal)
                
                Spacer()
                
                HStack() {
                    Text("Notifications: ")
                        .foregroundColor(.white)
                        .bold()
                        .font(.title)
                    Spacer()
                    
                    Toggle(isOn: $notifs) {
                    }
                    .tint(.blue)
                    .background(.gray)
                    .frame(width: 50)
                    .cornerRadius(35)
                    .scaleEffect(1.5)
                }
                .padding(.horizontal)
                
                Spacer()
                
                NavigationLink(destination: ContentView() .navigationBarBackButtonHidden(true)) {
                    Text("Logout")
                        .foregroundColor(.black)
                        .padding()
                        .background(.white)
                        .bold()
                        .font(.system(size: 45))
                        .cornerRadius(25)
                }
                
            } // end vstack
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()
            .background
            {
                userSettings.backgroundColor
                    .ignoresSafeArea()
            }
            Footer()
                .navigationBarBackButtonHidden(true)
        } // end nav stack
    }
}

#Preview {
    ProfilePage()
        .environmentObject(UserSettings())
}
