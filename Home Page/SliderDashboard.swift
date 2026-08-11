//
//  WhatToEatNext.swift
//  SnapNutri
//
//  Created by STDCX_MACBOOK PRO 42 on 05/08/2026.
//

import SwiftUI

struct SliderDashboard: View {
    var body: some View {
        // TabView dengan style PageTabViewStyle menjadikan ia Slider/Carousel
        TabView {
            BannerCard(
                title: "What to eat next?",
                subtitle: "Let AI plan your next meal based on your daily goal.",
                buttonText: "Get Idea >",
                imageName: "MealSuggestion"
            )
            
            // Kad ke-2 untuk slider
            BannerCard(
                title: "Cook with what you have",
                subtitle: "Let AI suggest recipes based on ingredients in your fridge.",
                buttonText: "Get Recipes >",
                imageName: "cooking"
            )
            
            // Kad ke-3 untuk slider
            BannerCard(
                title: "Get your groceries now",
                subtitle: "Shopping with us and enjoy a lot of rewards.",
                buttonText: "Shop Now >",
                imageName: "groceries"
            )
        }
        .frame(height: 160) // Tentukan ketinggian banner slider
        .tabViewStyle(.page(indexDisplayMode: .always)) // Membolehkan kesan swipe/slider
    }
}

// MARK: - Subview Kad Banner
struct BannerCard: View {
    let title: String
    let subtitle: String
    let buttonText: String
    let imageName: String
    
    var body: some View {
        ZStack(alignment: .leading) {
            // 1. Gambar Latar Belakang
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(height: 150)
                .clipped()
            
            // 2. Lapisan Gelap (Overlay Gradient) supaya teks nampak jelas
            LinearGradient(
                colors: [
                    Color.black.opacity(0.75),
                    Color.black.opacity(0.4),
                    Color.clear
                ],
                startPoint: .leading,
                endPoint: .trailing
            )
            
            // 3. Teks & Butang
            VStack(alignment: .leading, spacing: 8) {
                VStack(alignment: .leading, spacing: 4) {
                    Text(title)
                        .font(.headline)
                        .bold()
                        .foregroundColor(.white) // Teks putih
                    
                    Text(subtitle)
                        .font(.caption)
                        .foregroundColor(.white.opacity(0.9))
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)
                }
                .frame(maxWidth: 200, alignment: .leading) // Hadkan lebar teks supaya tidak bertindih
                
                Button(action: {}) {
                    Text(buttonText)
                        .font(.caption2)
                        .bold()
                        .foregroundColor(.white)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 6)
                        .background(Color.green)
                        .cornerRadius(20)
                }
            }
            .padding(.leading, 16)
        }
        .frame(height: 140)
        .cornerRadius(16)
        .padding(.horizontal)
    }
}

#Preview {
    SliderDashboard()
}
