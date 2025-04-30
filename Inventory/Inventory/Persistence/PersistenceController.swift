//
//  PersistenceController.swift
//  Inventory
//
//  Created by user272495 on 4/29/25.
//
import CoreData

struct PersistenceController {
    
    static let shared = PersistenceController()
    let container: NSPersistentContainer
    
    private init() {
        container = NSPersistentContainer(name: "InventoryModel")
        container.loadPersistentStores { description, error in
            if let error = error  {
                fatalError("Error loading Core Data store: \(error)")
            }
        }
    }
}
