//
//  ProductListView.swift
//  Inventory
//
//  Created by user272495 on 4/29/25.
//

import SwiftUI

struct ProductListView: View {
    
    @StateObject var viewModel = ProductListViewModel()
    
    var body: some View {
        NavigationStack{
            
            List {
                ForEach(viewModel.products) { product in
                    Text(product.name ?? "")
                }
            }
            .navigationTitle("Inventory")
            .toolbar {
                Button(action: {
                    viewModel.addProduct(name: "Mouse")
                }) {
                    Image(systemName: "plus.circle.fill")
                }
            }
            .onAppear {
                viewModel.fetchProducts()
            }
        }
       
    }
}

#Preview {
    ProductListView()
}
