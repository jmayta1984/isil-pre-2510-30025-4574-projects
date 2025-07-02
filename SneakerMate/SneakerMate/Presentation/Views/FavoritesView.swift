//
//  FavoritesView.swift
//  SneakerMate
//
//  Created by user272495 on 6/10/25.
//

import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var viewModel: FavoritesViewModel

    
    var body: some View {
        
        List {
            ForEach(viewModel.favorites) { favorite in
                FavoriteShoeCartView(favorite: favorite)
            }
        }
        .onAppear {
            viewModel.getAll()
        }
        .listStyle(PlainListStyle())
        
    }
}
