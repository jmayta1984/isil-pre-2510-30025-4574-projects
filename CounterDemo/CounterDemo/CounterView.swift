//
//  ContentView.swift
//  CounterDemo
//
//  Created by user272495 on 4/22/25.
//

import SwiftUI

struct CounterView: View {
    @StateObject var viewModel = CounterViewModel()
    
    var body: some View {
        VStack {
            
            Text("Count: \(viewModel.count)")
                .font(.title)
            Button(action: {
                viewModel.increaseCount()
            }) {
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
            }
        }
        .padding()
    }
}

#Preview {
    CounterView()
}
