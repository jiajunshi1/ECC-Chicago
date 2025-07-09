//
//  InfoPage.swift
//  NewbieGainz
//
//  Created by 56GOParticipant on 7/9/25.
//

import SwiftUI

struct InfoPage: View {
    @State private var showWhy = false
    @State private var showBreathing = false
    @State private var showPostureForm = false
    @State private var showGrip = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black
                    .ignoresSafeArea()
                
                ScrollView (.vertical, showsIndicators: true) {
                    VStack(spacing:20) {
                        Image(systemName: "info")
                            .resizable()
                            .foregroundColor(.black)
                            .background(Color.white)
                            .frame(width: 100, height: 100)
                        
                        Text("Basics")
                            .foregroundColor(.white)
                            .bold(true)
                            .font(.system(size: 45))
                        
                        Text("Click the buttons below to learn more")
                            .foregroundColor(.white)
                            .font(.system(size: 20))
                        
                        //dropdown feature - progressive
                        dropdown(title: "Why NewbieGainz?", isExpanded: $showWhy){
                            Text("Why us?... explain")
                                .foregroundColor(.black)
                                .font(.system(size: 25, weight: .bold))
                                .frame(width:250, height:100)
                                .background(Color.white)
                            
                        }
                        
                        if showWhy {
                            dropdown(title: "Breathing", isExpanded: $showBreathing){
                                Text("explanation...")
                                    .foregroundColor(.black)
                                    .font(.system(size: 25, weight: .bold))
                                    .frame(width:250, height:100)
                                    .background(Color.white)
                                
                            }
                        }
                        
                        if showBreathing {
                            dropdown(title: "Posture/Form", isExpanded: $showPostureForm){
                                Text("explanation...")
                                    .foregroundColor(.black)
                                    .font(.system(size: 25, weight: .bold))
                                    .frame(width:250, height:100)
                                    .background(Color.white)
                                
                            }
                        }
                        
                        if showPostureForm {
                            dropdown(title: "Grip", isExpanded: $showGrip){
                                Text("explanation...")
                                    .foregroundColor(.black)
                                    .font(.system(size: 25, weight: .bold))
                                    .frame(width:250, height:100)
                                    .background(Color.white)
                                
                            }
                        }
                        
                    } //vstack
                    .padding()
                    .background(Color.black)
                    .padding(.horizontal)
                } //scrollview
                
                
                
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
}
