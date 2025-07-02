//
//  PersistenceController.swift
//  SneakerMate
//
//  Created by user272495 on 6/24/25.
//

import CoreData

class PersistenceController {
    
    static let shared = PersistenceController()
    let container: NSPersistentContainer

    private init() {
        container = NSPersistentContainer(name: "SneakerMateModel")
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError(error.localizedDescription)
            }
        }
    }
    
    
    
    
}
