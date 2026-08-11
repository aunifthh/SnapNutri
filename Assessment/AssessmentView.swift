//
//  AssessmentView.swift
//  SnapNutri
//
//  Created by STDCX_MACBOOK PRO 38 on 10/08/2026.
//

import SwiftUI

struct AssessmentView: View {
    
    // MARK: - BMI Binding
    
    @Binding var bmi: Double
    
    // MARK: - Continue Action
    
    let onContinue: () -> Void
    
    // MARK: - User Information
    
    @State private var name = "Mira"
    @State private var age = "22"
    @State private var gender = "Female"
    @State private var height = "175"
    @State private var weight = "60"
    
    // MARK: - Calculate BMI
    
    private var calculatedBMI: Double {
        
        guard let heightValue = Double(height),
              let weightValue = Double(weight),
              heightValue > 0,
              weightValue > 0
        else {
            return 0
        }
        
        let heightInMeters = heightValue / 100
        
        return weightValue / (heightInMeters * heightInMeters)
    }
    
    // MARK: - BMI Text
    
    private var bmiText: String {
        String(format: "%.1f", calculatedBMI)
    }
    
    // MARK: - BMI Status
    
    private var bmiStatus: String {
        
        switch calculatedBMI {
            
        case 0..<18.5:
            return "underweight"
            
        case 18.5..<25:
            return "healthy range"
            
        case 25..<30:
            return "overweight"
            
        default:
            return "obese range"
        }
    }
    
    // MARK: - BMI Color
    
    private var bmiColor: Color {
        
        switch calculatedBMI {
            
        case 0..<18.5:
            return .orange
            
        case 18.5..<25:
            return .green
            
        case 25..<30:
            return .orange
            
        default:
            return .red
        }
    }
    
    // MARK: - BMI Background
    
    private var bmiBackgroundColor: Color {
        
        switch calculatedBMI {
            
        case 0..<18.5:
            return Color.orange.opacity(0.25)
            
        case 18.5..<25:
            return Color.green.opacity(0.35)
            
        case 25..<30:
            return Color.orange.opacity(0.25)
            
        default:
            return Color.red.opacity(0.25)
        }
    }
    
    // MARK: - Body
    
    var body: some View {
        
        ZStack {
            
            // MARK: Background
            
            Color.white
                .ignoresSafeArea()
            
            
            // MARK: Food Image
            
            VStack {
                
                Spacer()
                
                Image("backgroundAssessmentView")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                    .frame(height: 430)
                    .clipped()
                    .opacity(0.9)
            }
            .ignoresSafeArea()
            
            
            // MARK: White Gradient
            
            VStack {
                
                Spacer()
                
                LinearGradient(
                    colors: [
                        Color.white,
                        Color.white.opacity(0.8),
                        Color.white.opacity(0)
                    ],
                    startPoint: .bottom,
                    endPoint: .top
                )
                .frame(height: 450)
            }
            .ignoresSafeArea()
            
            
            // MARK: Main Content
            
            VStack(spacing: 0) {
                
                // MARK: Progress Dots
                
                HStack(spacing: 14) {
                    
                    Circle()
                        .fill(Color.black)
                        .frame(width: 13, height: 13)
                    
                    Circle()
                        .fill(Color.gray.opacity(0.5))
                        .frame(width: 13, height: 13)
                    
                    Circle()
                        .fill(Color.gray.opacity(0.5))
                        .frame(width: 13, height: 13)
                }
                .padding(.top, 60)
                
                
                // MARK: Title
                
                VStack(
                    alignment: .leading,
                    spacing: 25
                ) {
                    
                    Text("Tell us about you")
                        .font(.largeTitle)
                        .bold()
                    
                    Text("This helps calibrate your daily target")
                        .font(.subheadline)
                }
                .frame(
                    maxWidth: .infinity,
                    alignment: .leading
                )
                .padding(.top, 65)
                
                
                // MARK: User Information
                
                VStack(spacing: 30) {
                    
                    // Name
                    
                    InformationField(
                        title: "Name",
                        value: $name
                    )
                    
                    
                    // Age + Gender
                    
                    HStack(spacing: 50) {
                        
                        InformationField(
                            title: "Age",
                            value: $age
                        )
                        
                        InformationField(
                            title: "Gender",
                            value: $gender
                        )
                    }
                    
                    
                    // Height + Weight
                    
                    HStack(spacing: 50) {
                        
                        InformationField(
                            title: "Height",
                            value: $height,
                            unit: "cm"
                        )
                        
                        InformationField(
                            title: "Weight",
                            value: $weight,
                            unit: "Kg"
                        )
                    }
                }
                .padding(.top, 55)
                
                
                Spacer()
                
                
                // MARK: BMI Card
                
                HStack {
                    
                    Text("BMI \(bmiText) — \(bmiStatus)")
                        .font(.subheadline)
                        .foregroundStyle(bmiColor)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 60)
                .background(bmiBackgroundColor)
                .clipShape(
                    RoundedRectangle(cornerRadius: 28)
                )
                
                
                // MARK: Continue Button
                
                Button {
                    
                    // Save calculated BMI
                    bmi = calculatedBMI
                    
                    // Move to next page
                    onContinue()
                    
                } label: {
                    
                    Text("Continue")
                        .padding(20)
                        .padding(.horizontal,76)
                        .foregroundStyle(Color.white)
                        .background(.blue, in: RoundedRectangle(cornerRadius: 12))
                }
                .padding(.top, 50)
                .padding(.bottom, 30)
            }
            .padding(.horizontal, 35)
        }
    }
}


// MARK: - Information Field

struct InformationField: View {
    
    let title: String
    
    @Binding var value: String
    
    var unit: String? = nil
    
    var body: some View {
        
        VStack(
            alignment: .leading,
            spacing: 8
        ) {
            
            Text(title)
                .font(.title2)
                .bold()
            
            
            HStack(spacing: 5) {
                
                TextField(
                    "",
                    text: $value
                )
                .font(.subheadline)
                .foregroundStyle(.black)
                .keyboardType(
                    title == "Age" ||
                    title == "Height" ||
                    title == "Weight"
                    ? .decimalPad
                    : .default
                )
                
                if let unit = unit {
                    
                    Text(unit)
                        .font(.subheadline)
                }
            }
            
            
            Rectangle()
                .fill(
                    Color.gray.opacity(0.4)
                )
                .frame(height: 1)
        }
    }
}


// MARK: - Preview

#Preview {
    
    AssessmentView(
        bmi: .constant(19.6)
    ) {
        print("Continue pressed")
    }
}
