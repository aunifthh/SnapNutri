//
//  PremiumPlan.swift
//  SnapNutri
//
//  Created by auni fatihah auzi on 05/08/2026.
//

import SwiftUI

struct PremiumPlan: View {
    @State private var showPayment = false
    @State private var pulse = false
    
    var body: some View {
        ZStack(alignment: .trailing) {
            
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
                        showPayment = true
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
            
            if showPayment {
                HStack(spacing: 8) {
                    Text("Double-Click\nto Subscribe")
                        .font(.title3).bold()
                        .foregroundStyle(.black)
                        .multilineTextAlignment(.trailing)
                        .fixedSize()
                    
                    Capsule()
                        .fill(.black)
                        .frame(width: 6, height: 90)
                        .shadow(radius: 3)
                }
                .padding(.trailing, 4)
                .offset(y: -180)
                .scaleEffect(pulse ? 1.08 : 1.0, anchor: .trailing)
                .offset(x: pulse ? -6 : 0)
                .transition(.opacity)
                .onAppear {
                    withAnimation(.easeInOut(duration: 0.7).repeatForever(autoreverses: true)) {
                        pulse = true
                    }
                }
                .onDisappear { pulse = false }
            }
        }
        .animation(.easeInOut, value: showPayment)
        .sheet(isPresented: $showPayment) {
            PaymentSheet(showPayment: $showPayment)
                .presentationDetents([.medium, .large])
                .presentationDragIndicator(.visible)
        }
    }
}

#Preview {
    PremiumPlan()
}
