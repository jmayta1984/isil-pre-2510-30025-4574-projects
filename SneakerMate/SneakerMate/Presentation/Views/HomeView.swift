//
//  HomeView.swift
//  SneakerMate
//
//  Created by user272495 on 5/20/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
            ProductListView()
                .tabItem {
                    Image(systemName: "shoeprints.fill")
                }
            
            FavoriteListView()
                .tabItem {
                    Image(systemName: "heart.fill")
                }
            
            CartView()
                .tabItem {
                    Image(systemName: "cart.fill")
                }
        }
        .tint(.black)
    }
}

#Preview {
    HomeView()
}
