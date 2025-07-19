//
//  WorkoutsList.swift
//  NewbieGainz
//
//  Created by 39GOParticipant on 7/9/25.
//

import SwiftUI

extension Bool {
    static func ^ (left: Bool, right: Bool) -> Bool {
        return left != right
    }
}

struct WorkoutsList: View {
    @State private var pushToggle = false
    @State private var pullToggle = false
    @State private var legToggle = false

    private var pushWorkouts: [(name: String, imageName: String, videoId: String, instructions: [String], commonInjuries: [String])] = [
        ("Bench Press", "benchPressImg", "_FkbD0FhgVE", ["Eyes parallel with the bar.", "Back bent upwards.", "When picking up the bar, make sure your knuckles are facing the ceiling.", "Shoulders back.", "Bring the bar down to your chest then back up to eye length."], ["", "", ""]),
        ("Tricep Pushdown", "tricepPushdownImg", "", ["", "", ""], ["", "", ""]),
        ("Shoulder Press", "shoulderPressImg", "", ["", "", ""], ["", "", ""]),
        ("Lateral Raise", "lateralRaisesImg", "", ["", "", ""], ["", "", ""])
    ]
    
    private var pullWorkouts: [(name: String, imageName: String, videoId: String, instructions: [String], commonInjuries: [String])] = [
        ("Pull-up", "pullUpImg", "", ["", "", ""], ["", "", ""]),
        ("Seated Row", "seatedRowImg", "", ["", "", ""], ["", "", ""]),
        ("Lat Pulldown", "latPulldownImg", "", ["", "", ""], ["", "", ""]),
        ("Hammer Curl", "hammerCurlImg", "", ["", "", ""], ["", "", ""])
    ]
    
    private var legWorkouts: [(name: String, imageName: String, videoId: String, instructions: [String], commonInjuries: [String])] = [
        ("Squat", "squatImg", "", ["", "", ""], ["", "", ""]),
        ("Leg Extension", "legExtensionImg", "", ["", "", ""], ["", "", ""]),
        ("Leg Curl", "legCurlsImg", "", ["", "", ""], ["", "", ""]),
        ("Calf Raise", "calfRaiseImg", "", ["", "", ""], ["", "", ""])
    ]
    
//    private var allWorkouts : [(name: String, imageName: String)] = []
//    // FIX THIS
//    
//    mutating func resetFilter() {
//        if (pushToggle ^ pullToggle ^ legToggle) {
//            allWorkouts = pushWorkouts + pullWorkouts + legWorkouts;
//            return;
//        }
//        
//        if (pushToggle) {
//            allWorkouts += pushWorkouts
//            
//        }
//        
//        if (pullToggle) {
//            allWorkouts += pullWorkouts
//            
//        }
//        
//        if (legToggle) {
//            allWorkouts += legWorkouts
//            
//        }
//    }
        
    
    var body: some View {
        NavigationStack() {
            VStack() {
                Image("weight")
                    .resizable()
                    .frame(width: 100, height: 100)
                Text("List of Workouts")
                    .bold()
                    .foregroundColor(Color.white)
                    .font(.title)
                Spacer()
                
                // filter
                HStack() {
                    Button("Push", action: {pushToggle = true; pullToggle = false; legToggle = false})
                        .foregroundColor(Color.white)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding()
                        .frame(width: 100, height: 50)
                        .background(Rectangle().fill(Color.gray))
                        .font(.title2)
                        .contentShape(Rectangle())
                        .cornerRadius(5)
                    Spacer()
                    Button("Pull", action: {pushToggle = false; pullToggle = true; legToggle = false})
                        .foregroundColor(Color.white)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding()
                        .frame(width: 100, height: 50)
                        .background(Rectangle().fill(Color.gray))
                        .font(.title2)
                        .contentShape(Rectangle())
                        .cornerRadius(5)
                    Spacer()
                    Button("Leg", action: {pushToggle = false; pullToggle = false; legToggle = true})
                        .foregroundColor(Color.white)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding()
                        .frame(width: 100, height: 50)
                        .background(Rectangle().fill(Color.gray))
                        .font(.title2)
                        .contentShape(Rectangle())
                        .cornerRadius(5)
                }
                Spacer()
                
                // tiles -- wrap each in navigation links
                ScrollView () {
                    LazyVGrid(columns: [
                        .init(.fixed(175)),
                        .init(.fixed(175))
                    ], spacing: 25) {
                        if (pullToggle == true) {
                            ForEach(pullWorkouts, id: \.name) {
                                item in
                                NavigationLink(destination: WorkoutTile(name: item.name, img: item.imageName, videoId: item.videoId, instructions: item.instructions, commonInjuries: item.commonInjuries)) {
                                    VStack {
                                        Image(item.imageName)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height: 150)
                                        Text(item.name)
                                            .foregroundColor(.white)
                                            .bold()
                                    }
                                    .padding()
                                    .background(Color.gray.opacity(0.2))
                                    .cornerRadius(10)
                                }
                            }
                        }
                        else if (pushToggle == true){
                            ForEach(pushWorkouts, id: \.name) {
                                item in
                                NavigationLink(destination: WorkoutTile(name: item.name, img: item.imageName, videoId: item.videoId, instructions: item.instructions, commonInjuries: item.commonInjuries)) {
                                    VStack {
                                        Image(item.imageName)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height: 150)
                                        Text(item.name)
                                            .foregroundColor(.white)
                                            .bold()
                                    }
                                    .padding()
                                    .background(Color.gray.opacity(0.2))
                                    .cornerRadius(10)
                                }
                            }
                        }
                        else {
                            ForEach(legWorkouts, id: \.name) {
                                item in
                                NavigationLink(destination: WorkoutTile(name: item.name, img: item.imageName, videoId: item.videoId, instructions: item.instructions, commonInjuries: item.commonInjuries)) {
                                    VStack {
                                        Image(item.imageName)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height: 150)
                                        Text(item.name)
                                            .foregroundColor(.white)
                                            .bold()
                                    }
                                    .padding()
                                    .background(Color.gray.opacity(0.2))
                                    .cornerRadius(10)
                                }
                            }
                        }
                        
                        
                        
                    } // end lazy vgrid
                } // end scroll view
            } // end vstack
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
    }
}

#Preview {
    WorkoutsList()
}
