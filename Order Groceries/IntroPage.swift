//
//  IntroPage.swift
//  SnapNutriApp
//
//  Created by STDCX_MACBOOK PRO 38 on 04/08/2026.
//

import SwiftUI

struct IntroPage: View {
    
    let onGetStarted: () -> Void
    
    var body: some View {
        
        
        ZStack {
            
            Image("backgroundGetStarted")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .opacity(0.5)

                
            
            VStack {
                
                Image("snapnutri")
                    .resizable()
                    .frame(width: 95, height: 100)
                    .aspectRatio(contentMode: .fit)
                    .padding(.bottom, 12)
            
                
                Text("Track your meal with a photo.")
                    .font(.title3)
                    .bold()
                
                Text("Build your local food.")
                    .font(.title3)
                    .bold()
                    .padding(.bottom, 32)
                
                Button("Get Started"){
                    onGetStarted()
                }
                    .padding(20)
                    .padding(.horizontal,76)
                    .foregroundStyle(Color.white)
                    .background(.blue, in: RoundedRectangle(cornerRadius: 12))
                
                HStack {
                    Text("Already have account?")
                        .bold()
                    Text("Log in")
                        .foregroundStyle(.blue)
                    
                }
            }
            
        }
    }
}

#Preview {
    IntroPage {
        print("Get Started")
    }
}
