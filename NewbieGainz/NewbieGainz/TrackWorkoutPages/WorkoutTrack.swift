//
//  WorkoutTrack.swift
//  NewbieGainz
//
//  Created by 56GOParticipant on 7/10/25.
//

import SwiftUI
//predetermined workedout just for presentation
// videos for each exercise - decide how to show
struct WorkoutTrack: View {
    @EnvironmentObject private var userSettings: UserSettings
    
    @State private var selectedWeight = 20
    @State private var selectedSet = 0
    
    @State private var timeRemaining = 180
    @State private var timerRunning = false
    @State private var setCount = 0
    @State private var timer: Timer?
    @State private var showContinueButton = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(userSettings.backgroundColor)
                    .ignoresSafeArea()
                VStack {
                    HStack() {
                        NavigationLink(destination: ContentView2()) {
                            Image("newbiebot")
                                .resizable()
                                .frame(width: 100, height: 75)
                        }
                        Spacer()
                    }
                    .position(x: 225, y: 50)
                    
                    Image("logo")
                        .resizable()
                        .frame(width: 150, height: 100)
                        .position(x: 200, y: 50)
                    
                    Text(formattedDate)
                        .foregroundColor(.white)
                        .position(x: 200, y: 100)
                        .font(.system(size: 33))
                    
                    Text("Bench Press")
                        .foregroundColor(.white)
                        .position(x: 200, y: 180)
                        .font(.system(size: 30))
                    
                    NavigationLink(destination: WorkoutTile(name: "Bench Press", img: "benchPressImg", videoId: "_FkbD0FhgVE",instructions: ["Eyes parallel with the bar.", "Back bent upwards.", "When picking up the bar, make sure your knuckles are facing the ceiling.", "Shoulders back.", "Bring the bar down to your chest then back up to eye length."], commonInjuries: ["Elbows Too Wide\n\tRisk: Shoulder pain or injury\n\tFix: Tuck elbows in at about a 45° angle, not 90°", "Grip Too Wide\n\tRisk: Wrist or chest strain\n\tFix: Hands slightly wider than shoulder-width", ""])) {
                        Image(systemName: "play.circle.fill")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .padding()
                            .background(Color.white)
                            .foregroundColor(.black)
                            .cornerRadius(100)
                            //.position(x: 200, y: 280)
                    }
                    .navigationBarBackButtonHidden(true)
                    .padding(.top, 200)
                //} //zstack2
                    
                    .padding(.bottom,-350)
                    HStack {
                        Text("Weight")
                            .frame(width: 100, height: 30)
                            .foregroundColor(.white)
                            .font(.system(size: 30))
                        
                        
                        Picker("Weight", selection: $selectedWeight) {
                            ForEach(Array(stride(from: 20, through: 200, by: 5)), id: \.self) { weight in
                                Text("\(weight) lbs")
                                //.font(.system(size: 10))
                                    .tag(weight)
                            }
                        }
                        .pickerStyle(.menu)
                        .background(Color.white)
                        .frame(height:200)
                        .cornerRadius(1000)
                        .accentColor(.black)
                    } //hstack
                    .padding(.top, 300)
                    .padding(.bottom, -20)
                    
                    //timer stuff
                    Text("Set Count: \(setCount)")
                        .font(.system(size: 28))
                        .foregroundColor(.white)
                    Spacer()
                        .frame(height: 140)

                    Group {
                        
                        if timerRunning {
                            Text("Seconds left: \(timeRemaining)")
                                .foregroundColor(.yellow)
                                .font(.system(size: 25))
                        } else if setCount < 2 {
                            Button(action: startTimer) {
                                Text("Start Rest Timer")
                                    .padding()
                                    .background(Color.green)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                                    .font(.system(size: 20, weight: .bold))
                            }
                        } else {
                            NavigationLink(destination: Feedback()) {
                                Text("Continue")
                                    .padding()
                                    .background(Color.green)
                                    .foregroundColor(.white)
                                    .cornerRadius(100)
                                    .font(.system(size: 20))
                            }
                        }
                    }
                    .frame(height:50)//grouping for fixed screen
                    
                    .padding(.top, -100)
                    Spacer().frame(height:50)
                        .padding(.bottom, -30)
                } //vStack
                
            }//zStack
            Footer()
            .navigationBarBackButtonHidden(true)
        }//navigationStack
    } //var body
    
    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter.string(from: Date())
    }
    func startTimer() {
        guard !timerRunning else { return }
        
        showContinueButton = false
        timeRemaining = 1
        setCount += 1
        timerRunning = true
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { t in
            if timeRemaining > 0 {
                timeRemaining -= 1
            } else {
                t.invalidate()
                timerRunning = false
                if (setCount > 2) {
                    showContinueButton = true;
                }
            }
        }
    }
    
}

#Preview {
    WorkoutTrack()
        .environmentObject(UserSettings())
}
