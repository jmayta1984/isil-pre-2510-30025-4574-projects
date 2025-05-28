//
//  LoginResponse.swift
//  SneakerMate
//
//  Created by user272495 on 5/27/25.
//

struct LoginResponse: Decodable {
    let id: Int
    let username: String
    let firstName: String
    let lastName: String
    let image: String
}
