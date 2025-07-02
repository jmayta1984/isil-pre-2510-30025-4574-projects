//
//  HomeView.swift
//  SneakerMate
//
//  Created by user272495 on 5/20/25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @StateObject var favoritesViewModel = FavoritesViewModel()
    var body: some View {
        NavigationStack {
            TabView {
                
                Tab("Home", systemImage: "shoeprints.fill") {
                    HomeView()
                }
             
                Tab("Favorites", systemImage: "heart.fill") {
                    FavoritesView()
                }
              
                Tab("Cart", systemImage: "cart.fill") {
                    CartView()
                }
                
          
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    if let user = authViewModel.user {
                        Text(user.name)
                    }
                }
            }
            .tint(.black)
        }
        .environmentObject(favoritesViewModel)
    }
}

