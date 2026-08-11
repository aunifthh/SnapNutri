//
//  GroceryItem.swift
//  SnapNutri
//
//  Created by STDCX_MACBOOK PRO 42 on 10/08/2026.
//

import SwiftUI

// MARK: - Grocery Item Model
struct GroceryItem: Identifiable {
    let id = UUID()
    let name: String
    let price: Double
    let originalPrice: Double?
    let unit: String
    let imageName: String     
    let tag: String?
    let discountText: String?
}

// MARK: - Store Detail View (grocery item page)
struct StoreDetailView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var searchText = ""
    @State private var cartCount = 0
    @State private var cartTotal = 0.00
    
    // Sample products — imageName should match an asset in your catalog
    let items = [
        GroceryItem(name: "Lacto Plus III Skinless Boneless Chicken Breast 4...", price: 13.30, originalPrice: nil, unit: "1 per pack", imageName: "ayam", tag: nil, discountText: nil),
        GroceryItem(name: "Apple Fuji 6pcs", price: 9.50, originalPrice: 11.50, unit: "6pcs", imageName: "apple", tag: "Low in stock", discountText: "RM2.00 off"),
        GroceryItem(name: "Broccoli (China) 1 unit", price: 3.20, originalPrice: nil, unit: "1 per pack", imageName: "broccoli", tag: nil, discountText: nil),
        GroceryItem(name: "Red Dragon Fruite (Malaysia)", price: 10.90, originalPrice: nil, unit: "1kg", imageName: "dragonfruit", tag: nil, discountText: nil),
        GroceryItem(name: "Farm Fresh Pure Fresh Milk (Bottle)", price: 16.70, originalPrice: nil, unit: "2L", imageName: "susu", tag: nil, discountText: nil),
        GroceryItem(name: "Carrot (Australia) 500g", price: 2.20, originalPrice: 2.50, unit: "500g", imageName: "carrot", tag: "Low in stock", discountText: "RM0.30 off"),
        GroceryItem(name: "Green Capsicum", price: 9.90, originalPrice: nil, unit: "500g", imageName: "capsicum", tag: nil, discountText: nil),
        GroceryItem(name: "Red Onion (Australia) 500g", price: 3.50, originalPrice: nil, unit: "500g", imageName: "onion", tag: nil, discountText: nil)
    ]
    
    // Two-column grid layout
    let columns = [
        GridItem(.flexible(), spacing: 12),
        GridItem(.flexible(), spacing: 12)
    ]
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Color("hijaumain")
                .ignoresSafeArea()
            ScrollView {
                VStack(spacing: 16) {
                    
                    // Search bar and note button
                    HStack(spacing: 12) {
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                            TextField("Search this store", text: $searchText)
                        }
                        .padding(10)
                        .background(Color(.white))
                        .cornerRadius(10)
                        
//                        Button(action: {}) {
//                            Image(systemName: "square.and.pencil")
//                                .font(.title2)
//                                .foregroundColor(.teal)
//                        }
                    }
                    .padding(.horizontal)
                    
                    // Product grid (2 columns)
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(items) { item in
                            ProductCardView(item: item) {
                                cartCount += 1
                                cartTotal += item.price
                            }
                        }
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 120) // Space for the bottom basket button
                }
            }
            
            // Green basket button — sticks to the bottom
            Button(action: {}) {
                HStack {
                    Text("Basket • \(cartCount) Item")
                        .font(.headline)
                        .bold()
                    Spacer()
                    Text(String(format: "RM%.2f", cartTotal))
                        .font(.headline)
                        .bold()
                }
                .foregroundColor(.white)
                .padding()
                .background(Color("hijausecond"))
                .cornerRadius(30)
            }
            .padding(.horizontal)
            .padding(.vertical, 20)
            .background(
                Color.white
                    .ignoresSafeArea(edges: .bottom)
                    .shadow(radius: 10)
            )
        }
        .navigationTitle("Jaya Grocer - CityWalk i-City")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: { dismiss() }) {
                    Image(systemName: "chevron.backward")
                        .foregroundColor(.black)
                        .bold()
                }
            }
//            ToolbarItem(placement: .navigationBarTrailing) {
//                Button(action: {}) {
//                    Image(systemName: "ellipsis")
//                        .foregroundColor(.black)
//                        .bold()
//                }
//            }
        }
    }
}

// MARK: - Subview: Product Card
struct ProductCardView: View {
    let item: GroceryItem
    let onAdd: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            
            // Image container
            ZStack(alignment: .topTrailing) {
                ZStack(alignment: .topLeading) {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color(.white))
                        .frame(height: 140)
                    
                    // Product tag (e.g. Low in stock)
                    if let tag = item.tag {
                        Text(tag)
                            .font(.caption2)
                            .foregroundColor(.red)
                            .padding(6)
                    }
                    
                    // Product image — add "\(item.imageName)" to your Assets catalog.
                    Image(item.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 80)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                
                // Add button (+)
                Button(action: onAdd) {
                    Image(systemName: "plus.circle.fill")
                        .font(.title)
                        .foregroundColor(Color("hijauthird"))
                        .background(Color.white.clipShape(Circle()))
                }
                .padding(8)
            }
            
            // Discount banner (if any)
            if let discount = item.discountText {
                Text(discount)
                    .font(.caption2)
                    .bold()
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 3)
                    .background(Color(.yellow.opacity(0.9)))
                    .cornerRadius(4)
            }
            
            // Price
            HStack(alignment: .firstTextBaseline, spacing: 4) {
                Text(String(format: "%.2f", item.price))
                    .font(.title3)
                    .bold()
                
                if let orig = item.originalPrice {
                    Text(String(format: "%.2f", orig))
                        .font(.caption)
                        .strikethrough()
                        .foregroundColor(.white)
                }
            }
            
            // Product name
            Text(item.name)
                .font(.subheadline)
                .lineLimit(2)
            
            // Unit
            Text(item.unit)
                .font(.caption)
                .foregroundColor(.gray)
        }
    }
}

#Preview {
    NavigationStack {
        StoreDetailView()
    }
}
