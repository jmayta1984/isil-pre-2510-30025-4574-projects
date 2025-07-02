//
//  FavoriteShoeImageView.swift
//  SneakerMate
//
//  Created by user272495 on 6/24/25.
//

import SwiftUI

struct FavoriteShoeImageView: View {
    let image: String
    var body: some View {
        AsyncImage(url: URL(string: image)){ phase in
            switch phase {
            case .empty:
                ProgressView()
                    .frame(width: 90, height: 90)
            case .success(let image):
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 90, height: 90)
            case .failure:
                Image(systemName: "shoe")
                    .frame(width: 90, height: 90)
            @unknown default:
                EmptyView()
                    .frame(width: 90, height: 90)
            }
        }
    }
}
