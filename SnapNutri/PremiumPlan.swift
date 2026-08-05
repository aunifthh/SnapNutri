//
//  PremiumPlan.swift
//  SnapNutri
//
//  Created by auni fatihah auzi on 05/08/2026.
//

import SwiftUI

struct PremiumPlan: View {
    var body: some View {
        ZStack {
            Color("hijaumain")
                .ignoresSafeArea()
            
            VStack{
                HStack{
                    Spacer()
                    Image(systemName: "x.circle")
                        .font(.title)
                        .foregroundStyle(.gray)
                }
                Image(systemName: "carrot")
                    .font(.largeTitle)
                
                HStack (spacing:4){
                    Text("Snap")
                        .foregroundStyle(Color("hijausecond"))
                        .bold()
                        .font(.largeTitle)
                    Text("Nutri")
                        .foregroundStyle(.yellow)
                        .bold()
                        .font(.largeTitle)
                    
                    HStack(spacing:4){
                        Image(systemName: "crown.fill")
                            .font(.caption)
                            .foregroundStyle(.yellow)
                        
                        Text("Premium")
                            .font(.caption)
                            .bold()
                            .foregroundStyle(.yellow)
                        
                    }
                    .padding()
                    .background(Color("hijausecond"), in: RoundedRectangle(cornerRadius: 100))
                    .frame(width: 110, height: 30)
                    .clipShape(Capsule())
                    //.shadow(radius: 5)
                    
                }
                //.shadow(radius:10)
                
                Text("Track your meal with a photo.")
                    .font(.subheadline)
                    .foregroundStyle(.gray)
                
                VStack(alignment: .leading, spacing: 8){
                    VStack (alignment:.leading, spacing: 12){
                        HStack{
                            Image(systemName: "checkmark.seal")
                                .foregroundStyle(.white)
                            Text("Cook From What You Have")
                                .font(.subheadline)
                                .foregroundStyle(.white)
                        }
                        Divider().background(.white)
                        HStack{
                            Image(systemName: "checkmark.seal")
                                .foregroundStyle(.white)
                            Text("Grocery Ordering Integration")
                                .font(.subheadline)
                                .foregroundStyle(.white)
                        }
                        Divider().background(.white)
                        HStack{
                            Image(systemName: "checkmark.seal")
                                .foregroundStyle(.white)
                            Text("Monthly and Yearly Insights")
                                .font(.subheadline)
                                .foregroundStyle(.white)
                        }
                    }
                    .padding()
                    .background(Color("hijausecond"), in: RoundedRectangle(cornerRadius: 20))
                    .shadow(radius: 2)
                    
                }
                .padding()
                
                // plan card
                VStack(alignment: .leading, spacing: 4) {
                    Text("Save 28%")
                        .font(.caption2).bold()
                        .foregroundStyle(.white)
                        .padding(.horizontal, 10).padding(.vertical, 3)
                        .background(Color(.systemBlue), in: Capsule())
                    
                    HStack(alignment: .firstTextBaseline, spacing: 4) {
                        Text("RM 129")
                            .font(.system(size: 28, weight: .bold))
                        Text("/ year")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                    Text("RM 10.75 / month, billed annually")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color(.systemBlue), lineWidth: 2)
                        .shadow(radius: 1)
                )
                .padding(.trailing)
                .padding(.leading)
                
                // CTA
                Button(action: {
                    print("Custom button tapped")
                }) {
                    HStack {
                        //Image(systemName: "square.and.arrow.down.fill")
                        Text("Start 7-day free trial")
                    }
                    .padding()
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .background(Color(.systemBlue), in: RoundedRectangle(cornerRadius: 16))
                    .shadow(radius: 1)
                }.padding()
                
                Text("7 days free, then RM 129/year. Renews automatically unless cancelled at least 24 hours before the period ends. Payment is charged to your Apple ID. Manage or cancel anytime in Settings.")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
                    .padding()
                
                HStack{
                    Text("Terms of Use")
                        .font(.subheadline)
                        .foregroundStyle(.blue)
                    Text("·").foregroundStyle(.secondary)
                    Text("Privacy Policy")
                        .font(.subheadline)
                        .foregroundStyle(.blue)
                }
                
                
            }
            .padding()
            .frame(width: 370, height: 700)
            .background(.white, in: RoundedRectangle(cornerRadius: 20))
            .shadow(radius: 10)
        }
    }
}

#Preview {
    PremiumPlan()
}
