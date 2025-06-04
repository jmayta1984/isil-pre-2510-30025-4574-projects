//
//  HomeView.swift
//  SneakerMate
//
//  Created by user272495 on 5/20/25.
//

import SwiftUI

struct ContentView: View {
    let user: User
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
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Text(user.firstName)
            }
        }
        .tint(.black)
    }
}

