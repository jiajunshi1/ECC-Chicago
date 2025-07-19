//
//  NewUserPage.swift
//  NewbieGainz
//
//  Created by 56GOParticipant on 7/7/25.
//

import SwiftUI

struct NewUserPage: View {
    @State private var email = ""
    @State private var password = ""
    @Environment(\.dismiss) var dismiss
    @State private var backgroundColor = Color(Color.black.opacity(0.9))
    
    var body: some View {
        NavigationStack {
            ZStack {
                backgroundColor
                    .ignoresSafeArea()
                
                Text("Welcome New User!")
                    .foregroundColor(.white)
                    .bold(true)
                    .font(.system(size: 35))
                    .position(x:200,  y:110)
                
                //color
                Text("Choose Your Background Color")
                    .foregroundColor(.white)
                    .font(.system(size: 20, weight: .bold))
                    .position(x:200,  y:200)
                
                ColorPicker("Select Color", selection: $backgroundColor, supportsOpacity: false)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(100)
                    .labelsHidden()
                    .position(x:200, y:280)
                
                
                Text("Email:")
                    .foregroundColor(.white)
                    .font(.system(size: 28, weight: .bold))
                    .position(x:113,  y:350)
                
                TextField("", text:$email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width:250)
                    .position(x:200,  y:400)
                
                Text("Password:")
                    .foregroundColor(.white)
                    .font(.system(size: 28, weight: .bold))
                    .position(x:141,  y:475)
                
                SecureField("", text:$password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width:250)
                    .position(x:200,  y:525)
                
                Text("By creating an account, you agree to our \n")
                    .foregroundColor(.white)
                    .font(.system(size: 15))
                    .position(x:202,  y:700)
                
                //change to terms page
                NavigationLink(destination: ContentView()) {
                    Text("Terms of Service  ")
                        .foregroundColor(.blue)
                        .font(.system(size: 20, weight: .bold))
                }
                .position(x:200,  y:720)

                
                NavigationLink(destination: ContentView()) {
                    Text("Create Account!  ")
                    .foregroundColor(.black)
                    .font(.system(size: 23, weight: .bold))
                    .background(Color.white)
                }
                .position(x:200,  y:600)
                
            } // end zstack
            .navigationBarBackButtonHidden(true)
        } // end navstack
    }
}

#Preview {
    NewUserPage()
}
