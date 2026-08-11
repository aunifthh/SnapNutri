//
//  OnboardingView.swift
//  SnapNutri
//
//  Created by STDCX_MACBOOK PRO 38 on 10/08/2026.
//

import SwiftUI

struct OnboardingView: View {
    // MARK: - Onboarding State
    
    @State private var currentPage = 0
    @State private var showIntro = true
    @State private var onboardingComplete = false
    @State private var bmi: Double = 0

    
    var body: some View {
        
        // MARK: - Dashboard
        
        if onboardingComplete {
            
            //ContentView(bmi: bmi)
            
        }
        
        // MARK: - Intro Page
        
        else if showIntro {
            
            IntroPage {
                withAnimation {
                    showIntro = false
                    currentPage = 0
                }
            }
            
        }
        
        // MARK: - Onboarding Slider
        
        else {
            
            TabView(selection: $currentPage) {
                
                // MARK: Page 1 - Assessment
                
                AssessmentView(
                    bmi: $bmi
                ) {
                    withAnimation {
                        currentPage = 1
                    }
                }
                .tag(0)
                
                
                // MARK: Page 2 - Goal Selection
                
                GoalSelectionView {
                    withAnimation {
                        currentPage = 2
                    }
                }
                .tag(1)
                
                
                // MARK: Page 3 - Dietary Needs
                
                DietaryNeedsView {
                    withAnimation {
                        onboardingComplete = true
                    }
                }
                .tag(2)
            }
            .tabViewStyle(
                .page(indexDisplayMode: .always)
            )
        }
    }
}


// MARK: - Preview

#Preview {
    OnboardingView()
}
