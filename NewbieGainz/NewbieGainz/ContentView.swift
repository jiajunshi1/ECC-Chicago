//
//  ContentView.swift
//  NewbieGainz
//
//  Created by 56GOParticipant on 7/7/25.
//

import SwiftUI

struct ContentView: View {
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black
                    .ignoresSafeArea()
                
                Text("NewbieGainz")
                    .foregroundColor(.white)
                    .bold(true)
                    .font(.system(size: 45))
                    .position(x:200,  y:250)
                
                Text("Build Habits.")
                    .foregroundColor(.white)
                    .font(.system(size: 20))
                    .position(x:200,  y:300)
                
                Text("Train Right.")
                    .foregroundColor(.white)
                    .font(.system(size: 20))
                    .position(x:201,  y:320)
                
                TextField("Email", text:$email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width:250)
                    .position(x:200,  y:430)
                
                SecureField("Password", text:$password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width:250)
                    .position(x:200,  y:480)
                
                //change login to TodayWorkout
                NavigationLink(destination: InfoPage() .navigationBarBackButtonHidden(true)) {
                    Text("Login  ")
                        .foregroundColor(.black)
                        .font(.system(size: 23, weight: .bold))
                        .background(Color.white)
                }
                .position(x:200,  y:540)
                
                NavigationLink(destination: NewUserPage()) {
                    Text("New User Click here")
                        .foregroundColor(.white)
                        .font(.system(size: 20))
                }
                .position(x:200,  y:680)
            }
            
            
        }
        
        
    }
}

#Preview {
    ContentView()
}
