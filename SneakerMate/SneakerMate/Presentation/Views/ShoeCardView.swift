//
//  ShoeCardView.swift
//  SneakerMate
//
//  Created by user272495 on 5/27/25.
//

import SwiftUI

struct ShoeCardView: View {
    let shoe: Shoe
    
    var body: some View {
        VStack (alignment: .leading){
            
            
            AsyncImage(url: URL(string: shoe.image)){ phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .frame(width: 120, height: 120)
                        .frame(maxWidth: .infinity)
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120, height: 120)
                        .frame(maxWidth: .infinity)
                case .failure:
                    Image(systemName: "shoe")
                        .frame(width: 120, height: 120)
                        .frame(maxWidth: .infinity)
                @unknown default:
                    EmptyView()
                        .frame(width: 120, height: 120)
                        .frame(maxWidth: .infinity)
                }
            }
           
                
            Text(shoe.name)
                .font(.subheadline)
                .lineLimit(1)
            Text(String(format: "$% i", shoe.price))
                .font(.headline)
                .bold()
        }
        .padding()
        .background(Color.black.opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}
