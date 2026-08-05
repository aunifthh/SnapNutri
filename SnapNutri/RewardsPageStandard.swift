//
//  RewardsPage.swift
//  SnapNutri
//
//  Created by auni fatihah auzi on 04/08/2026.
//

import SwiftUI

struct RewardsPageStandard: View {
    var body: some View {
        ZStack {
            Color("hijaumain")
                .ignoresSafeArea()
            
            //title
                VStack {
                    HStack {
                        HStack {
                            Text("Rewards")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .padding(.leading)
                            
//                            HStack(spacing:4){
////                                Image(systemName: "crown.fill")
////                                    .font(.caption)
////                                    .foregroundStyle(.yellow)
////
////                                Text("Premium")
////                                    .font(.caption)
////                                    .bold()
////                                    .foregroundStyle(.yellow)
//                                
//                            }
//                            .padding()
//                            .background(Color("hijausecond"), in: RoundedRectangle(cornerRadius: 100))
//                            .frame(width: 110, height: 30)
//                            .clipShape(Capsule())
//                            .shadow(radius: 5)
                            
                        }
                        Spacer()
                        
                        //profile icon
                        Image(systemName: "person.circle")
                            .font(.system(size: 40))
                            .foregroundStyle(Color("grey"))
                            .frame(width: 80, height: 80)
                    }
                    
                    //points card
                    VStack (alignment: .leading, spacing: 2){
                        VStack(spacing: 12){
                            HStack{
                                Text("Your Points")
                                    .font(.subheadline)
                                    .foregroundStyle(.black)
                                    .bold()
                                Spacer()
//                                Text("2X Multiplier")
//                                    .font(.caption)
//                                    .foregroundStyle(.white)
//                                    .padding(.horizontal, 12)
//                                    .padding(.vertical, 6)
//                                    .background(Color("hijauthird"), in: RoundedRectangle(cornerRadius: 60))
//                                    .padding(.leading)
                            }
                            HStack {
                                Text("240")
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                                    .foregroundStyle(Color("hijausecond"))
                                    .padding(.trailing)
                                Text("pts")
                                    .font(.subheadline)
                                    .foregroundStyle(Color("hijausecond"))
                                    .padding(.top)
                            }
                        }
                        .padding(.bottom)
                        
                        Divider()
                            .background(.black)
                        
                        VStack (alignment: .leading, spacing: 2){
                            HStack{
                                Image(systemName: "flame.fill")
                                    .font(.title3)
                                    .foregroundStyle(.orange)
                                    .shadow(radius: 50)
                                
                                Text("12-day streak")
                                    .font(.subheadline)
                                    .foregroundStyle(.black)
                                    .bold()
                            }
                            
                            Text("Log a meal to keep it going")
                                .font(.system(.caption))
                                .foregroundStyle(.black)
                                .padding(.top)
                        }
                        .padding(.top)
                    }
                    .padding()
                    .frame(width: 370)
                    .background(Color(.white))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .shadow(radius: 30)
                    
                    //earn 2x on everything
                    VStack(alignment: .leading, spacing: 8){
                        Text("How You Earn")
                            .font(.title3)
                            .bold()
                        
                        VStack (alignment:.leading, spacing: 12){
                            HStack{
                                Text("Log all 3 meals")
                                    .font(.subheadline)
                                    .foregroundStyle(.black)
                                Spacer()
                                Text("+20 pts")
                                    .font(.subheadline)
                                    .foregroundStyle(.black)
                                    .bold()
                            }
                            .foregroundStyle(.white)
                            Divider().background(.white)
                            HStack{
                                Text("Monthly update height & weight")
                                    .font(.subheadline)
                                    .foregroundStyle(.black)
                                Spacer()
                                Text("+40 pts")
                                    .font(.subheadline)
                                    .foregroundStyle(.black)
                                    .bold()
                            }
                            .foregroundStyle(.white)
                            Divider().background(.white)
                            HStack{
                                Text("Reached healthy BMI")
                                    .font(.subheadline)
                                    .foregroundStyle(.black)
                                Spacer()
                                Text("+100 pts")
                                    .font(.subheadline)
                                    .foregroundStyle(.black)
                                    .bold()
                            }
                            .foregroundStyle(.white)
                            
                        }
                        .padding()
                        .background(Color(.white), in: RoundedRectangle(cornerRadius: 20))
                        .shadow(radius: 30)
                        
                    }
                    .padding()
                    
                    //exclusive vouchers
                    VStack(alignment: .leading, spacing: 8){
                        Text("Redeem Vouchers")
                            .font(.title3)
                            .bold()
                        
                        VStack (spacing: 12){
                            HStack{
                                
                                HStack{
                                    Image("jayagrocer")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 80, height: 35)
                                            .padding(10)
                                            .background(.white, in: RoundedRectangle(cornerRadius: 20))
                                            //.shadow(radius: 10)
                                }
                                VStack (alignment: .leading, spacing: 5){
                                    Text("RM 20 Off Voucher")
                                        .font(.subheadline)
                                        .foregroundStyle(.black)
                                        .bold()
                                    Text("400 pts")
                                        .font(.subheadline)
                                        .foregroundStyle(Color("hijausecond"))
                                        .bold()
                                }
                                Spacer()
                                Button(action: {
                                    // claim action
                                }) {
                                    Text("Claim")
                                        .font(.subheadline)
                                        .fontWeight(.semibold)
                                        .foregroundStyle(.white)
                                        .padding(.horizontal, 20)
                                        .padding(.vertical, 8)
                                        .background(Color.blue)
                                        .clipShape(Capsule())
                                        .shadow(radius: 1)
                                }
                            }
                            
                        }
                        .padding()
                        .frame(width: 370, height: 100)
                        .background(Color(.white), in: RoundedRectangle(cornerRadius: 20))
                        .shadow(radius: 30)
                        
                    }
                    .padding()
                    Spacer()
                }
            
            
        }
    }
}

#Preview {
    RewardsPageStandard()
}
