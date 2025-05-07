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
    
    func fetchProducts() -> [ProductEntity]  {
        let request: NSFetchRequest<ProductEntity> =  ProductEntity.fetchRequest()
        
        do {
            return try context.fetch(request)
        } catch let error {
            print(error.localizedDescription)
            return []
        }
        
    }
    
    func addProduct(product: Product) {
        let productEntity = ProductEntity(context: context)
        productEntity.id = product.id
        productEntity.name = product.name
        productEntity.quantity = product.quantity
        saveContext()
    }
    
    func removeProduct(product: Product) {
        let request: NSFetchRequest<ProductEntity> =  ProductEntity.fetchRequest()
        request.predicate = NSPredicate(format: " id = %@", product.id as CVarArg)
        
        do {
            if let productEntity = try context.fetch(request).first {
                context.delete(productEntity)
                saveContext()
            }
        } catch let error {
            print(error.localizedDescription)
        }
        
        
    }
    
    func updateProduct(product: Product) {
        let request: NSFetchRequest<ProductEntity> =  ProductEntity.fetchRequest()
        request.predicate = NSPredicate(format: " id = %@", product.id as CVarArg)
        
        do {
            if let productEntity = try context.fetch(request).first {
                productEntity.name = product.name
                productEntity.quantity = product.quantity
                saveContext()
            }
        } catch let error {
            print(error.localizedDescription)
        }
        
        
    }
}
