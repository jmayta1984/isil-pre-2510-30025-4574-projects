//
//  LoginViewModel.swift
//  SneakerMate
//
//  Created by user272495 on 5/20/25.
//

import Foundation

class LoginViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    @Published var isLoggedIn = false
    
    func login() {
        AuthService().login(request: LoginRequest(username: email, password: password)) { response, _ in
            if let response = response {
                self.isLoggedIn = true
            }
        }
    }
}
