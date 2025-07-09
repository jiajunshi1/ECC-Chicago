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
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black
                    .ignoresSafeArea()
                
                Text("Welcome New User!")
                    .foregroundColor(.white)
                    .bold(true)
                    .font(.system(size: 35))
                    .position(x:200,  y:110)
                
                Text("Email:")
                    .foregroundColor(.white)
                    .font(.system(size: 28, weight: .bold))
                    .position(x:113,  y:300)
                
                TextField("", text:$email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width:250)
                    .position(x:200,  y:335)
                
                Text("Password:")
                    .foregroundColor(.white)
                    .font(.system(size: 28, weight: .bold))
                    .position(x:141,  y:410)
                
                SecureField("", text:$password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width:250)
                    .position(x:200,  y:445)

                Text("By creating an account, you agree to our \n")
                    .foregroundColor(.white)
                    .font(.system(size: 15))
                    .position(x:202,  y:610)
                
                //change to terms page
                NavigationLink(destination: ContentView()) {
                    Text("Terms of Service  ")
                        .foregroundColor(.blue)
                        .font(.system(size: 20, weight: .bold))
                }
                .position(x:200,  y:630)
                
                
                
                Button("Create Account!  ") {
                    dismiss()
                }
                        .foregroundColor(.black)
                        .font(.system(size: 23, weight: .bold))
                        .background(Color.white)
                        .position(x:200,  y:520)
                
            }
            
            
        }    }
}

#Preview {
    NewUserPage()
}
