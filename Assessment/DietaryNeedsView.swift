//
//  DietaryNeedsView.swift
//  SnapNutri
//
//  Created by STDCX_MACBOOK PRO 38 on 09/08/2026.
//

import SwiftUI

struct DietaryNeedsView: View {
    
    let onFinish: () -> Void

    
    // MARK: - State
    
    @State private var isHalal = true
    @State private var isVegetarian = false
    
    // Allergies
    @State private var allergies: [String] = []
    @State private var newAllergy = ""
    @State private var isAddingAllergy = false
    
    
    // MARK: - Body
    
    var body: some View {
        
        ZStack {
            
            // MARK: - Background
            
            Color.white
                .ignoresSafeArea()
            
            Image("backgroundDietaryNeedsView")
                .resizable()
                .scaledToFit()
                .ignoresSafeArea()
                .opacity(0.7)
            
            
            VStack(spacing: 0) {
                
                // MARK: - Progress Dots
                
                HStack(spacing: 14) {
                    
                    Circle()
                        .fill(Color.gray.opacity(0.5))
                        .frame(width: 12, height: 12)
                    
                    Circle()
                        .fill(Color.gray.opacity(0.5))
                        .frame(width: 12, height: 12)
                    
                    Circle()
                        .fill(Color.black)
                        .frame(width: 12, height: 12)
                }
                .padding(.top, 60)
                
                // MARK: - Title
                
                VStack(alignment: .leading, spacing: 20) {
                    
                    Text("Any dietary needs?")
                        .font(.system(size: 30, weight: .bold))
                    
                    Text("We’ll respect these in every suggestion")
                        .font(.system(size: 18))
                    
                }
                .frame(
                    maxWidth: .infinity,
                    alignment: .leading
                )
                .padding(.top, 70)
                
                
                // MARK: - Dietary Cards
                
                VStack(spacing: 12) {
                    
                    DietaryCard(
                        icon: "fork.knife",
                        title: "Halal",
                        isSelected: isHalal
                    ) {
                        isHalal.toggle()
                    }
                    
                    
                    DietaryCard(
                        icon: "leaf",
                        title: "Vegetarian",
                        isSelected: isVegetarian
                    ) {
                        isVegetarian.toggle()
                    }
                }
                .padding(.top, 50)
                
                
                // MARK: - Allergies
                
                VStack(
                    alignment: .leading,
                    spacing: 12
                ) {
                    
                    Text("Allergies")
                        .font(.system(size: 20))
                        .foregroundStyle(.black)
                    
                    
                    // MARK: Allergy Chips
                    
                    if !allergies.isEmpty {
                        
                        FlowLayout(spacing: 8) {
                            
                            ForEach(
                                allergies,
                                id: \.self
                            ) { allergy in
                                
                                AllergyChip(
                                    name: allergy
                                ) {
                                    
                                    allergies.removeAll {
                                        $0 == allergy
                                    }
                                }
                            }
                        }
                    }
                    
                    
                    // MARK: Add Allergy
                    
                    if isAddingAllergy {
                        
                        HStack(spacing: 10) {
                            
                            TextField(
                                "",
                                text: $newAllergy
                            )
                            .font(.system(size: 18))
                            .foregroundStyle(.gray)
                            .padding(.horizontal, 10)
                            .frame(height: 45)
                            .overlay(
                                Capsule()
                                    .stroke(
                                        Color.black,
                                        lineWidth: 1
                                    )
                            )
                            
                            Button("Add") {
                                addAllergy()
                            }
                            .buttonStyle(.borderedProminent)
                        }
                        
                    } else {
                        
                        Button {
                            isAddingAllergy = true
                        } label: {
                            
                            Text("+ Add")
                                .font(.system(size: 18))
                                .foregroundStyle(.gray)
                                .padding(.horizontal, 20)
                                .frame(height: 45)
                                .overlay(
                                    Capsule()
                                        .stroke(
                                            Color.black,
                                            lineWidth: 1
                                        )
                                )
                        }
                    }
                }
                .frame(
                    maxWidth: .infinity,
                    alignment: .leading
                )
                .padding(.top, 30)
                
                
                Spacer()
                
                
                // MARK: - Finish Setup
                
                Button {
                    onFinish()
                } label: {
                    
                    Text("Finish Setup")
                        .padding(20)
                        .padding(.horizontal,76)
                        .foregroundStyle(Color.white)
                        .background(.blue, in: RoundedRectangle(cornerRadius: 12))
                }
                .padding(.horizontal, 10)
                .padding(.bottom, 35)
            }
            .padding(.horizontal, 35)
        }
    }
    
    
    // MARK: - Add Allergy
    
