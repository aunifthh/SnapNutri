//
//  Colors.swift
//  SnapNutri
//
//  Created by auni fatihah auzi on 04/08/2026.
//

import SwiftUI

extension Color {
    
    // MARK: - Asset Catalog Colors
    // These reference your existing color sets in Assets.xcassets
    
    static let brandPrimary = Color("Primary")
    static let brandSecondary = Color("Secondary")
    static let brandTertiary = Color("Tertiary")
    
    // MARK: - Extended Brand Palette
    // Additional greens defined directly in code
    
    static let snapGreenDeep = Color(red: 46/255, green: 125/255, blue: 50/255)     // #2E7D32
    static let snapGreenLight = Color(red: 168/255, green: 224/255, blue: 99/255)   // #A8E063
    static let snapSage = Color(red: 104/255, green: 149/255, blue: 99/255)         // #689563
    static let snapOlive = Color(red: 112/255, green: 125/255, blue: 84/255)        // #707D54
    
    // MARK: - System-Aligned Colors
    // For status indicators, alerts, and success/warning states
    
    static let snapSuccess = Color(red: 52/255, green: 199/255, blue: 89/255)       // #34C759 - iOS system green
    static let snapWarning = Color(red: 255/255, green: 149/255, blue: 0/255)       // #FF9500 - iOS system orange
    static let snapAlert = Color(red: 255/255, green: 59/255, blue: 48/255)         // #FF3B30 - iOS system red
    static let snapInfo = Color(red: 0/255, green: 122/255, blue: 255/255)          // #007AFF - iOS system blue
    
    // MARK: - Text Colors
    // Semantic text hierarchy that works with iOS
    
    static let snapTextPrimary = Color.primary                                       // adapts to light/dark
    static let snapTextSecondary = Color.secondary                                   // muted, iOS style
    static let snapTextMuted = Color(red: 60/255, green: 60/255, blue: 67/255).opacity(0.3)
    
    // MARK: - Surface Colors
    // For cards, sheets, and containers
    
    static let snapCardBackground = Color.white
    static let snapGroupedBackground = Color(red: 242/255, green: 242/255, blue: 247/255)  // iOS grouped list bg
}
