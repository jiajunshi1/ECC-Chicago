//
//  PainPage.swift
//  NewbieGainz
//
//  Created by 56GOParticipant on 7/16/25.
//

import SwiftUI

struct PainPage: View {
    var body: some View {
        NavigationStack {
            
            ZStack {
                Color.black
                    .ignoresSafeArea()
                
                VStack {
                    Text("Where do you feel this pain?")
                        .foregroundColor(.white)
                        .font(.system(size: 35))
                    
                    Text("Is this a recurring pain?")
                        .foregroundColor(.white)
                        .font(.system(size: 35))
                    
                    HStack(spacing:80){ //hstack
                        NavigationLink(destination: PainPage()) {
                            Text("YES")
                                .foregroundColor(.black)
                                .padding()
                                .background(Color.red)
                                .font(.system(size: 35, weight: .bold))
                                .cornerRadius(100)
                        }
                        Button (action: {} ) {
                            Text("NO")
                                .foregroundColor(.black)
                                .padding()
                                .background(Color.green)
                                .font(.system(size: 35, weight: .bold))
                                .cornerRadius(100)
                        }
                        
                    } //hstack
                    
                    Text("Is this pain only during this exercise or does it last after (6-8hours)")
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
                        Button (action: {} ) {
                            Text("NO")
                                .foregroundColor(.black)
                                .padding()
                                .background(Color.green)
                                .font(.system(size: 35, weight: .bold))
                                .cornerRadius(100)
                        }
                        
                    } //hstack2
                    
                }//VStack
            }//Zstack
            .navigationBarBackButtonHidden(true)
        }//navigationStack
        
        
    }
}

#Preview {
    PainPage()
}
