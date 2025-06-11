//
//  CartView.swift
//  SneakerMate
//
//  Created by user272495 on 5/20/25.
//

import SwiftUI

struct CartView: View {
    
    let items = [
        CartItem(id: 1, name: "Adidas Sambas", price: 200, image: "https://soccerpost.com/cdn/shop/files/IH6001_b2b012_plp.png_clipped_rev_1_grande.png", size: "8.0", quantity: 1),
        CartItem(id: 2, name: "Adidas Sambas", price: 200, image: "https://soccerpost.com/cdn/shop/files/IH6001_b2b012_plp.png_clipped_rev_1_grande.png", size: "8.0", quantity: 3),
        CartItem(id: 3, name: "Adidas Sambas", price: 200, image: "https://soccerpost.com/cdn/shop/files/IH6001_b2b012_plp.png_clipped_rev_1_grande.png", size: "8.0", quantity: 2),
        CartItem(id: 4, name: "Adidas Sambas", price: 200, image: "https://soccerpost.com/cdn/shop/files/IH6001_b2b012_plp.png_clipped_rev_1_grande.png", size: "8.0", quantity: 1)
    ]
    var body: some View {
        VStack {
            List {
                ForEach(items) { item in
                    HStack{
                        AsyncImage(url: URL(string: item.image)){ phase in
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
                            Text(item.name).font(.headline)
                            Text(String(format: "$% i", item.price))
                                .font(.subheadline)
                            HStack {
                                Button {
                                    
                                } label: {
                                    Image(systemName: "minus")
                                }
                                .buttonStyle(PlainButtonStyle())
                                Text("\(item.quantity)")
                                Button {
                                    
                                } label: {
                                    Image(systemName: "plus")
                                }
                                .buttonStyle(PlainButtonStyle())
                                
                            }
                            
                            
                            
                        }
                        Spacer()
                        
                        
                    }
                }
            }
            .listStyle(PlainListStyle())
        }
    }
}
