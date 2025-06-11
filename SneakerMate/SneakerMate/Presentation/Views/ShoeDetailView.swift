//
//  ShoeDetailView.swift
//  SneakerMate
//
//  Created by user272495 on 6/10/25.
//

import SwiftUI

struct ShoeDetailView: View {
    let shoe: Shoe
    @State var selectedSize: ShoeSize? = nil
    
    var body: some View {
        VStack (
            
            alignment: .leading, spacing: 10){
                ZStack (alignment: .topTrailing){
                    AsyncImage(url: URL(string: shoe.image)){ phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                                .frame(width: 400, height: 200)
                                .frame(maxWidth: .infinity)
                        case .success(let image):
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 400, height: 200)
                                .frame(maxWidth: .infinity)
                        case .failure:
                            Image(systemName: "shoe")
                                .frame(width: 400, height: 200)
                                .frame(maxWidth: .infinity)
                        @unknown default:
                            EmptyView()
                                .frame(width: 400, height: 200)
                                .frame(maxWidth: .infinity)
                        }
                    }
                    Button {
                        
                    } label: {
                        Image(systemName: "heart")
                            .resizable()
                            .foregroundStyle(.black)
                            .frame(width: 20, height: 20)
                    }

                }
                
                
                HStack {
                    Text(shoe.name)
                        .font(.headline)
                    Spacer()
                    Text(String(format: "$% i", shoe.price))
                        .font(.headline)
                }
                Text(shoe.description)
                    .font(.subheadline)
                
                Text("Sizes")
                    .font(.headline)
                ScrollView (.horizontal){
                    HStack {
                        ForEach(shoe.sizes, id: \.self.size) { size in
                            Text(size.size)
                                .frame(width: 40, height: 40)
                                .background(selectedSize == size ? Color.black : Color.white)
                                .foregroundStyle(selectedSize == size ? Color.white : Color.gray)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                                .onTapGesture {
                                    selectedSize = size
                                }
                        }
                    }
                }
                Group {
                    if let size = selectedSize {
                        Text("Stock: \(size.stock)")
                            .font(.subheadline)
                    }
                }
                Spacer()
                Button(action: {
                    
                }) {
                    Text("Add to cart")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.black)
                        .foregroundStyle(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                .padding(.bottom, 16)
            }
    }
}
