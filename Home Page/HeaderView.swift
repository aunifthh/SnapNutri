//
//  HomePageComponents.swift
//  SnapNutri
//
//  Created by STDCX_MACBOOK PRO 42 on 07/08/2026.
//

import SwiftUI

// MARK: - Header
struct HeaderView: View {

    var body: some View {
        HStack {
            HStack(spacing: 8) {
                Text("Logo")
                    .font(.caption).bold()
                    .foregroundColor(.white)
                    .padding(.horizontal, 10).padding(.vertical, 6)
                    .background(Color.gray).cornerRadius(6)
                
                HStack(spacing: 0) {
                    Text("Snap").font(.title2).bold().foregroundColor(Color(red: 0.1, green: 0.45, blue: 0.35))
                    Text("Nutri").font(.title2).bold().foregroundColor(.orange)
                }
            }
            Spacer()
            Image(systemName: "person.crop.circle")
                .resizable().scaledToFill()
                .frame(width: 32, height: 32).clipShape(Circle())
                .foregroundStyle(.black.opacity(0.5))
        }
        .padding(.top, 10)
    }
}

// MARK: - Greeting
struct GreetingView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("Hello, Mira!").font(.largeTitle).bold()
            Text("TUESDAY, 28 JULY").font(.caption).fontWeight(.bold).foregroundColor(.secondary)
        }
    }
}

// MARK: - Today Progress Card (With Progress Bar Animation)
struct TodayProgressCard: View {
    let bmi: Double

    @State private var progressWidth: CGFloat = 0.0
    
    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            HStack {
                Text("TODAY").font(.headline).bold().foregroundColor(.white)
                Spacer()
                Text(String(format: "BMI %.1f", bmi)).font(.caption).bold()
                    .padding(.horizontal, 10).padding(.vertical, 4)
                    .background(Color.white.opacity(0.8)).cornerRadius(12)
            }
            
            HStack(alignment: .firstTextBaseline, spacing: 6) {
                Text("1,002").font(.system(size: 38, weight: .bold)).foregroundColor(.white)
                Text("of 1,800 kcal").font(.title3).bold().foregroundColor(.white.opacity(0.9))
            }
            
            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    Capsule().frame(width: geo.size.width, height: 12).foregroundColor(.white.opacity(0.3))
                    Capsule().frame(width: geo.size.width * progressWidth, height: 12).foregroundColor(.white)
                }
            }
            .frame(height: 12)
        }
        .padding()
        .background(Color(red: 0.35, green: 0.58, blue: 0.38))
        .cornerRadius(16)
        .onAppear {
            withAnimation(.easeInOut(duration: 1.2)) {
                progressWidth = 1002.0 / 1800.0 // 55.6%
            }
        }
    }
}

// MARK: - Macros Grid
struct MacrosGridView: View {
    var body: some View {
        HStack(spacing: 12) {
            MacroItem(title: "Protein", value: "45g")
            MacroItem(title: "Carbs", value: "160g")
            MacroItem(title: "Fat", value: "38g")
        }
    }
}

struct MacroItem: View {
    var title: String
    var value: String
    var body: some View {
        VStack(spacing: 6) {
            Text(title).font(.callout).bold().foregroundColor(.white)
            Text(value).font(.title2).bold().foregroundColor(.white)
        }
        .frame(maxWidth: .infinity).padding(.vertical, 14)
        .background(Color(red: 0.45, green: 0.52, blue: 0.35)).cornerRadius(16)
    }
}

// MARK: - Monthly Intake
struct MonthlyIntakeCard: View {
    let carbsPercent: CGFloat = 0.50
    let proteinPercent: CGFloat = 0.30
    let fatPercent: CGFloat = 0.20
    
    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("MONTHLY INTAKE BREAKDOWN").font(.headline).bold()
            
            HStack(spacing: 20) {
                ZStack {
                    Circle().stroke(Color.gray.opacity(0.15), lineWidth: 14)
                    Circle().trim(from: 0.0, to: carbsPercent)
                        .stroke(Color.orange, style: StrokeStyle(lineWidth: 14, lineCap: .round)).rotationEffect(.degrees(-90))
                    Circle().trim(from: carbsPercent, to: carbsPercent + proteinPercent)
                        .stroke(Color(red: 0.2, green: 0.7, blue: 0.4), style: StrokeStyle(lineWidth: 14, lineCap: .round)).rotationEffect(.degrees(-90))
                    Circle().trim(from: carbsPercent + proteinPercent, to: 1.0)
                        .stroke(Color.blue, style: StrokeStyle(lineWidth: 14, lineCap: .round)).rotationEffect(.degrees(-90))
                    
                    VStack(spacing: 2) {
                        Text("Macros").font(.caption2).foregroundColor(.secondary)
                        Text("100%").font(.subheadline).bold()
                    }
                }
                .frame(width: 100, height: 100)
                
                VStack(alignment: .leading, spacing: 8) {
                    LegendRow(color: .orange, title: "Carbs", value: "50%")
                    LegendRow(color: Color(red: 0.2, green: 0.7, blue: 0.4), title: "Protein", value: "30%")
                    LegendRow(color: .blue, title: "Fat", value: "20%")
                }
            }
            .padding().frame(maxWidth: .infinity)
            .background(Color.white).cornerRadius(16)
            .shadow(color: Color.black.opacity(0.03), radius: 6, x: 0, y: 3)
        }
    }
}

struct LegendRow: View {
    var color: Color; var title: String; var value: String
    var body: some View {
        HStack {
            Circle().fill(color).frame(width: 8, height: 8)
            Text(title).font(.subheadline).foregroundColor(.secondary)
            Spacer()
            Text(value).font(.subheadline).bold()
        }
    }
}

/// MARK: - Recent Meals
struct RecentMealCard: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("RECENT MEALS").font(.headline).bold()
            
            HStack(spacing: 16) {
                // Frame petak untuk gambar
                Image("nasiLemak")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 65, height: 65)
                    .cornerRadius(12)
                    .clipped() // Potong lebihan gambar mengikut bentuk petak
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Nasi Lemak")
                        .font(.title3).bold()
                    Text("Breakfast • 520kcal")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
            }
            .padding()
            .background(Color.white)
            .cornerRadius(16)
            .shadow(color: Color.black.opacity(0.04), radius: 6, x: 0, y: 3)
        }
    }
}

struct TabBarIcon: View {
    var icon: String; var title: String; var isActive: Bool
    var body: some View {
        VStack(spacing: 4) {
            Image(systemName: icon).font(.system(size: 20))
            Text(title).font(.caption2)
        }
        .foregroundColor(isActive ? .blue : .gray)
    }
}
 
#Preview {
    HeaderView()
}
