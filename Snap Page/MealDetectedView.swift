//
//  MealDetectedView.swift
//  SnapNutri
//
//  Created by STDCX_MACBOOK PRO 42 on 10/08/2026.
//

import SwiftUI

struct MealDetectedView: View {
    @Environment(\.dismiss) private var dismiss
    let capturedImage: UIImage
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            
            // Top Bar
            HStack {
                Button(action: { dismiss() }) {
                    Image(systemName: "chevron.backward.circle")
                        .font(.title2)
                        .foregroundColor(.black)
                }
                Spacer()
                Text("Meal Detected")
                    .font(.headline)
                    .bold()
                Spacer()
                // Spacer simetri
                Image(systemName: "chevron.backward.circle").opacity(0)
            }
            .padding(.top, 10)
            
            // Display Gambar dari Kamera
            Image(uiImage: capturedImage)
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity)
                .frame(height: 260)
                .cornerRadius(20)
                .clipped()
            
            // Tajuk & Match %
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text("Nasi lemak")
                        .font(.title2)
                        .bold()
                    
                    Text("94% Match")
                        .font(.caption)
                        .bold()
                        .foregroundColor(.black)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 4)
                        .background(Color.green.opacity(0.4))
                        .cornerRadius(12)
                }
                
                Text("with sambal, egg, peanuts, anchovies, cucumber")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            // Nutrisi breakdown
            VStack(spacing: 8) {
                NutritionRow(label: "calories", value: "520kcal")
                NutritionRow(label: "fat", value: "14g")
                NutritionRow(label: "carb", value: "68g")
                NutritionRow(label: "protein", value: "21g")
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(12)
            
            // Portion Box
            Text("Portion: 350g (based on plate size)")
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.blue.opacity(0.15))
                .cornerRadius(12)
            
            Spacer()
            
            // Bottom Action Buttons
            HStack(spacing: 16) {
                Button(action: { dismiss() }) {
                    Text("Not right?")
                        .font(.subheadline)
                        .bold()
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                        )
                }
                
                Button(action: {
                    // Logik simpan makanan
                }) {
                    Text("Log meal")
                        .font(.subheadline)
                        .bold()
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.black)
                        .cornerRadius(12)
                }
            }
            .padding(.bottom, 10)
        }
        .padding(.horizontal)
    }
}

// Subview Nutrisi
struct NutritionRow: View {
    let label: String
    let value: String
    
    var body: some View {
        HStack {
            Text(label)
                .font(.headline)
            Spacer()
            Text(value)
                .font(.headline)
                .bold()
        }
    }
}
#Preview {
    MealDetectedView(capturedImage: UIImage(named: "nasiLemak") ?? UIImage())
}
