//
//  AuthViewModel.swift
//  SneakerMate
//
//  Created by user272495 on 6/24/25.
//

import Foundation

class AuthViewModel: ObservableObject {
    @Published private(set) var user: User? = nil
    
    func login(user: User) {
        self.user = user
    }
    
    func logout() {
        self.user = nil
    }
}
