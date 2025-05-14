//
//  PersitenceController.swift
//  TodoClean
//
//  Created by user272495 on 5/13/25.
//

import CoreData

struct PersitenceController {
    
    static let shared = PersitenceController()
    
    let container: NSPersistentContainer
    
    private init() {
        container = NSPersistentContainer(name: "TodoCleanModel")
        
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError(error.localizedDescription)
            }
        }
    }
}
