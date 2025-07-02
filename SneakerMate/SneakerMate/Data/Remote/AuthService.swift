//
//  AuthService.swift
//  SneakerMate
//
//  Created by user272495 on 5/27/25.
//

import Foundation

class AuthService {
    static let shared = AuthService()
    private init(){}
    
   
    func login(request: LoginRequestDTO, completion: @escaping(User?, String?) -> Void) {
        let url = "https://dummyjson.com/auth/login"
        
        HttpRequestHelper().POST(url: url, request: request) { data, message in
            
            guard message == nil else {
                completion(nil, message )
                return
            }
            
            guard let data = data else {
                completion(nil, message)
                return
            }
            
            do {
                let user = try JSONDecoder().decode(UserDTO.self, from: data).toDomain()
                completion(user, nil)
                
            } catch let decodingError {
                completion(nil, decodingError.localizedDescription)
            }
            
            
        }
    }
    
    
}
