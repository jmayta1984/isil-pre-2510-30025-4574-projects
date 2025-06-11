//
//  Shoe.swift
//  SneakerMate
//
//  Created by user272495 on 5/20/25.
//

import Foundation

struct Shoe: Identifiable, Equatable, Hashable {
    let id: Int
    let name: String
    let price: Int
    let image: String
    let description: String
    let sizes: [ShoeSize]
}

struct ShoeSize: Equatable, Hashable {
    let size: String
    let stock: Int
}
