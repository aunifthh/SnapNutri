//
//  RewardsPagePremium.swift
//  SnapNutri
//
//  Created by auni fatihah auzi on 04/08/2026.
//

import SwiftUI

struct RewardsPagePremium: View {
    var body: some View {
        NavigationStack {
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
                        NavigationLink {
                            ProfilePage()
                        } label: {
                            Image(systemName: "person.circle")
                                .font(.system(size: 40))
                                .foregroundStyle(Color("grey"))
                                .frame(width: 80, height: 80)
                        }
                    }
                    
                    //points card
                    VStack (alignment: .leading, spacing: 2){
                        VStack(spacing: 12){
                            HStack{
                                Text("Your Points")
                                    .font(.subheadline)
                                    .foregroundStyle(.white)
                                    .bold()
                                Spacer()
                                Text("2X Multiplier")
                                    .font(.caption)
                                    .foregroundStyle(.white)
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 6)
                                    .background(Color("hijauthird"), in: RoundedRectangle(cornerRadius: 60))
                                    .padding(.leading)
                            }
                            HStack{
                                Text("480")
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                                    .foregroundStyle(.yellow)
                                    .padding(.trailing)
                                Text("pts")
                                    .font(.subheadline)
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
                                        .foregroundStyle(.white)
                                    Text("400 pts")
                                        .font(.subheadline)
                                        .foregroundStyle(.yellow)
                                        .bold()
                                }
                                Spacer()
                                NavigationLink {
                                    RewardDetailView(
                                        logo: "jayagrocer",
                                        title: "Jaya Grocer RM 20 in-store voucher",
                                        cost: "400 pts",
                                        validity: "30 days upon redemption"
                                    )
                                } label: {
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
    RewardsPagePremium()
}
