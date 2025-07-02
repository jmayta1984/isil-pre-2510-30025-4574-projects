//
//  FavoriteShoeDAO.swift
//  SneakerMate
//
//  Created by user272495 on 6/24/25.
//

import CoreData

class FavoriteShoeDAO {
    
    static let shared = FavoriteShoeDAO()
    private let context = PersistenceController.shared.container.viewContext
    private init() {}
    
    func insertFavorite(shoe: Shoe) {
        let entity = FavoriteShoeEntity(context: context)
        entity.loadFromShoe(shoe: shoe)
        saveContext()
    }
    
    func deleteFavorite(id: Int) {
        let request: NSFetchRequest<FavoriteShoeEntity>
        request = FavoriteShoeEntity.fetchRequest()
        request.predicate = NSPredicate(format: "id = %i", argumentArray: [id])
        
        do {
            let entities = try context.fetch(request)
            if let entity = entities.first {
                context.delete(entity)
            }
        } catch let error {
            fatalError(error.localizedDescription)
        }
        
        saveContext()
    }
    
    func fetchAll() -> [FavoriteShoe]{
        let request: NSFetchRequest<FavoriteShoeEntity>
        request = FavoriteShoeEntity.fetchRequest()
        
        do {
            let entities = try context.fetch(request)
            return entities.map { $0.toFavoriteShoe() }
        } catch let error {
            fatalError(error.localizedDescription)
        }
    }
    
    private func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch let error {
                fatalError(error.localizedDescription)
            }
        }
    }
    
}
