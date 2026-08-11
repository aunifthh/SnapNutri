//
//  Profile.swift
//  TestSnapNutri
//
//  Created by STDC_11 on 10/08/2026.
//

import SwiftUI

struct ProfilePage: View {
    // MARK: - State Variables
    @State private var age: Int = 22
    @State private var weight: Double = 54.0
    @State private var height: Double = 162.0 // dalam cm
    
    // Selection States
    @State private var selectedGoal: GoalOption = .maintain
    @State private var selectedDietary: Set<DietaryOption> = [.halal]
    
    // Alert / Dialog States untuk Edit Age & Weight
    @State private var showAgeAlert = false
    @State private var showWeightAlert = false
    @State private var tempAgeInput = ""
    @State private var tempWeightInput = ""
    
    // MARK: - Enums Data
    enum GoalOption: String, CaseIterable, Identifiable {
        case loseWeight = "Lose Weight"
        case overweight = "Overweight"
        case maintain = "Maintain"
        
        var id: String { self.rawValue }
    }

    enum DietaryOption: String, CaseIterable, Identifiable {
        case halal = "Halal"
        case seafoodAllergy = "Seafood Allergy"
        case vegetarian = "Vegetarian"
        case vegan = "Vegan"
        case nutFree = "Nut Free"
        
        var id: String { self.rawValue }
    }

    // MARK: - Computed Properties (BMI Calculator)
    private var bmiValue: Double {
        let heightInMeters = height / 100.0
        guard heightInMeters > 0 else { return 0 }
        return weight / (heightInMeters * heightInMeters)
    }
    
    private var bmiStatus: (text: String, color: Color) {
        switch bmiValue {
        case ..<18.5:
            return ("underweight", .orange)
        case 18.5..<25.0:
            return ("healthy", .green)
        case 25.0..<30.0:
            return ("overweight", .orange)
        default:
            return ("obese", .red)
        }
    }
    
    private var formattedDietarySummary: String {
        if selectedDietary.isEmpty {
            return "None"
        }
        let list = Array(selectedDietary).map { $0.rawValue }
        if list.count == 1 {
            return list.first!
        } else {
            return "\(list.first!), +\(list.count - 1)"
        }
    }

