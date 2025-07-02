//
//  FavoriteShoeEntity+Extensions.swift
//  SneakerMate
//
//  Created by user272495 on 6/24/25.
//

extension FavoriteShoeEntity {
    
    func loadFromShoe(shoe: Shoe) {
        self.id = Int16(shoe.id)
        self.name = shoe.name
        self.image = shoe.image
        self.price = Int16(shoe.price)
    }
    
    func toFavoriteShoe() -> FavoriteShoe {
        FavoriteShoe(
            id: Int(self.id),
            name: self.name ?? "",
            price: Int(self.price),
            image: self.image ?? "")
    }
}
