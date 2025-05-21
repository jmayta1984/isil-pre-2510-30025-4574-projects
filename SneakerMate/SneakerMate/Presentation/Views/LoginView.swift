//
//  LoginView.swift
//  SneakerMate
//
//  Created by user272495 on 5/20/25.
//

import SwiftUI

struct LoginView: View {
    
   @StateObject private var viewModel = LoginViewModel()
    
    
    var body: some View {
        NavigationStack {
            
            VStack (spacing: 20){
                
                TextField("Email", text: $viewModel.email)
                    .keyboardType(.emailAddress)
                    .textInputAutocapitalization(.none)
                    .padding()
                    .background(Color(.systemGray6))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                TextField("Password", text: $viewModel.password)
                    .padding()
                    .background(Color(.systemGray6))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                Button(action: {
                    viewModel.login()
                }) {
                    Text("Sign in")
                        .frame(maxWidth: .infinity)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.black)
                .foregroundStyle(.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                
                Button(action: {
                }) {
                    Text("Sign up")
                }
                .foregroundStyle(.black)
                
                
            
            }
            .padding()
            .navigationDestination(isPresented: $viewModel.isLoggedIn) {
               HomeView()
            }
        }
    }
}

#Preview {
    LoginView()
}
