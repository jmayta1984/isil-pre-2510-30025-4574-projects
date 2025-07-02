//
//  RestaurantListItemView.swift
//  FoodLab
//
//  Created by user272495 on 7/1/25.
//

import SwiftUI

struct RestaurantListItemView: View {
    let restaurant: Restaurant
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: restaurant.poster)) { phase in
                switch phase {
                case .empty:
                    EmptyView()
                case .success(let image):
                    image
                        .resizable()
                        .frame(height: 160)
                        .frame(maxWidth: .infinity)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                case .failure(let error):
                    Text(error.localizedDescription)
                @unknown default:
                    EmptyView()
                }
            }
        }
    }
}
