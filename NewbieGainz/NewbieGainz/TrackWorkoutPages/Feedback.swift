//
//  feedback.swift
//  NewbieGainz
//
//  Created by 56GOParticipant on 7/14/25.
//

import SwiftUI

struct Feedback: View {
    @State private var selectedFeedback: String? = nil
    @State private var showNextExercise = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black
                    .ignoresSafeArea()
                VStack {
                    Text("How was your workout?")
                        .foregroundColor(.white)
                        .padding(.top, 100)
                        .font(.system(size: 35))
                    
                    HStack (spacing:30){
                        FeedbackFace(emoji: "😊", label: "Easy", selected: $selectedFeedback)
                        FeedbackFace(emoji: "😐", label: "Moderate", selected: $selectedFeedback)
                        FeedbackFace(emoji: "😡", label: "Hard", selected: $selectedFeedback)
                    } //hstack
                    .padding(.bottom, 100)
                    
                    Text("Was there any pain?")
                        .foregroundColor(.white)
                        .font(.system(size: 35))
                    
                    HStack(spacing:80){ //hstack2
                        NavigationLink(destination: PainPage()) {
                            Text("YES")
                                .foregroundColor(.black)
                                .padding()
                                .background(Color.red)
                                .font(.system(size: 35, weight: .bold))
                                .cornerRadius(100)
                        }
                        Button (action: {showNextExercise = true} ) {
                            Text("NO")
                                .foregroundColor(.black)
                                .padding()
                                .background(Color.green)
                                .font(.system(size: 35, weight: .bold))
                                .cornerRadius(100)
                        }
                        
                    } //hstack2
                    
                    .padding(.bottom,50)
                    if showNextExercise {
                        NavigationLink(destination: WorkoutTrack()) {
                            Text("Next Exercise")
                                .foregroundColor(.black)
                                .padding()
                                .background(Color.green)
                                .font(.system(size: 35, weight: .bold))
                                .cornerRadius(100)
                        }
                    }
                }//vstack
            }//ZStack
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct FeedbackFace: View {
    let emoji: String
    let label: String
    @Binding var selected: String?
    
    var body: some View {
        Button(action: {
            selected = label
        }) {
            VStack {
                Text(emoji)
                    .font(.system(size: 60))
                Text(label)
                    .foregroundColor(.white)
                    .font(.headline)
            }
            .padding()
            .background(selected == label ? Color.green.opacity(0.8) : Color.gray.opacity(0.2))
            .cornerRadius(15)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(selected == label ? Color.green : Color.clear, lineWidth: 2)
            )
            .navigationBarBackButtonHidden(true)
        } // end button
    } // end body
}

#Preview {
    Feedback()
}
