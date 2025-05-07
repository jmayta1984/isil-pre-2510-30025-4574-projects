//
//  Untitled.swift
//  Inventory
//
//  Created by user272495 on 5/6/25.
//

import Foundation

class ProductDetailViewModel: ObservableObject {
    @Published var name = ""
    @Published var quantity = ""
    
    @Published var errorMessage: String? = nil
    
    func validate(id: UUID?) -> Product? {
        guard !name.isEmpty else {
            errorMessage = "Name is empty"
            return nil
        }
        guard !quantity.isEmpty else {
            errorMessage = "Quantity is empty"
            return nil
        }
        
        guard let quantity = Int16(quantity) else {
            errorMessage = "Invalid quantity"
            return nil
        }
        errorMessage = nil
   
        return Product(id: id ?? UUID(), name: name, quantity: quantity)
    }
}
