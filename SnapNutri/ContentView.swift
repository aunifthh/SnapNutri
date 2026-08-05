//
//  ContentView.swift
//  SnapNutri
//
//  Created by auni fatihah auzi on 04/08/2026.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            //Home Page
            HomePage()
                .tabItem{Label("Home", systemImage: "house.fill")}
            
            //Trends
            TrendsPage()
                .tabItem{Label("Trends", systemImage:"chart.bar.xaxis")}
            //Snap
            SnapPage()
                .tabItem{Label("Snap", systemImage: "camera")}
            
            //History
            HistoryPage()
                .tabItem{Label("History", systemImage:"clock.arrow.trianglehead.counterclockwise.rotate.90")}
            
            //Rewards
            RewardsPagePremium()
                .tabItem{Label("Rewards", systemImage: "gift")}
        }
    }
}


#Preview {
    ContentView()
}
