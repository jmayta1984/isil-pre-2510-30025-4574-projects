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
    @Published var state: UIState<User> = .idle
    
    func login() {
        state = .loading
        AuthService().login(request: LoginRequestDTO(username: username, password: password)) { user, message in
            DispatchQueue.main.async {
                if let user = user {
                    self.state = .success(user)
                } else  {
                    self.state = .failure(message ?? "Unknown error")
                }
            }
        }
    }
}
