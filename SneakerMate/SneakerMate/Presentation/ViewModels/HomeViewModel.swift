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
        ShoeService().getShoes { shoes, message in
            DispatchQueue.main.async {
                if let shoes = shoes {
                    self.state = .success(shoes)
                } else  {
                    self.state = .failure(message ?? "Unknown error")
                }
            }
           
        }
    }
}
