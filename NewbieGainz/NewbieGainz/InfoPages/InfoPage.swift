//
//  InfoPage.swift
//  NewbieGainz
//
//  Created by 56GOParticipant on 7/9/25.
//

import SwiftUI

struct InfoPage: View {
    @EnvironmentObject private var userSettings: UserSettings
    
    @State private var showWhy = false
    @State private var showBreathing = false
    @State private var showPostureForm = false
    @State private var showGrip = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(userSettings.backgroundColor)
                    .ignoresSafeArea()
                
                VStack(spacing:20) {
                    Image("info")
                        .resizable()
                        .frame(width: 75, height: 75)
//                        .position(x:200, y:50)
                    
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
                    
                    HStack() {
                        Spacer()
                        Spacer()
                        
                        Text("Basics")
                            .foregroundColor(.white)
                            .bold(true)
                            .font(.system(size: 45))
                        
                        Spacer()
                        
                        // next button
                        NavigationLink(destination: FitnessGoalsSetup() .navigationBarBackButtonHidden(true)) {
                            Image("right")
                                .resizable()
                                .frame(width: 50, height: 50)
                        }
                    }
                    
                    Text("Click the buttons below to learn more")
                        .foregroundColor(.white)
                        .font(.system(size: 20))
                    ScrollView (.vertical, showsIndicators: true) {
                        //dropdown feature - progressive
                        dropdown(title: "Why NewbieGainz?", isExpanded: $showWhy){
                            Text("NewbieGainz helps gym beginners build consistency and confidence through a series of simple steps and injury prevention, ultimately building habits that will last a lifetime." )
                                .foregroundColor(.black)
                                .font(.system(size: 20))
                                .frame(width:300)
                                .background(Color.white)
                        }
                        
                        dropdown(title: "Breathing During Workout", isExpanded: $showBreathing){
                            Text("When you're working out, it's important to breathe  properly. A simple rule is: \n\nBreathe in (inhale) when you're lowering the weight.\n\nBreathe out (exhale) when you're lifting the weight.")
                                .foregroundColor(.black)
                                .font(.system(size: 20))
                                .frame(width:300)
                                .background(Color.white)
                        }
                    
                        dropdown(title: "Posture/Form", isExpanded: $showPostureForm){
                            Text("explanation...")
                                .foregroundColor(.black)
                                .font(.system(size: 20))
                                .frame(width:250)
                                .background(Color.white)
                        }
                    
                        dropdown(title: "Grip", isExpanded: $showGrip){
                            Text("explanation...")
                                .foregroundColor(.black)
                                .font(.system(size: 20))
                                .frame(width:250)
                                .background(Color.white)
                        }
                        
                    } //vstack
                    .padding()
                    .padding(.horizontal)
                } //scrollview
                .navigationBarBackButtonHidden(true)
            } //zstack
        } //navigationstack
    }
    
    
    @ViewBuilder
        func dropdown<Content: View>(title: String, isExpanded: Binding<Bool>, @ViewBuilder content: @escaping () -> Content) -> some View {
            VStack(spacing: 0) {
                Button(action: {
                    withAnimation {
                        isExpanded.wrappedValue.toggle()
                    }
                }) {
                    HStack {
                        Text(title)
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.black)
                        Spacer()
                        Image(systemName: isExpanded.wrappedValue ? "chevron.up" : "chevron.down")
                            .foregroundColor(.gray)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .cornerRadius(12)
                    .shadow(radius: 2)
                }

                if isExpanded.wrappedValue {
                    VStack {
                        content()
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .background(Color(UIColor.systemGray6))
                    .cornerRadius(12)
                    .transition(.opacity.combined(with: .move(edge: .top)))
                }
            }
        }
}

#Preview {
    InfoPage()
        .environmentObject(UserSettings())
}
