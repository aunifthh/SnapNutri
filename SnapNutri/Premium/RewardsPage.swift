//
//  RewardsPage.swift
//  SnapNutri
//
//  Created by auni fatihah auzi on 04/08/2026.
//

import SwiftUI

struct RewardsPage: View {
    var body: some View {
        ZStack {
            Color("hijaumain")
                .ignoresSafeArea()
            
            //title
            ScrollView {
                VStack {
                    HStack {
                        HStack {
                            Text("Rewards")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .padding(.leading)
                            
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
                            .shadow(radius: 5)
                            
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
                                    .foregroundStyle(.white)
                                    .bold()
                                
                                Text("2X Multiplier")
                                    .font(.caption)
                                    .foregroundStyle(.white)
                                    .padding(.horizontal, 12)    // add this
                                    .padding(.vertical, 6)
                                    .background(Color("hijauthird"), in: RoundedRectangle(cornerRadius: 60))
                                    .padding(.leading)
                            }
                            HStack{
                                Text("480")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundStyle(.yellow)
                                Text("pts")
                                    .font(.caption)
                                    .foregroundStyle(.yellow)
                                    .padding(.top)
                            }
                        }
                        .padding(.bottom)
                        
                        Divider()
                            .background(.white)
                        
                        VStack (alignment: .leading, spacing: 2){
                            HStack{
                                Image(systemName: "flame.fill")
                                    .font(.title3)
                                    .foregroundStyle(.orange)
                                    .shadow(radius: 50)
                                
                                Text("12-day streak")
                                    .font(.subheadline)
                                    .foregroundStyle(.white)
                                    .bold()
                            }
                            
                            Text("Streak insurance protects one missed day")
                                .font(.system(.caption))
                                .foregroundStyle(.white)
                                .padding(.top)
                        }
                        .padding(.top)
                    }
                    .padding()
                    .frame(width: 370)
                    .background(Color("hijausecond"))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .shadow(radius: 30)
                    
                    //earn 2x on everything
                    VStack(alignment: .leading, spacing: 8){
                        Text("Earn 2x On Everything")
                            .font(.title3)
                            .bold()
                        
                        VStack (alignment:.leading, spacing: 12){
                            HStack{
                                Text("Log all 3 meals")
                                    .font(.subheadline)
                                Spacer()
                                Text("+20 pts")
                                    .font(.subheadline)
                                    .bold()
                            }
                            .foregroundStyle(.white)
                            Divider().background(.white)
                            HStack{
                                Text("Monthly update height & weight")
                                    .font(.subheadline)
                                Spacer()
                                Text("+40 pts")
                                    .font(.subheadline)
                                    .bold()
                            }
                            .foregroundStyle(.white)
                            Divider().background(.white)
                            HStack{
                                Text("Reached healthy BMI")
                                    .font(.subheadline)
                                Spacer()
                                Text("+100 pts")
                                    .font(.subheadline)
                                    .bold()
                            }
                            .foregroundStyle(.white)
                            
                        }
                        .padding()
                        .background(Color("hijausecond"), in: RoundedRectangle(cornerRadius: 20))
                        .shadow(radius: 30)
                        
                    }
                    .padding()
                    
                    //exclusive vouchers
                    VStack(alignment: .leading, spacing: 8){
                        Text("Exclusive Vouchers")
                            .font(.title3)
                            .bold()
                        
                        VStack (spacing: 12){
                            HStack{
                                
                                VStack(alignment: .leading){
                                    Image("jayagrocer")
                                        .resizable()
                                        .frame(width: 80, height: 35)
                                }
                                .background(.white, in:RoundedRectangle(cornerRadius: 20))
                                .shadow(radius: 10)
                                .clipShape(.capsule)
                                VStack (alignment: .leading, spacing: 5){
                                    Text("RM 20 Off Voucher")
                                        .font(.subheadline)
                                        .foregroundStyle(.white)
                                    Text("400 pts")
                                        .font(.subheadline)
                                        .foregroundStyle(.yellow)
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
                                        .shadow(radius: 3)
                                }
                            }
                            
                        }
                        .padding()
                        .frame(width: 370, height: 100)
                        .background(Color("hijauthird"), in: RoundedRectangle(cornerRadius: 20))
                        .shadow(radius: 30)
                        
                    }
                    .padding()
                    Spacer()
                }
            }
            
        }
    }
}

#Preview {
    RewardsPage()
}
