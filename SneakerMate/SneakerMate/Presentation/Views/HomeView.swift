//
//  ProduListView.swift
//  SneakerMate
//
//  Created by user272495 on 5/20/25.
//

import SwiftUI

struct HomeView: View {
    
    @State var search = ""
    
    var categories = ["All", "Men", "Women", "Kids"]
    
    @State var selectedCategory = "All"
    
    @StateObject var viewModel = HomeViewModel()
    
    @State var selectedShoe: Shoe? = nil
    
    var body: some View {
        ScrollView {
            VStack (alignment:.leading ,spacing: 20){
                
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundStyle(Color(.systemGray))
                    TextField("Search", text: $search)
                        .textInputAutocapitalization(.none)
                }
                .padding()
                .background(Color(.systemGray6))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                
                HStack  {
                    VStack (alignment: .leading, spacing: 4){
                        Text("Year - End Sale")
                            .font(.headline)
                        Text("Get upto 90% off")
                            .font(.subheadline)
                        Button(action: {}) {
                            Text("Shop now")
                        }
                        .padding(.horizontal, 12)
                        .padding(.vertical, 6)
                        .background(Color.black)
                        .foregroundStyle(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        
                    }
                    Spacer()
                    Image("banner")
                        .resizable()
                        .scaledToFit()
                }
                .padding()
                .background(Color.black.opacity(0.2))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                
                Text("Category")
                    .font(.title)
                    .bold()
                ScrollView (.horizontal){
                    HStack (spacing: 10) {
                        ForEach(categories, id: \.self) { category in
                            Text(category)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 6)
                                .background( category == selectedCategory ? .black : .black.opacity(0.2))
                                .foregroundStyle(category == selectedCategory ? .white : .gray)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .onTapGesture {
                                    selectedCategory = category
                                }
                            
                        }
                    }
                }
                
                switch viewModel.state {
                case .idle, .loading:
                    ProgressView()
                case .success(let shoes):
                    LazyVGrid (
                        columns: [GridItem(.flexible()),GridItem(.flexible()) ], spacing: 20) {
                            ForEach(shoes) { shoe in
                                ShoeCardView(shoe: shoe)
                                    .onTapGesture {
                                        selectedShoe = shoe
                                    }
                            }
                        }
                case .failure(let string):
                    Text(string)
                }
                Spacer()
            }
            .padding()
            
        }
        .onAppear {
            viewModel.getShoes()
        }
        .navigationDestination(item: $selectedShoe) { shoe in
            ShoeDetailView(shoe: shoe)
        }
    }
}




#Preview {
    HomeView()
}


