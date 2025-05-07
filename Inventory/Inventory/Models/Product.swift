//
//  Product.swift
//  Inventory
//
//  Created by user272495 on 5/6/25.
//

import Foundation

struct Product: Identifiable, Equatable {
    let id: UUID
    let name: String
    let quantity: Int16
}
