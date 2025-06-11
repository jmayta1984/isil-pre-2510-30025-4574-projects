//
//  FavoritesView.swift
//  SneakerMate
//
//  Created by user272495 on 6/10/25.
//

import SwiftUI

struct FavoritesView: View {
    let favorites = [
        FavoriteShoe(id: 1, name: "Adidas Sambas", price: 200, image: "https://soccerpost.com/cdn/shop/files/IH6001_b2b012_plp.png_clipped_rev_1_grande.png"),
        FavoriteShoe(id: 2, name: "Adidas Sambas", price: 200, image: "https://soccerpost.com/cdn/shop/files/IH6001_b2b012_plp.png_clipped_rev_1_grande.png"),
        FavoriteShoe(id: 3, name: "Adidas Sambas", price: 200, image: "https://soccerpost.com/cdn/shop/files/IH6001_b2b012_plp.png_clipped_rev_1_grande.png"),
        FavoriteShoe(id: 4, name: "Adidas Sambas", price: 200, image: "https://soccerpost.com/cdn/shop/files/IH6001_b2b012_plp.png_clipped_rev_1_grande.png")
    ]
    
    @State var showSizes = false
    @State var showOptions = false
    
    var body: some View {
        List {
            ForEach(favorites) { favorite in
                HStack {
                    AsyncImage(url: URL(string: favorite.image)){ phase in
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
                        .buttonStyle(PlainButtonStyle())


                    }
                    Spacer()
                    Button {
                        showOptions.toggle()
                    } label: {
                        Image(systemName: "ellipsis")
                    }
                    .buttonStyle(PlainButtonStyle())

                }
            }
        }
        .listStyle(PlainListStyle())
        .sheet(isPresented: $showSizes) {
            VStack{
                HStack {
                    Text("Sizes")
                        .font(.headline)
                    Spacer()
                }
                Spacer()
            }
            .padding()
            .presentationDetents([.fraction(0.2)])
        }
        .sheet(isPresented: $showOptions) {
            VStack(spacing: 10){
                HStack {
                    Text("Options")
                        .font(.headline)
                    Spacer()
                }
                HStack {
                    Image(systemName: "cart")
                        .resizable()
                        .frame(width: 20, height: 20)

                    Text("Add to cart")
                    Spacer()
                }
                .onTapGesture {
                    
                }
                HStack {
                    Image(systemName: "trash")
                        .resizable()
                        .frame(width: 20, height: 20)
                    Text("Remove from favorites ")
                    Spacer()
                }
                .onTapGesture {
                    
                }
                Spacer()
            }
            .padding()
            .presentationDetents([.fraction(0.2)])
        }
        
    }
}
