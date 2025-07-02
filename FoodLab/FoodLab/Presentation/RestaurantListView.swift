//
//  RestaurantList.swift
//  FoodLab
//
//  Created by user272495 on 7/1/25.
//

import SwiftUI

struct RestaurantListView: View {
    @StateObject var viewModel = RestaurantListViewModel()
    @State var selectedRestaurant: Restaurant? = nil
    
    var body: some View {
        NavigationStack {
            VStack {
                switch viewModel.uiState {
                case .initialState, .loadingState:
                    ProgressView()
                case .successState(let restaurants):
                    List {
                        ForEach(restaurants) { restaurant in
                            RestaurantListItemView(restaurant: restaurant)
                                .onTapGesture {
                                    selectedRestaurant = restaurant
                                }
                        }
                    }
                    .listStyle(.plain)
                case .failureState(let message):
                    Text(message)
                }
            }
            
            .navigationDestination(item: $selectedRestaurant, destination: { restaurant in
                GoogleMapView(
                    latitude: restaurant.latitude,
                    longitude: restaurant.longitude,
                    zoom: 15,
                    title: restaurant.title,
                    snipet: restaurant.title
                )
            })
        }
        
        .onAppear {
            viewModel.getAllRestaurants()
        }
    }
}

#Preview {
    let googleMapHelper = GoogleMapHelper.shared
    RestaurantListView()
}
