//
//  CartItem.swift
//  SneakerMate
//
//  Created by user272495 on 6/10/25.
//

struct CartItem: Identifiable {
    let id: Int
    let name: String
    let price: Int
    let image: String
    let size: String
    var quantity: Int
}
