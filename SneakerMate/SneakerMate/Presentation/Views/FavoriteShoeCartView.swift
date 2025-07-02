//
//  FavoriteShoeCartView.swift
//  SneakerMate
//
//  Created by user272495 on 6/24/25.
//

import SwiftUI

struct FavoriteShoeCartView: View {
    
    @State var showSizes = false
    @State var showOptions = false
    
    @EnvironmentObject var favoritesViewModel: FavoritesViewModel
    
    let favorite: FavoriteShoe
    var body: some View {
        HStack {
            FavoriteShoeImageView(image: favorite.image)
            VStack (alignment: .leading) {
                Text(favorite.name).font(.headline)
                Text(String(format: "$% i", favorite.price))
                    .font(.subheadline)
                Button {
                    showSizes.toggle()
                } label: {
                    Text("Add to cart")
                        .font(.subheadline)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 8)
                        .background(.black)
                        .foregroundStyle(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                    
                }
                .buttonStyle(.borderless)
                
                
            }
            Spacer()
            Button {
                showOptions.toggle()
            } label: {
                Image(systemName: "ellipsis")
                    .resizable()
                    .rotationEffect(.degrees(90))
                    .scaledToFit()
                    .frame(width: 20, height: 20)
            }
            .buttonStyle(.borderless)
            
        }
        .sheet(isPresented: $showSizes) {
            VStack{
                
                Text("Sizes")
                    .font(.headline)
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .padding()
            .presentationDetents([.fraction(0.15)])
        }
        .sheet(isPresented: $showOptions) {
            VStack(alignment: .leading, spacing: 10){
                Text("Options")
                    .font(.headline)
                
                Button("Add to cart", systemImage: "cart") {
                    
                }
                Button("Remove from favorites", systemImage: "trash") {
                    favoritesViewModel.deleteFavorite(id: favorite.id)
                    showOptions.toggle()
                }
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .padding()
            .presentationDetents([.fraction(0.15)])
        }
        
    }
}