    private func addAllergy() {
        
        let allergy = newAllergy
            .trimmingCharacters(
                in: .whitespacesAndNewlines
            )
        
        // Don't allow empty allergy
        guard !allergy.isEmpty else {
            return
        }
        
        // Don't allow duplicate allergy
        if !allergies.contains(allergy) {
            allergies.append(allergy)
        }
        
        // Clear TextField
        newAllergy = ""
        
        // Hide TextField
        isAddingAllergy = false
    }
}


// MARK: - Dietary Card

struct DietaryCard: View {
    
    let icon: String
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        
        Button {
            action()
        } label: {
            
            HStack(spacing: 25) {
                
                // Icon
                
                Image(systemName: icon)
                    .font(.system(size: 24))
                    .frame(width: 32)
                    .foregroundStyle(.black)
                
                
                // Text
                
                Text(title)
                    .font(
                        .system(
                            size: 20,
                            weight: .bold
                        )
                    )
                    .foregroundStyle(.black)
                
                
                Spacer()
                
                
                // Toggle
                
                Toggle(
                    "",
                    isOn: Binding(
                        get: {
                            isSelected
                        },
                        set: { _ in
                            action()
                        }
                    )
                )
                .labelsHidden()
                .tint(.green)
            }
            .padding(.horizontal, 25)
            .frame(maxWidth: .infinity)
            .frame(height: 90)
            .background(
                Color.white.opacity(0.85)
            )
            .overlay(
                RoundedRectangle(
                    cornerRadius: 20
                )
                .stroke(
                    Color.black,
                    lineWidth: 2
                )
            )
            .clipShape(
                RoundedRectangle(
                    cornerRadius: 20
                )
            )
        }
        .buttonStyle(.plain)
    }
}


// MARK: - Allergy Chip

struct AllergyChip: View {
    
    let name: String
    let onDelete: () -> Void
    
    var body: some View {
        
        HStack(spacing: 8) {
            
            Text(name)
                .font(.system(size: 16))
            
            Button {
                onDelete()
            } label: {
                
                Image(
                    systemName: "xmark"
                )
                .font(.system(size: 12))
            }
        }
        .foregroundStyle(.black)
        .padding(.horizontal, 14)
        .frame(height: 40)
        .background(
            Capsule()
                .fill(
                    Color.gray.opacity(0.15)
                )
        )
    }
}


// MARK: - Flow Layout

struct FlowLayout: Layout {
    
    var spacing: CGFloat = 8
    
    
    func sizeThatFits(
        proposal: ProposedViewSize,
        subviews: Subviews,
        cache: inout ()
    ) -> CGSize {
        
        let maxWidth = proposal.width ?? 300
        
        var width: CGFloat = 0
        var height: CGFloat = 0
        var rowHeight: CGFloat = 0
        
        
        for subview in subviews {
            
            let size = subview.sizeThatFits(
                .unspecified
            )
            
            
            if width + size.width > maxWidth {
                
                width = 0
                
                height += rowHeight + spacing
                
                rowHeight = 0
            }
            
            
            width += size.width + spacing
            
            rowHeight = max(
                rowHeight,
                size.height
            )
        }
        
        
        height += rowHeight
        
        
        return CGSize(
            width: maxWidth,
            height: height
        )
    }
    
    
    func placeSubviews(
        in bounds: CGRect,
        proposal: ProposedViewSize,
        subviews: Subviews,
        cache: inout ()
    ) {
        
        var x = bounds.minX
        var y = bounds.minY
        var rowHeight: CGFloat = 0
        
        
        for subview in subviews {
            
            let size = subview.sizeThatFits(
                .unspecified
            )
            
            
            if x + size.width > bounds.maxX {
                
                x = bounds.minX
                
                y += rowHeight + spacing
                
                rowHeight = 0
            }
            
            
            subview.place(
                at: CGPoint(
                    x: x,
                    y: y
                ),
                proposal: ProposedViewSize(size)
            )
            
            
            x += size.width + spacing
            
            rowHeight = max(
                rowHeight,
                size.height
            )
        }
    }
}


// MARK: - Preview

#Preview {
    DietaryNeedsView {
        print("Finish Setup")
    }
}
