//
//  ProductListView.swift
//  Inventory
//
//  Created by user272495 on 4/29/25.
//

import SwiftUI

struct ProductListView: View {
    
    @StateObject var viewModel = ProductListViewModel()
    
    @State var showDetail = false
    @State var selectedProduct: Product? = nil
    
    var body: some View {
        NavigationStack{
            
            List {
                ForEach(viewModel.products) { product in
                    Text(product.name )
                        .onTapGesture {
                            selectedProduct = product
                        }
                }
                .onDelete { indexSet in
                    viewModel.removeProduct(indexSet: indexSet)
                }
            }
            .navigationTitle("Inventory")
            .toolbar {
                Button(action: {
                    showDetail = true
                }) {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                }
            }
            .onAppear {
                viewModel.fetchProducts()
            }
            .sheet(isPresented: $showDetail) {
                ProductDetailView { product in
                    viewModel.addProduct(product: product)
                }
            }
            .sheet(item: $selectedProduct) { product in
                ProductDetailView(onSave:  { editingProduct in
                    viewModel.updateProduct(product: editingProduct)
                }, editingProduct: product)
            }
        }
       
    }
}

#Preview {
    ProductListView()
}
