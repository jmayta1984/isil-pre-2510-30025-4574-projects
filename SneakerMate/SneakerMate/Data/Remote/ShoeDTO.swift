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
    let description: String
    let sizes: [ShoeSizeDTO]
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case price
        case image
        case description
        case sizes = "sizes_available"
        
    }
    
    func toDomain() -> Shoe {
        Shoe(id: id, name: name, price: price, image: image, description: description,
             sizes: sizes.map({ $0.toDomain() })
        )
    }
}

struct ShoeSizeDTO: Decodable {
    let size: Double
    let quantity: Int
    
    func toDomain() -> ShoeSize {
        ShoeSize(size: "\(size)", stock: quantity)
    }
}
