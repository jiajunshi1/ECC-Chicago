//
//  WorkoutTile.swift
//  NewbieGainz
//
//  Created by 39GOParticipant on 7/7/25.
//

import SwiftUI
import WebKit

struct WorkoutTile: View {
    @EnvironmentObject private var userSettings: UserSettings
    
    var name: String
    var img: String
    var videoId: String
    var instructions: [String]
    var commonInjuries: [String]
    
    var body: some View {
        NavigationStack {
                
            ZStack {
                Color(userSettings.backgroundColor)
                    .ignoresSafeArea()
                ScrollView {
                    VStack() {
                        Text(name)
                            .foregroundColor(.white)
                            .font(.system(size: 30))
                            .multilineTextAlignment(.center)
                            .bold()
                            .padding(.top, 60)
                        
                        Image(img)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 250)
                            .padding()

                        if !videoId.isEmpty {
                            YouTubeView(videoID: videoId)
                                .frame(height: 250)
                                .cornerRadius(12)
                                .padding(.horizontal)
                        } else {
                            Text("No video available.")
                                .foregroundColor(.gray)
                                .padding()
                            }
                        
                        Text("Scroll down learn more")
                            .foregroundColor(.white)
                            .font(.system(size: 30))
                            .padding(.top, 30)
                        
                        Text("Instructions for doing this Exercise:")
                            .foregroundColor(.white)
                            .font(.system(size: 30))
                            .padding(.top, 30)
                        
                        VStack(alignment: .leading, spacing: 10) {
                            ForEach(instructions.indices, id: \.self) { i in
                                Text("\(i+1). \(instructions[i])")
                                    .foregroundColor(.white)
                                    .font(.system(size: 18))
                                    .padding()
                                    .background(Color.black.opacity(0.2)) // Box color
                                    .cornerRadius(10)
                                    .padding(.horizontal)
                                }
                        } //vstack for tips
                        
                        Text("Common Injuries:")
                            .foregroundColor(.white)
                            .font(.system(size: 30))
                            .padding(.top, 30)
                        
                        VStack(alignment: .leading, spacing: 10) {
                            ForEach(commonInjuries.indices, id: \.self) { i in
                                Text("\(i+1). \(commonInjuries[i])")
                                    .foregroundColor(.white)
                                    .font(.system(size: 18))
                                    .padding()
                                    .background(Color.black.opacity(0.2)) // Box color
                                    .cornerRadius(10)
                                    .padding(.horizontal)
                                }
                        } //vstack for tips

                        
                    } // end vstack
                }//scrollview
                
            } //zstack
        } //navigationStack
        .onAppear {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = UIColor.black
            appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
            
            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
            UINavigationBar.appearance().compactAppearance = appearance
        }
        
    }
}

struct YouTubeView: UIViewRepresentable {
    let videoID: String

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let url = URL(string: "https://www.youtube.com/embed/\(videoID)?playsinline=1") else {
            return
        }
        let request = URLRequest(url: url)
        uiView.scrollView.isScrollEnabled = false
        uiView.load(request)
    }
}


#Preview {
    WorkoutTile(name: "WORKOUT NAME", img: "placeholder", videoId: "_FkbD0FhgVE",instructions: ["", "", ""], commonInjuries: ["", "", ""])
        .environmentObject(UserSettings())
}
