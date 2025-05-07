//
//  ProductEntity+Extensions.swift
//  Inventory
//
//  Created by user272495 on 5/6/25.
//

import Foundation

extension ProductEntity {

    /// Returns a Product
    func toProduct() -> Product {
        return Product(id: id ?? UUID(), name: name ?? "", quantity: quantity)
    }
}
