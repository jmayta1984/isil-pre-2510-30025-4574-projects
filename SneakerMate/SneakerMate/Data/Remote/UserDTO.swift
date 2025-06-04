//
//  LoginResponse.swift
//  SneakerMate
//
//  Created by user272495 on 5/27/25.
//

struct UserDTO: Decodable {
    let id: Int
    let username: String
    let firstName: String
    let lastName: String
    let image: String
    
    func toDomain() -> User {
        User(id: id, username: username, firstName: firstName, lastName: lastName, image: image)
    }
}
