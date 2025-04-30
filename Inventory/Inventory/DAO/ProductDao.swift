//
//  ProductDao.swift
//  Inventory
//
//  Created by user272495 on 4/29/25.
//

import CoreData

struct ProductDao {
    private let context = PersistenceController.shared.container.viewContext
    
    private func saveContext(){
        if (context.hasChanges) {
            do {
                try context.save()
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }
    
    func fetchProducts() -> [Product]  {
        let request: NSFetchRequest<Product> =  Product.fetchRequest()
        
        do {
            return try context.fetch(request)
        } catch let error {
            print(error.localizedDescription)
            return []
        }
        
    }
    
    func addProduct(name: String) {
        let product = Product(context: context)
        product.name = name
        saveContext()
    }
}
