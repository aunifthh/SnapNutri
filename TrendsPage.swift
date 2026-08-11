//
//  TrendsView.swift
//  TestSnapNutri
//
//  Created by STDC_11 on 11/08/2026.
//

import SwiftUI

struct TrendsPage: View {
    @State private var selectedTab: TimeFrame = .daily
    @State private var isPremiumUser: Bool = false // Tukar kepada true jika pengguna membeli premium
    @State private var showPaywall: Bool = false
    @State private var showProfileSheet: Bool = false // Untuk navigasi modal Profile (Cara 2)
    
    enum TimeFrame: String, CaseIterable {
        case daily = "Daily"
        case weekly = "Weekly"
        case monthly = "Monthly"
        
        var isPremium: Bool {
            return self != .daily
        }
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                // MARK: - 1. Latar Belakang Utama ("hijaumain")
                Color("hijaumain")
                    .ignoresSafeArea()
                
                // MARK: - 2. Kandungan Utama Dalam Kad Putih
                VStack(spacing: 0) {
                    // Header (Navigation Bar)
                    HStack {
                        Button(action: {
                            // Aksi untuk butang tambah
                        }) {
                            Image(systemName: "plus")
                                .font(.title2)
                                .foregroundColor(.black)
                        }
                        
                        Spacer()
                        
                        Text("Trends")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Spacer()
                        
                        // MARK: - BAHAGIAN PROFILE
                        // CARA 1: Pindah ke skrin Profile (NavigationLink)
                        NavigationLink(destination: ProfilePage()) {
                            Image(systemName: "person.crop.circle")
                                .resizable().scaledToFill()
                                .frame(width: 32, height: 32).clipShape(Circle())
                                .foregroundStyle(.black.opacity(0.5))
                        }
                        
                        /* CARA 2: Jika mahu guna Pop-Up/Sheet, tukar NavigationLink di atas kepada ini:
                         Button(action: {
                         showProfileSheet = true
                         }) {
                         Image(systemName: "person.circle")
                         .font(.title2)
                         .foregroundColor(.gray)
                         }
                         */
                    }
                    .padding(.horizontal)
                    .padding(.top, 16)
                    .padding(.bottom, 10)
                    
                    ScrollView {
                        VStack(spacing: 20) {
                            
                            // Kad Carta Utama (Daily / Weekly / Monthly Picker)
                            VStack(alignment: .leading, spacing: 15) {
                                
                                // Segmented Control Custom (Free vs Premium)
                                HStack(spacing: 0) {
                                    ForEach(TimeFrame.allCases, id: \.self) { tab in
                                        Button(action: {
                                            if tab.isPremium && !isPremiumUser {
                                                showPaywall = true
                                            } else {
                                                selectedTab = tab
                                            }
                                        }) {
                                            HStack(spacing: 4) {
                                                Text(tab.rawValue)
                                                    .font(.subheadline)
                                                    .fontWeight(selectedTab == tab ? .semibold : .regular)
                                                
                                                if tab.isPremium && !isPremiumUser {
                                                    Image(systemName: "lock.fill")
                                                        .font(.caption2)
                                                }
                                            }
                                            .frame(maxWidth: .infinity)
                                            .padding(.vertical, 8)
                                            .background(selectedTab == tab ? Color.white : Color.clear)
                                            .foregroundColor(selectedTab == tab ? .black : .gray)
                                            .cornerRadius(15)
                                            .shadow(color: selectedTab == tab ? Color.black.opacity(0.1) : Color.clear, radius: 2, x: 0, y: 1)
                                        }
                                    }
                                }
                                .padding(4)
                                .background(Color(UIColor.systemGray5))
                                .cornerRadius(18)
                                
                                // Maklumat Daily Average / Trends
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("\(selectedTab.rawValue.uppercased()) AVERAGE")
                                        .font(.caption)
                                        .fontWeight(.bold)
                                        .foregroundColor(.gray)
                                    
                                    Text("1,680 kcal")
                                        .font(.system(size: 28, weight: .bold))
                                }
                                .padding(.top, 5)
                                
                                Spacer().frame(height: 80)
                                
                                // Garis Carta Dotted & Hari
                                VStack(spacing: 8) {
                                    LineDotted()
                                        .stroke(style: StrokeStyle(lineWidth: 2, dash: [4]))
                                        .frame(height: 1)
                                        .foregroundColor(.gray.opacity(0.5))
                                    
                                    HStack {
                                        ForEach(["M", "T", "W", "T", "F", "S", "S"], id: \.self) { day in
                                            Text(day)
                                                .font(.caption)
                                                .foregroundColor(.gray)
                                                .frame(maxWidth: .infinity)
                                        }
                                    }
                                }
                            }
                            .padding()
                            .background(Color(UIColor.systemGray6).opacity(0.7))
                            .cornerRadius(12)
                            
                            // Kad Macro (Protein, Carbs, Fat)
                            HStack(spacing: 12) {
                                MacroCard(title: "protein avg", value: "52g")
                                MacroCard(title: "carbs avg", value: "195g")
                                MacroCard(title: "fat avg", value: "48g")
                            }
                            
                            // Kad Pattern Noticed (Amaran / Highlight)
                            VStack(alignment: .leading, spacing: 6) {
                                Text("PATTERN NOTICED")
                                    .font(.caption)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.orange)
                                
                                Text("Protein is consistently low on weekdays. Try adding it at breakfast.")
                                    .font(.footnote)
                                    .foregroundColor(Color.orange.opacity(0.8))
                            }
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color.orange.opacity(0.15))
                            .cornerRadius(16)
                        }
                        .padding()
                    }
                }
                .background(Color.white)
                .cornerRadius(24)
                .padding(.horizontal, 8)
                .padding(.vertical, 20)
            }
            // Pop-up Paywall
            .alert(isPresented: $showPaywall) {
                Alert(
                    title: Text("Premium"),
                    message: Text("Weekly and Monthly views are only available to Premium members."),
                    primaryButton: .default(Text("Upgrade to premium"), action: {
                        isPremiumUser = true
                    }),
                    secondaryButton: .cancel(Text("Cancel"))
                )
            }
            // Pilihan Sheet Modal (Jika tidak mahu push navigation)
            .sheet(isPresented: $showProfileSheet) {
                ProfileView()
            }
        }
    }
}

// MARK: - Dummy Skrin Profile (Sediakan View Ini Jika Belum Ada)
struct ProfileView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "person.crop.circle.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(.gray)
            
            Text("User Profile")
                .font(.title)
                .fontWeight(.bold)
            
            Spacer()
        }
        .padding()
    }
}

// MARK: - Komponen Sokongan
struct MacroCard: View {
    var title: String
    var value: String
    
    var body: some View {
        VStack(spacing: 12) {
            Text(title)
                .font(.caption2)
                .foregroundColor(.gray)
            
            Text(value)
                .font(.title3)
                .fontWeight(.bold)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 20)
        .background(Color(UIColor.systemGray6).opacity(0.7))
        .cornerRadius(8)
    }
}

struct LineDotted: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        return path
    }
}

#Preview {
    TrendsPage()
}
