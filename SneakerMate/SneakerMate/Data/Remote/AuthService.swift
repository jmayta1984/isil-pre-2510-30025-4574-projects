//
//  AuthService.swift
//  SneakerMate
//
//  Created by user272495 on 5/27/25.
//

import Foundation

class AuthService {
    
   
    func login(request: LoginRequest, completion: @escaping(LoginResponse?, String?) -> Void) {
        let url = "https://dummyjson.com/auth/login"
        
        HttpRequestHelper().POST(url: url, request: request) { success, data, message in
            if (success) {
                guard let data = data else {
                    completion(nil, message ?? "Error: no data")
                    return
                }
                do {
                    let loginResponse = try JSONDecoder().decode(LoginResponse.self, from: data)
                    completion(loginResponse, nil)

                } catch let error {
                    completion(nil, error.localizedDescription)

                }
            } else {
                completion(nil, message ?? "Error: no response")
            }
        }
    }
    
    
}
