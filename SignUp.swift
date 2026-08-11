//
//  SignUp.swift
//  SnapNutri
//
//  Created by STDCX_MACBOOK PRO 38 on 05/08/2026.
//

import SwiftUI

struct SignUp: View {
    @State private var email = ""
    @State private var password = ""
    @State private var showPassword = false
    @State private var test = ""

    
    var body: some View {
        VStack(spacing: 0) {
            
            /*HStack {
                Text("RM").foregroundColor(.gray)
                TextField("0", text: $test)
                    .keyboardType(.decimalPad)
                    .fontWeight(.bold)
            }*/
            
            
            Text("Email")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 4)
                .bold()
            
            TextField("Enter your email", text: $email)
                .textFieldStyle(.roundedBorder)
                .padding(.bottom, 24)
            
            Text("Password")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 4)
                .bold()
            
            HStack {
                if showPassword {
                    TextField("Enter your Password", text: $password)
                } else {
                    SecureField("Enter your Password", text: $password)
                }
                
                Button {
                    showPassword.toggle()
                } label: {
                    Image(systemName: showPassword ? "eye.slash" : "eye")
                }
            }
            .textFieldStyle(.roundedBorder)
            .padding(.bottom, 24)
            
            Text("Confirm Password")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 4)
                .bold()
            
            HStack {
                if showPassword {
                    TextField("Enter your Password", text: $password)
                } else {
                    SecureField("Enter your Password", text: $password)
                }
                
                Button {
                    showPassword.toggle()
                } label: {
                    Image(systemName: showPassword ? "eye.slash" : "eye")
                }
            }
            .textFieldStyle(.roundedBorder)
            .padding(.bottom, 24)
            
            Text("Sign Up")
                .padding(20)
                .padding(.horizontal,76)
                .foregroundStyle(Color.white)
                .background(.blue, in: RoundedRectangle(cornerRadius: 12))
            
            Divider()
                .padding()
            HStack {
                Button("Sign Up", systemImage: "apple.logo"){
                    //
                }
                
                    .padding()
                    .padding(.horizontal,50)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(.black, lineWidth: 1))
                
                Group {
                    Button {
                        
                    } label: {
                        HStack {
                            Image("google")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24)

                        }
                    }
                    //.frame(width: 25, height: 25)
                    .padding()
                    .padding(.horizontal,50)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(.black, lineWidth: 1))
                     }
            
            }
            .labelStyle(.iconOnly)
            .font(.title2)
            .foregroundStyle(.black)
            
        }
        .padding(32)
    }
}

#Preview {
    SignUp()
}
