//
//  ProductListViewModel.swift
//  Inventory
//
//  Created by user272495 on 4/29/25.
//

import Foundation

class ProductListViewModel: ObservableObject {
    @Published var products = [Product]()
    let productDao = ProductDao()
    
    func addProduct(name: String) {
        productDao.addProduct(name: name)
        fetchProducts()
    }
    
    func fetchProducts() {
        products = productDao.fetchProducts()
    }
}
