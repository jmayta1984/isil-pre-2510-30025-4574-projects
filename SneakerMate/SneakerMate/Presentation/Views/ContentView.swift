//
//  HomeView.swift
//  SneakerMate
//
//  Created by user272495 on 5/20/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            
            Tab("Home", systemImage: "shoeprints.fill") {
                HomeView()
            }
         
            Tab("Favorites", systemImage: "heart.fill") {
                FavoriteListView()
            }
          
            Tab("Cart", systemImage: "cart.fill") {
                CartView()
            }
            
      
        }
        .navigationBarBackButtonHidden()
        .tint(.black)
    }
}

#Preview {
    ContentView()
}
