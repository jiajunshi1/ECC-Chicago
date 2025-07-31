//
//  ToningPage.swift
//  NewbieGainz
//
//  Created by 39GOParticipant on 7/22/25.
//
import SwiftUI

struct ToningPage: View {
    @EnvironmentObject private var userSettings: UserSettings
    
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
                    Image("logo")
                        .resizable()
                        .frame(width: 150, height: 100)
                    Spacer()
                    Spacer()
                }
                
                Text("Toning")
                    .bold()
                    .foregroundColor(Color.white)
                    .font(.system(size: 35))
                
                Spacer()
                Spacer()
                
                Text("Toning is building muscle and reducing body fat for a more defined and sculpted physique")
                    .foregroundColor(.white)
                    .font(.title2)
                    .padding()
                
                Spacer()
                Spacer()
                
                Text("Muscle toning also helps to: ")
                    .foregroundColor(.white)
                    .bold()
                    .font(.title3)
                    .padding(.top)
                
                Spacer()
                HStack(alignment: .top) {
                    Text("•")
                        .fontWeight(.semibold)
                    Text("Increase stamina")
                }
                .foregroundColor(.white)
                
                HStack(alignment: .top) {
                    Text("•")
                        .fontWeight(.semibold)
                    Text("Decrease likelihood of health issues")
                }
                .foregroundColor(.white)
                
                HStack(alignment: .top) {
                    Text("•")
                        .fontWeight(.semibold)
                    Text("Improve posture")
                }
                .foregroundColor(.white)
                
                HStack(alignment: .top) {
                    Text("•")
                        .fontWeight(.semibold)
                    Text("Improve mental health")
                }
                .foregroundColor(.white)
                
                HStack(alignment: .top) {
                    Text("•")
                        .fontWeight(.semibold)
                    Text("Improve self-confidence")
                }
                .foregroundColor(.white)
                
                Spacer()
                Spacer()
                
                Text("How to tone your muscles:")
                    .foregroundColor(.white)
                    .bold()
                    .padding(.top)
                    .font(.title3)
                Spacer()
                
                HStack(alignment: .top) {
                    Text("•")
                        .fontWeight(.semibold)
                    Text("Prioritize cardio workouts")
                }
                .foregroundColor(.white)
                
                HStack(alignment: .top) {
                    Text("•")
                        .fontWeight(.semibold)
                    Text("Be consistent with medium weights")
                }
                .foregroundColor(.white)
                
                HStack(alignment: .top) {
                    Text("•")
                        .fontWeight(.semibold)
                    Text("Focus less on bulking")
                }
                .foregroundColor(.white)
                
                HStack(alignment: .top) {
                    Text("•")
                        .fontWeight(.semibold)
                    Text("Eat healthy calories")
                }
                .foregroundColor(.white)
                
                Spacer()
                Spacer()
                
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
        }
    }
}

#Preview {
    ToningPage()
        .environmentObject(UserSettings())
}
