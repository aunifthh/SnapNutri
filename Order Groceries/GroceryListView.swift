//
//  GroceryListView.swift
//  SnapNutri
//
//  Created by STDCX_MACBOOK PRO 42 on 10/08/2026.
//

import SwiftUI

// Model Data Kedai
struct GroceryStore: Identifiable {
    let id = UUID()
    let name: String
    let rating: String
    let category: String
    let deliveryFee: String
    let originalFee: String?
    let deliveryTime: String
    let statusMessage: String?
    let isClosed: Bool
    let promoText: String
    let imageName: String
}

struct GroceryListView: View {
    @Environment(\.dismiss) private var dismiss
    
    // Data Contoh Kedai
    let stores = [
        GroceryStore(name: "Jaya Grocer - Eco Ardence", rating: "4.3", category: "Supermarket", deliveryFee: "RM0.40", originalFee: "RM3.40", deliveryTime: "From 75 mins", statusMessage: "High demand now, longer waiting time.", isClosed: false, promoText: "RM10.00 off\nMin. spend RM40.00", imageName: "cart.fill"),
        GroceryStore(name: "Jaya Grocer - CityWalk i-City", rating: "2.5", category: "Supermarket", deliveryFee: "", originalFee: nil, deliveryTime: "", statusMessage: "Closed · Order for 10 Aug, 11:00 AM or later", isClosed: true, promoText: "RM10.00 off\nMin. spend RM40.00", imageName: "cart.fill"),
        GroceryStore(name: "Jaya Grocer - Plaza Shah Alam", rating: "3.9", category: "In-Store Prices", deliveryFee: "RM0.60", originalFee: "RM3.60", deliveryTime: "From 40 mins", statusMessage: "Closing soon - order before 10:00 PM", isClosed: false, promoText: "RM10.00 off\nMin. spend RM40.00", imageName: "cart.fill")
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                
                // Banner Promo Atas
                HStack {
                    Text("Subscribe to SnapNutri Premium and enjoy free delivery (up to RM3).")
                        .font(.caption)
                        .foregroundColor(.black.opacity(0.8))
                    Spacer()
                    //Image(systemName: "arrow.right")
                        // .font(.caption)
                }
                .padding()
                .background(Color.yellow.opacity(0.15))
                .cornerRadius(12)
                .padding(.horizontal)
                
                // Senarai Kedai
                LazyVStack(spacing: 20) {
                    ForEach(stores) { store in
                        GroceryStoreCard(store: store)
                    }
                }
                .padding(.horizontal)
            }
            .padding(.vertical)
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: { dismiss() }) {
                    Image(systemName: "arrow.left")
                        .font(.title3.bold())
                        .foregroundColor(.black)
                }
            }
        }
    }
}

// Subview: Kad Kedai
struct GroceryStoreCard: View {
    let store: GroceryStore
    
    var body: some View {
        HStack(alignment: .top, spacing: 14) {
            // Gambar/Logo Kedai
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.gray.opacity(0.1))
                    .frame(width: 80, height: 80)
                
                Image("jayagrocer")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80, height: 35)
                    .padding(10)
                    .background(.white, in: RoundedRectangle(cornerRadius: 20))
            }
            
            // Maklumat Kedai
            VStack(alignment: .leading, spacing: 4) {
                Text(store.name)
                    .font(.headline)
                    .bold()
                
                // Rating & Kategori
                HStack(spacing: 4) {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                        .font(.caption)
                    Text("\(store.rating) · \(store.category)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                
                // Harga Penghantaran
                if !store.isClosed {
                    HStack(spacing: 6) {
                        Text(store.deliveryFee)
                            .font(.subheadline)
                            .bold()
                            .foregroundColor(.orange)
                        
                        if let orig = store.originalFee {
                            Text(orig)
                                .font(.caption)
                                .strikethrough()
                                .foregroundColor(.gray)
                        }
                        
                        Text("· \(store.deliveryTime)")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                }
                
                // Mesej Status
                if let status = store.statusMessage {
                    Text(status)
                        .font(.caption)
                        .foregroundColor(store.isClosed ? .red : .gray)
                        .padding(.top, 2)
                }
                
                // Tag Promo
                HStack {
                    Image(systemName: "bag.fill")
                        .foregroundColor(.green)
                    VStack(alignment: .leading) {
                        Text("RM10.00 off")
                            .font(.caption)
                            .bold()
                        Text("Min. spend RM40.00")
                            .font(.caption2)
                            .foregroundColor(.gray)
                    }
                }
                .padding(.horizontal, 10)
                .padding(.vertical, 6)
                .background(Color.green.opacity(0.1))
                .cornerRadius(8)
                .padding(.top, 4)
            }
        }
    }
}

#Preview {
    NavigationStack {
        GroceryListView()
    }
}
