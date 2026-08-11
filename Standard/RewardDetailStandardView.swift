//
//  RewardDetailStandardView.swift
//  SnapNutri
//
//  Created by auni fatihah auzi on 08/08/2026.
//

import SwiftUI

struct RewardDetaiStandardlView: View {
    let logo: String        
    let title: String
    let cost: String
    let validity: String

    @State private var claimed = false
    @State private var code = ""

    var body: some View {
        ZStack {
            Color("hijaumain")
                .ignoresSafeArea()

            VStack(spacing: 24) {
                // logo card
                Image(logo)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 180, height: 70)
                    .padding(24)
                    .background(.white, in: RoundedRectangle(cornerRadius: 20))
                    .shadow(radius: 4)
                    .padding(.top, 20)

                Text(title)
                    .font(.title2).bold()
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)

                // claim for n validity
                HStack {
                    VStack(spacing: 8) {
                        Text("Claim for")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                        Text(cost)
                            .font(.title3).bold()
                    }
                    .frame(maxWidth: .infinity)

                    VStack(spacing: 8) {
                        Text("Validity")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                        Text(validity)
                            .font(.title3).bold()
                            .multilineTextAlignment(.center)
                    }
                    .frame(maxWidth: .infinity)
                }
                .padding(.top)

                Spacer()

                // claim button n revealed code
                if claimed {
                    VStack(spacing: 8) {
                        Text("Your Voucher Code")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                        Text(code)
                            .font(.system(.title2, design: .monospaced)).bold()
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color(.systemGray6),
                                        in: RoundedRectangle(cornerRadius: 16))
                        Text("Show this code at checkout")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                    .padding()
                    .transition(.opacity)
                } else {
                    Button(action: {
                        code = generateCode()
                        withAnimation { claimed = true }
                    }) {
                        Text("Claim")
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue,
                                        in: RoundedRectangle(cornerRadius: 16))
                    }
                    .padding()
                }
            }
        }
        .navigationTitle("Reward Detail")
        .navigationBarTitleDisplayMode(.inline)
    }

    // mock code generator
    func generateCode() -> String {
        let chars = "ABCDEFGHIJKLMNPQRSTUVWXYZ0123456789"
        let part = { String((0..<4).map { _ in chars.randomElement()! }) }
        return "\(part())-\(part())"
    }
}

#Preview {
    NavigationStack {
        RewardDetaiStandardlView(
            logo: "jayagrocer",
            title: "Jaya Grocer RM 5 in-store voucher",
            cost: "200 pts",
            validity: "30 days upon redemption"
        )
    }
}
