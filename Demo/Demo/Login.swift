//
//  Login.swift
//  Demo
//
//  Created by user272495 on 4/15/25.
//

import SwiftUI

struct Login: View {
    @State var username = ""
    @State var password = ""
    
    @State var isVisible = false
    var body: some View {
        VStack(spacing: 16) {
            TextField("Username", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            ZStack (alignment: .trailing){
                Group {
                    if (isVisible) {
                        TextField("Password", text: $password)
                            .autocapitalization(.none)
                        
                    } else {
                        SecureField("Password", text: $password)
                        
                    }
                }
                
                .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button(action: {
                    isVisible.toggle()
                }) {
                    Image(systemName: "eye.slash")
                }
            }
            
            Button(action: {}) {
                Text("Sign in")
                    .frame(maxWidth: .infinity)
                    .padding(8)
                    .background(Color.blue)
                    .foregroundStyle(.white)
                    .cornerRadius(8)
            }
            Button(action: {
            }) {
                Text("Sign up")
            }
        }
        .padding()
    }
}

#Preview {
    Login()
}
