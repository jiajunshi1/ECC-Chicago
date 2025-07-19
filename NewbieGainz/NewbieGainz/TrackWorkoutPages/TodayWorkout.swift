//
//  TodayWorkout.swift
//  NewbieGainz
//
//  Created by 39GOParticipant on 7/15/25.
//

import SwiftUI

struct TodayWorkout: View {
    var body: some View {
        NavigationStack() {
            VStack() {
                Image("calendar")
                    .resizable()
                    .frame(width: 100, height: 100)
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
                HStack() {
                    NavigationLink(destination: FitnessGoalsSetup())
                    {
                        Text("Edit Goals")
                    }
                    
                    Spacer()
                    
                    NavigationLink(destination: CalendarSetup())
                    {
                        Text("Edit Workout")
                    }
                }
                .font(.system(size: 20))
                .foregroundStyle(.gray)
                .navigationBarBackButtonHidden(true)
                
                Spacer()
                
                HStack() {
                    Spacer()
                    VStack() {
                        Text("mm/dd/yyyy")
                            .bold()
                            .foregroundColor(Color.white)
                            .font(.title)
                        Text("Today's Workout")
                            .bold()
                            .foregroundColor(Color.white)
                            .font(.title)
                    }
                    Spacer()
                }
                
                Spacer()
                
                VStack() {
                    Text("Leg Day")
                        .bold()
                        .foregroundColor(Color.white)
                        .font(.title)
                    
                    Rectangle()
                        .padding()
                        .background(.gray)
                        .foregroundColor(.gray)
                        .frame(height: 25)
                    
                    NavigationLink(destination: WorkoutTrack())
                    {
                        VStack()
                        {
                            Text("Start")
                            Text("Workout")
                        }
                        .fixedSize(horizontal: false, vertical: true)
                        .padding()
                        .frame(width: 150, height: 150)
                        .background(Rectangle().fill(Color.black.opacity(0.3)))
                        .cornerRadius(25)
                    }
                }
                .foregroundColor(Color.white)
                .fixedSize(horizontal: false, vertical: true)
                .padding()
                .frame(width: 300, height: 300)
                .background(Rectangle().fill(Color.gray))
                .font(.title)
                .contentShape(Rectangle())
                .cornerRadius(25)
                
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
    TodayWorkout()
}
