//
//  CalendarSetup.swift
//  NewbieGainz
//
//  Created by 39GOParticipant on 7/7/25.
//

import SwiftUI

struct CalendarSetup: View {
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
                    NavigationLink(destination: WorkoutsList() .navigationBarBackButtonHidden(true)) {
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
                        Button(action: {}) {
                            VStack() {
                                Text("Su")
                                    .bold()
                                    .foregroundStyle(.black)
                                    .font(.title)
                                Text(" ")
                            }
                        }
                        .fixedSize(horizontal: false, vertical: true)
                        .padding()
                        .frame(width: 125, height: 125)
                        .background(Color.gray)
                        .contentShape(Rectangle())
                        .cornerRadius(5)
                        
                        Button(action: {}) {
                            VStack() {
                                Text("M")
                                    .bold()
                                    .foregroundStyle(.black)
                                    .font(.title)
                                Text(" ")
                                
                            }
                        }
                        .fixedSize(horizontal: false, vertical: true)
                        .padding()
                        .frame(width: 125, height: 125)
                        .background(Color.gray)
                        .contentShape(Rectangle())
                        .cornerRadius(5)
                        
                        Button(action: {}) {
                            VStack() {
                                Text("Tu")
                                    .bold()
                                    .foregroundStyle(.black)
                                    .font(.title)
                                Text(" ")
                            }
                        }
                        .fixedSize(horizontal: false, vertical: true)
                        .padding()
                        .frame(width: 125, height: 125)
                        .background(Color.gray)
                        .contentShape(Rectangle())
                        .cornerRadius(5)
                        
                        Button(action: {}) {
                            VStack() {
                                Text("W")
                                    .bold()
                                    .foregroundStyle(.black)
                                    .font(.title)
                                Text(" ")
                            }
                        }
                        .fixedSize(horizontal: false, vertical: true)
                        .padding()
                        .frame(width: 125, height: 125)
                        .background(Color.gray)
                        .contentShape(Rectangle())
                        .cornerRadius(5)
                        
                        Button(action: {}) {
                            VStack() {
                                Text("Th")
                                    .bold()
                                    .foregroundStyle(.black)
                                    .font(.title)
                                Text(" ")
                            }
                        }
                        .fixedSize(horizontal: false, vertical: true)
                        .padding()
                        .frame(width: 125, height: 125)
                        .background(Color.gray)
                        .contentShape(Rectangle())
                        .cornerRadius(5)
                        
                        Button(action: {}) {
                            VStack() {
                                Text("F")
                                    .bold()
                                    .foregroundStyle(.black)
                                    .font(.title)
                                Text(" ")
                            }
                        }
                        .fixedSize(horizontal: false, vertical: true)
                        .padding()
                        .frame(width: 125, height: 125)
                        .background(Color.gray)
                        .contentShape(Rectangle())
                        .cornerRadius(5)
                        
                        Button(action: {}) {
                            VStack() {
                                Text("Sa")
                                    .bold()
                                    .foregroundStyle(.black)
                                    .font(.title)
                                Text(" ")
                            }
                        }
                        .fixedSize(horizontal: false, vertical: true)
                        .padding()
                        .frame(width: 125, height: 125)
                        .background(Color.gray)
                        .contentShape(Rectangle())
                        .cornerRadius(5)
                        
                    } // end hstack
                } // end scroll view
                
                Spacer()
                
                // buttons
                Button("Push", action: {})
                    .foregroundColor(Color.white)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding()
                    .frame(width: 150, height: 75)
                    .background(Rectangle().fill(Color.gray))
                    .font(.title)
                    .contentShape(Rectangle())
                    .cornerRadius(5)
                Button("Pull", action: {})
                    .foregroundColor(Color.white)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding()
                    .frame(width: 150, height: 75)
                    .background(Rectangle().fill(Color.gray))
                    .font(.title)
                    .contentShape(Rectangle())
                    .cornerRadius(5)
                Button("Leg", action: {})
                    .foregroundColor(Color.white)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding()
                    .frame(width: 150, height: 75)
                    .background(Rectangle().fill(Color.gray))
                    .font(.title)
                    .contentShape(Rectangle())
                    .cornerRadius(5)
                
                Spacer()
                
            } // end vbox
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()
            .background
            {
                Color(Color.black.opacity(0.9))
                    .ignoresSafeArea()
            }
            
            Footer()
                .navigationBarBackButtonHidden(true)
        } // end nav stack
    } // end body
}

#Preview {
    CalendarSetup()
}
