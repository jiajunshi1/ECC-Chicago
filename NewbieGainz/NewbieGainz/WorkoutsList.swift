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
    @EnvironmentObject private var userSettings: UserSettings
    
    @State private var pushToggle = false
    @State private var pullToggle = false
    @State private var legToggle = false

    private var pushWorkouts: [(name: String, imageName: String, videoId: String, instructions: [String], commonInjuries: [String])] = [
        ("Bench Press", "benchPressImg", "_FkbD0FhgVE", ["Eyes parallel with the bar.", "Back bent upwards.", "When picking up the bar, make sure your knuckles are facing the ceiling.", "Shoulders back.", "Bring the bar down to your chest then back up to eye length."], ["Elbows Too Wide\n\tRisk: Shoulder pain or injury\n\tFix: Tuck elbows in at about a 45° angle, not 90°", "Grip Too Wide\n\tRisk: Wrist or chest strain\n\tFix: Hands slightly wider than shoulder-width", ""]),
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
    
    var body: some View {
        NavigationStack() {
            VStack() {
                HStack() {
                    NavigationLink(destination: ContentView2()) {
                        Image("newbiebot")
                            .resizable()
                            .frame(width: 100, height: 75)
                    }
                    Spacer()
                    Image("weight")
                        .resizable()
                        .frame(width: 100, height: 100, alignment: .center)
                    Spacer()
                    Spacer()
                }
                
                Text("List of Workouts")
                    .bold()
                    .foregroundColor(Color.white)
                    .font(.title)
                Spacer()
                
                // filter
                HStack() {
                    Button("Push", action: {pushToggle = !pushToggle})
                        .foregroundColor(Color.white)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding()
                        .frame(width: 100, height: 50)
                        .background(pushToggle == true ? Color.gray.opacity(0.5) : Color.gray)
                        .font(.title2)
                        .contentShape(Rectangle())
                        .cornerRadius(5)
                    Spacer()
                    Button("Pull", action: {pullToggle = !pullToggle})
                        .foregroundColor(Color.white)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding()
                        .frame(width: 100, height: 50)
                        .background(pullToggle == true ? Color.gray.opacity(0.5) : Color.gray)
                        .font(.title2)
                        .contentShape(Rectangle())
                        .cornerRadius(5)
                    Spacer()
                    Button("Leg", action: {legToggle = !legToggle})
                        .foregroundColor(Color.white)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding()
                        .frame(width: 100, height: 50)
                        .background(legToggle == true ? Color.gray.opacity(0.5) : Color.gray)
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
                        
                        if (pushToggle == true || !(pullToggle ^ pushToggle ^ legToggle)) {
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
                        if (pullToggle == true || !(pullToggle ^ pushToggle ^ legToggle)){
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
                        if (legToggle == true || !(pullToggle ^ pushToggle ^ legToggle)) {
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
                Color(userSettings.backgroundColor)
                    .ignoresSafeArea()
            }
            Footer()
                .navigationBarBackButtonHidden(true)
        } // end nav stack
    }
}

#Preview {
    WorkoutsList()
        .environmentObject(UserSettings())
}
