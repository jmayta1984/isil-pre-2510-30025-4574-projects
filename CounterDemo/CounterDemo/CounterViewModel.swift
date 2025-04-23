//
//  CounterViewModel.swift
//  CounterDemo
//
//  Created by user272495 on 4/22/25.
//

import Foundation

class CounterViewModel: ObservableObject {
    @Published var count = 0
    
    func increaseCount() {
        count += 1
    }
}
