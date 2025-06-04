//
//  ShoeDTO.swift
//  SneakerMate
//
//  Created by user272495 on 6/3/25.
//

struct ShoeDTO: Identifiable, Decodable {
    let id: Int
    let name: String
    let price: Int
    let image: String
    
    func toDomain() -> Shoe {
        Shoe(id: id, name: name, price: price, image: image)
    }
}
