//
//  ProductListViewModel.swift
//  Inventory
//
//  Created by user272495 on 4/29/25.
//

import Foundation

class ProductListViewModel: ObservableObject {
    @Published var products = [Product]()
    private let productDao = ProductDao()
    
    
    func addProduct(product: Product) {
        productDao.addProduct(product: product)
        fetchProducts()
    }
    
    func updateProduct(product: Product) {
        productDao.updateProduct(product: product)
        fetchProducts()
    }
    
    func removeProduct(indexSet: IndexSet) {
        if let index = indexSet.first {
            productDao.removeProduct(product: products[index])
            fetchProducts()
        }
    }
    
    func fetchProducts() {
        products = productDao.fetchProducts().map({ $0.toProduct() })
    }
}
