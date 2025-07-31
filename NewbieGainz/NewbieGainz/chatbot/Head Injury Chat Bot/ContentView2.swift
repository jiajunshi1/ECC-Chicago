//
//  ContentView.swift
//  Head Injury Chat Bot
//
//  Created by Scott Whitcomb on 7/16/25.
//

import SwiftUI

struct ContentView2: View {
    @EnvironmentObject private var userSettings: UserSettings
    
    @StateObject var viewModel = ChatViewModel()
    @State private var inputText = ""

    var body: some View {
        NavigationView {
            VStack {
                ScrollViewReader { proxy in
                    ScrollView {
                        Image("newbiebot")
                            .resizable()
                            .frame(width: 125, height: 100)
                        Text("NewbieBot")
                            .foregroundColor(.white)
                            .bold()
                        Text("Hello! Please describe your injury in detail or ask any questions about working out.")
                            .padding()
                            .background(.gray.opacity(0.5))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                        
                        ForEach(viewModel.messages) { message in
                            HStack {
                                if message.isUser {
                                    Spacer()
                                    Text(message.text)
                                        .padding()
                                        .background(Color.blue.opacity(0.3))
                                        .cornerRadius(10)
                                        .foregroundColor(.white)
                                } else {
                                    Text(message.text)
                                        .padding()
                                        .background(urgencyColor(for: message.text))
                                        .cornerRadius(10)
                                        .foregroundColor(.white)
                                    Spacer()
                                }
                            }
                            .padding(.horizontal)
                            .id(message.id)
                        }
                    }
                    .onChange(of: viewModel.messages.count) { _ in
                        if let last = viewModel.messages.last {
                            proxy.scrollTo(last.id, anchor: .bottom)
                        }
                    }
                } // end scroll view

                HStack {
                    TextField("Ask the NewbieBot anything...", text: $inputText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())

                    Button("Send") {
                        guard !inputText.isEmpty else { return }
                        viewModel.sendMessage(inputText)
                        inputText = ""
                    }
                } // end hstack
                .padding()
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
            .navigationTitle("Ask NewbieBot:")
        }
    }

    func urgencyColor(for text: String) -> Color {
        if text.contains("🔴") {
            return Color.red.opacity(0.2)
        } else if text.contains("🟠") {
            return Color.orange.opacity(0.2)
        } else if text.contains("🟢") {
            return Color.green.opacity(0.2)
        } else {
            return Color.gray.opacity(0.1)
        }
    }
}

#Preview {
    ContentView2()
        .environmentObject(UserSettings())
}
