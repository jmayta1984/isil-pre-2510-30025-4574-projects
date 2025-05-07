//
//  ProductDetailView.swift
//  Inventory
//
//  Created by user272495 on 5/6/25.
//

import SwiftUI

struct ProductDetailView: View {
    
    @StateObject var viewModel = ProductDetailViewModel()
    @Environment(\.dismiss) var dismiss
    
    var onSave: (Product) -> Void
    var editingProduct: Product? = nil

    var title: String {
        editingProduct == nil ? "New product" : "Update product"
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Name", text: $viewModel.name)
                    
                    TextField("Quantity", text: $viewModel.quantity)
                        .keyboardType(.numberPad)

                }
                Section {
                    Button(action: {
                        if let product = viewModel.validate(id: editingProduct?.id) {
                            onSave(product)
                            dismiss()
                        }
                        
                    }) {
                        Text("Save")
                    }
                }
                
                Group {
                    if let error = viewModel.errorMessage {
                        Text(error)
                            .foregroundStyle(.red)
                    }
                }
            }
            .navigationTitle(title)
            .onAppear {
                if let product = editingProduct {
                    viewModel.name = product.name
                    viewModel.quantity = "\(product.quantity)"
                }
            }
        }
    }
}
