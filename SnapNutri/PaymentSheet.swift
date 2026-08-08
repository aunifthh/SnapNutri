//
//  PaymentSheet.swift
//  SnapNutri
//
//  Created by auni fatihah auzi on 05/08/2026.
//

import SwiftUI

struct PaymentSheet: View {
    @Binding var showPayment: Bool
    
    var body: some View {
        VStack(spacing: 16) {
            // header
            HStack {
                Image(systemName: "applelogo")
                Text("Pay").bold()
                Spacer()
//                Button(action: { showPayment = false }) {
//                    Image(systemName: "x.circle")
//                        .font(.title2)
//                        .foregroundStyle(Color("hijausecond"))
//                }
            }
            .font(.largeTitle)
            .padding(.top)
            
            // card row
            HStack {
                Image("maybankcard")
                    .resizable().scaledToFit()
                    .frame(width: 60, height: 40)
                Text("Maybank Visa Platinum")
                    .font(.subheadline)
                    .foregroundStyle(.black)
                Spacer()
                Text("···· 1234")
                    .font(.subheadline)
                    .foregroundStyle(.black)
            }
            .padding()
            .background(.white, in: RoundedRectangle(cornerRadius: 20))
            .shadow(radius: 10)
            
            // change payment method
            HStack {
                Text("Change Payment Method")
                    .font(.subheadline)
                    .foregroundStyle(.black)
                Spacer()
                Image(systemName: "chevron.right.circle")
                    .foregroundStyle(.black)
            }
            .padding()
            .background(.white, in: RoundedRectangle(cornerRadius: 20))
            .shadow(radius: 10)
            
            // plan details
            VStack(alignment: .leading, spacing: 4) {
                Text("SnapNutri")
                    .font(.subheadline).bold()
                    .foregroundStyle(.black)
                    .frame(maxWidth: .infinity, alignment: .center)
                Divider()
                Text("7-day free trial").font(.subheadline).bold()
                    .foregroundStyle(.black)
                Text("Starting today")
                    .font(.caption).foregroundStyle(.secondary)
                Text("RM 14.90 per month").font(.subheadline).bold()
                    .foregroundStyle(.black)
                Text("Starting on 4 August 2026")
                    .font(.caption).foregroundStyle(.secondary)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(.white, in: RoundedRectangle(cornerRadius: 20))
            .shadow(radius: 10)
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    PaymentSheet(showPayment: .constant(true))
}
