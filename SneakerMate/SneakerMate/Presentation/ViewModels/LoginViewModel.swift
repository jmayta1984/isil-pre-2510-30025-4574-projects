//
//  LoginViewModel.swift
//  SneakerMate
//
//  Created by user272495 on 5/20/25.
//

import Foundation

class LoginViewModel: ObservableObject {
    
    @Published var username = ""
    @Published var password = ""
    @Published var isLoggedIn = false
    
    func login() {
        AuthService().login(request: LoginRequest(username: username, password: password)) { response, _ in
            DispatchQueue.main.async{
                if let _ = response {
                    self.isLoggedIn = true
                }
            }
        }
    }
}
