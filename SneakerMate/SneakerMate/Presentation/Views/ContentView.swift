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
            HomeView()
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
    ContentView()
}
