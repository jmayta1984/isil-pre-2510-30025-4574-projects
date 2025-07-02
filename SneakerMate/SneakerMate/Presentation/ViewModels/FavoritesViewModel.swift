//
//  FavoriteShoeViewModel.swift
//  SneakerMate
//
//  Created by user272495 on 6/24/25.
//

import Foundation

class FavoritesViewModel: ObservableObject {
    @Published var favorites = [FavoriteShoe]()
    
    func addFavorite(shoe: Shoe) {
        FavoriteShoeDAO.shared.insertFavorite(shoe: shoe)
        getAll()
    }
    
    func deleteFavorite(id: Int) {
        FavoriteShoeDAO.shared.deleteFavorite(id: id)
        getAll()
    }
    
    func toggleFavorite(shoe: Shoe) {
        
        if checkFavorite(shoe: shoe) {
            deleteFavorite(id: shoe.id)
        } else {
            addFavorite(shoe: shoe)
        }
    }
    
    func checkFavorite(shoe: Shoe) -> Bool {
       
        return favorites.contains { favorite in
            favorite.id == shoe.id
        }
    }
    
    func getAll() {
        favorites = FavoriteShoeDAO.shared.fetchAll()
    }
    
    init (){
        getAll()
    }
}
