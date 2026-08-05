//
//  PaymentSheet.swift
//  SnapNutri
//
//  Created by auni fatihah auzi on 05/08/2026.
//

import SwiftUI

struct PaymentSheet: View {
    @State private var showPayment = false
    
    var body: some View {
        var onClose: () -> Void = {}
        
        ZStack {
            Color("hijaumain")
                .ignoresSafeArea()
            VStack{
                HStack{
                    Image(systemName: "applelogo")
                    Text("Pay")
                        .bold()
                    Spacer()
                    Button(action: onClose) {
                        Image(systemName: "xmark.circle")
                            .font(.title2)
                            .foregroundStyle(Color("hijausecond"))
                    }
                }
                .padding()
                .font(.largeTitle)
                
                //1st row maybank card
                VStack (spacing: 16){
                    HStack{
                        Image("maybankcard")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60, height: 40)
                        
                        Text("Maybank Visa Platinum")
                            .font(.subheadline)
                            .foregroundStyle(.black)
                        Spacer()
                        Text("···· 1234")
                            .font(.subheadline)
                            .foregroundStyle(.black)
                            .padding(.leading)
                    }
                    //.foregroundStyle(.white)
                    .padding()
                    .background(Color(.white), in: RoundedRectangle(cornerRadius: 20))
                    .shadow(radius: 10)
                    
                    
                    //2nd row - change payment method
                    HStack {
                        Text("Change payment method")
                            .font(.subheadline)
                            .foregroundStyle(.black)
                        Spacer()
                        Image(systemName: "chevron.right.circle")
                    }
                    .padding()
                    .background(Color(.white), in: RoundedRectangle(cornerRadius: 20))
                    .shadow(radius: 10)
                    
                    //3rd row - plan details
                    VStack(alignment: .leading){
                        HStack{
                            Image(systemName: "carrot")
                            
                            VStack (alignment: .leading){
                                Text("SnapNutri")
                                    .font(.subheadline)
                                    .bold()
                                    .foregroundStyle(.black)
                                Text("App Store")
                                    .font(.caption2)
                                    .foregroundStyle(.gray)
                                Text("Premium Subscription")
                                    .font(.caption2)
                                    .foregroundStyle(.gray)
                                Divider()
                            }
                            
                        }
                        Text("7-day free trial")
                            .font(.subheadline).bold()
                        Text("Starting today")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                        
                        Text("RM 14.90 per month")
                            .font(.subheadline).bold()
                        Text("Starting on 4 August 2026")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                        
                    }
                    .padding()
                    .background(Color(.white), in: RoundedRectangle(cornerRadius: 20))
                    .shadow(radius: 10)
                    
                }
                
            }
            .padding()
        }
        
    }
}

#Preview {
    PaymentSheet()
}
