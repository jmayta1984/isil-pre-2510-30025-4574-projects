//
//  LoginView.swift
//  SneakerMate
//
//  Created by user272495 on 5/20/25.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject private var viewModel = LoginViewModel()
    @State private var user: User? = nil
    @State private var showErrorAlert = false
    @State private var alertMessage = ""

    
    var body: some View {
        NavigationStack {
            
            ZStack {
                VStack (spacing: 20){
                    
                    TextField("Username", text: $viewModel.username)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                        .padding()
                        .background(Color(.systemGray6))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                    TextField("Password", text: $viewModel.password)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                        .padding()
                        .background(Color(.systemGray6))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                    Button(action: {
                        viewModel.login()
                    }) {
                        Text("Sign in")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.black)
                            .foregroundStyle(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                 
                    
                    Button(action: {
                    }) {
                        Text("Sign up")
                    }
                    .foregroundStyle(.black)
                }
                .disabled(.loading == viewModel.state)
                if case .loading = viewModel.state {
                    ProgressView()
                }
            }
            .padding()
            .onChange(of: viewModel.state){ oldValue, newValue in
                switch newValue {
                case .failure(let message):
                    self.alertMessage = message
                    self.showErrorAlert = true
                case .success(let user):
                    self.user = user
                default :
                    break
                }
            }
            .alert("Error", isPresented: $showErrorAlert, actions: {
                Button("OK", role: .cancel){}
            }, message: {
                Text(alertMessage)
            })
            .navigationDestination(item: $user) { user in
                ContentView(user: user)
            }
        }
    }
}

#Preview {
    LoginView()
}