    // MARK: - Main View Body
    var body: some View {
        NavigationView {
            ZStack {
                // MARK: - Main Background Color
                Color("hijaumain")
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 20) {
                        
                        // MARK: - Profile Avatar & Name
                        VStack(spacing: 8) {
                            ZStack {
                                Circle()
                                    .fill(Color.blue.opacity(0.8))
                                    .frame(width: 90, height: 90)
                                Text("A")
                                    .font(.system(size: 44, weight: .semibold))
                                    .foregroundColor(.white)
                            }
                            
                            Text("Auni")
                                .font(.title2)
                                .bold()
                            
                            Text("Standard plan")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        .padding(.top, 20)
                        
                        // MARK: - Body Metrics Card (Gender, Age, Weight, Height, BMI)
                        VStack(spacing: 12) {
                            metricRow(title: "Gender", value: "Female")
                            
                            Divider().background(Color.gray.opacity(0.1))
                            
                            // Edit Age Button
                            Button(action: {
                                tempAgeInput = "\(age)"
                                showAgeAlert = true
                            }) {
                                HStack {
                                    Text("Age")
                                        .foregroundColor(.gray)
                                    Spacer()
                                    HStack(spacing: 4) {
                                        Text("\(age)")
                                            .bold()
                                            .foregroundColor(.black)
                                        Image(systemName: "square.and.pencil")
                                            .font(.caption)
                                            .foregroundColor(.gray)
                                    }
                                }
                            }
                            
                            Divider().background(Color.gray.opacity(0.1))
                            
                            // Edit Weight Button
                            Button(action: {
                                tempWeightInput = String(format: "%.0f", weight)
                                showWeightAlert = true
                            }) {
                                HStack {
                                    Text("Weight")
                                        .foregroundColor(.gray)
                                    Spacer()
                                    HStack(spacing: 4) {
                                        Text("\(Int(weight)) kg")
                                            .bold()
                                            .foregroundColor(.black)
                                        Image(systemName: "square.and.pencil")
                                            .font(.caption)
                                            .foregroundColor(.gray)
                                    }
                                }
                            }
                            
                            Divider().background(Color.gray.opacity(0.1))
                            
                            metricRow(title: "Height", value: "\(Int(height)) cm")
                            
                            Divider().background(Color.gray.opacity(0.1))
                            
                            // BMI Display
                            HStack {
                                Text("BMI")
                                    .foregroundColor(.gray)
                                Spacer()
                                Text(String(format: "%.1f %@", bmiValue, bmiStatus.text))
                                    .bold()
                                    .foregroundColor(bmiStatus.color)
                            }
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(20)
                        .padding(.horizontal)
                        
                        // MARK: - Goal & Dietary Section
                        VStack(spacing: 14) {
                            // Goal Menu Selector
                            HStack {
                                Text("Goal")
                                    .foregroundColor(.gray)
                                Spacer()
                                Menu {
                                    ForEach(GoalOption.allCases) { goal in
                                        Button(goal.rawValue) {
                                            selectedGoal = goal
                                        }
                                    }
                                } label: {
                                    HStack(spacing: 4) {
                                        Text(selectedGoal.rawValue.lowercased())
                                            .bold()
                                            .foregroundColor(.black)
                                        Image(systemName: "chevron.right")
                                            .font(.caption)
                                            .foregroundColor(.gray)
                                    }
                                }
                            }
                            
                            Divider().background(Color.gray.opacity(0.1))
                            
                            // Dietary Menu Selector
                            HStack {
                                Text("Dietary")
                                    .foregroundColor(.gray)
                                Spacer()
                                Menu {
                                    ForEach(DietaryOption.allCases) { option in
                                        Button(action: {
                                            toggleDietary(option)
                                        }) {
                                            HStack {
                                                Text(option.rawValue)
                                                if selectedDietary.contains(option) {
                                                    Image(systemName: "checkmark")
                                                }
                                            }
                                        }
                                    }
                                } label: {
                                    HStack(spacing: 4) {
                                        Text(formattedDietarySummary.lowercased())
                                            .bold()
                                            .foregroundColor(.black)
                                        Image(systemName: "chevron.right")
                                            .font(.caption)
                                            .foregroundColor(.gray)
                                    }
                                }
                            }
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(20)
                        .padding(.horizontal)
                        
                        // MARK: - Upgrade Banner Card
                        VStack(spacing: 16) {
                            VStack(spacing: 6) {
                                Text("UPGRADE TO PREMIUM")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color(red: 0.1, green: 0.3, blue: 0.5))
                                
                                Text("Ai recommendation, meal planning, grocery ordering")
                                    .font(.subheadline)
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(Color(red: 0.1, green: 0.4, blue: 0.7))
                            }
                            
                            Button(action: {
                                // Action Upgrade Premium
                            }) {
                                Text("See feature")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .padding(.vertical, 12)
                                    .padding(.horizontal, 36)
                                    .background(Color.blue)
                                    .cornerRadius(12)
                            }
                        }
                        .padding(.vertical, 22)
                        .padding(.horizontal, 16)
                        .frame(maxWidth: .infinity)
                        .background(Color.white.opacity(0.9))
                        .cornerRadius(20)
                        .padding(.horizontal)
                        
                    }
                    .padding(.bottom, 120)
                }
            }
            .navigationBarHidden(true)
        }
        // MARK: - Alerts (Pop-up untuk Kemaskini Age & Weight)
        .alert("Enter Age", isPresented: $showAgeAlert) {
            TextField("Masukkan umur", text: $tempAgeInput)
                .keyboardType(.numberPad)
            Button("Cancel", role: .cancel) { }
            Button("Save") {
                if let newAge = Int(tempAgeInput) {
                    age = newAge
                }
            }
        }
        .alert("Enter Weight", isPresented: $showWeightAlert) {
            TextField("Masukkan berat (kg)", text: $tempWeightInput)
                .keyboardType(.decimalPad)
            Button("Cancel", role: .cancel) { }
            Button("Save") {
                if let newWeight = Double(tempWeightInput) {
                    weight = newWeight
                }
            }
        }
    }
    
    // MARK: - Helper Views & Functions
    private func metricRow(title: String, value: String) -> some View {
        HStack {
            Text(title)
                .foregroundColor(.gray)
            Spacer()
            Text(value)
                .bold()
                .foregroundColor(.black)
        }
    }
    
    private func toggleDietary(_ option: DietaryOption) {
        if selectedDietary.contains(option) {
            selectedDietary.remove(option)
        } else {
            selectedDietary.insert(option)
        }
    }
}

// MARK: - Preview Provider
struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePage()
    }
}
