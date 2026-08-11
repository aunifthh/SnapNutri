//
//  HistorySnapNutri.swift
//  TestSnapNutri
//
//  Created by STDC_11 on 10/08/2026.
//

import SwiftUI

// MARK: - Data Model
struct FoodItem: Identifiable {
    let id = UUID()
    let name: String
    let categoryAndTime: String
    let calories: Int
    let imageName: String
}

struct FoodSection: Identifiable {
    let id = UUID()
    let title: String
    let totalCalories: Int
    let items: [FoodItem]
}

// MARK: - Main View
struct HistoryPage: View {
    let sections: [FoodSection] = [
        FoodSection(
            title: "TODAY",
            totalCalories: 1240,
            items: [
                FoodItem(
                    name: "Nasi Lemak",
                    categoryAndTime: "Breakfast 8:30 AM",
                    calories: 520,
                    imageName: "cikmak"
                ),
                FoodItem(
                    name: "Mixed rice",
                    categoryAndTime: "Lunch 1:15 PM",
                    calories: 620,
                    imageName: "nasgor"
                ),
                FoodItem(
                    name: "Teh tarik",
                    categoryAndTime: "Snack 3:45 PM",
                    calories: 100,
                    imageName: "tehtarik"
                )
            ]
        ),
        FoodSection(
            title: "YESTERDAY",
            totalCalories: 1720,
            items: [
                FoodItem(
                    name: "Roti canai",
                    categoryAndTime: "Breakfast 7:50 AM",
                    calories: 380,
                    imageName: "roticanai"
                ),
                FoodItem(
                    name: "Mee goreng",
                    categoryAndTime: "Lunch 12:40 PM",
                    calories: 680,
                    imageName: "meegor"
                )
            ]
        )
    ]
        
    var body: some View {
        NavigationStack {
            ZStack {
                // MARK: - Main Background Color
                Color("hijaumain")
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 30) {
                        ForEach(sections) { section in
                            VStack(alignment: .leading, spacing: 20) {
                                
                                // Header Sub-Section (TODAY • 1,240 KCAL)
                                Text("\(section.title) • \(section.totalCalories.formattedWithSeparator) KCAL")
                                    .font(.system(size: 13, weight: .semibold))
                                    .foregroundColor(.black.opacity(0.6))
                                    .padding(.horizontal)
                                
                                // Senarai Makanan
                                VStack(spacing: 0) {
                                    ForEach(Array(section.items.enumerated()), id: \.element.id) { index, item in
                                        FoodRowView(item: item)
                                        
                                        if index < section.items.count - 1 {
                                            Divider()
                                                .padding(.leading, 96)
                                                .padding(.vertical, 12)
                                        }
                                    }
                                }
                            }
                        }
                    }
                    .padding(.vertical)
                    .padding(.bottom, 60) // Ruang extra di bahagian bawah
                }
            }
            .navigationTitle("History")
            .toolbarBackground(.hidden, for: .navigationBar) // Memastikan bar navigasi juga lutsinar untuk tunjuk warna background
        }
    }
}

// MARK: - Component Baris Makanan
struct FoodRowView: View {
    let item: FoodItem
    
    var body: some View {
        HStack(spacing: 20) {
            
            // Paparan Gambar
            Group {
                if let uiImage = UIImage(named: item.imageName) {
                    Image(uiImage: uiImage)
                        .resizable()
                 
                } else {
                    ZStack {
                        Color(.secondarySystemBackground)
                        Image(systemName: "photo")
                            .foregroundColor(.gray)
                    }
                }
            }
            .frame(width: 60, height: 60)
            .clipShape(RoundedRectangle(cornerRadius: 18))
            
            // Maklumat Makanan
            VStack(alignment: .leading, spacing: 4) {
                Text(item.name)
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.primary)
                
                Text(item.categoryAndTime)
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            // Jumlah Kalori
            Text("\(item.calories)")
                .font(.system(size: 17, weight: .bold))
                .foregroundColor(.primary)
        }
        .padding(.horizontal)
    }
}

// MARK: - Extension Format Nombor
extension Int {
    var formattedWithSeparator: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter.string(from: NSNumber(value: self)) ?? "\(self)"
    }
}

// MARK: - Preview
#Preview {
    HistoryPage()
}
