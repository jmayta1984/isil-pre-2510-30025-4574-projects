//
//  HomeViewModel.swift
//  SneakerMate
//
//  Created by user272495 on 6/3/25.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var state: UIState<[Shoe]> = .idle
    
    func getShoes() {
        state = .loading
        ShoeService.shared.getShoes { shoes, message in
            DispatchQueue.main.async {
                if let shoes = shoes {
                    self.state = .success(shoes)
                } else  {
                    self.state = .failure(message ?? "Unknown error")
                }
            }
           
        }
    }
    
    func getShoeSizes(id: Int) -> [ShoeSize] {
        switch state {
        case .idle:
            return []
        case .loading:
            return []
        case .success(let t):
            if let shoe = t.first(where: { shoe in
                shoe.id == id
            }) {
                return shoe.sizes
            }
            return []
        case .failure(let string):
            return []
        }
    }
}
