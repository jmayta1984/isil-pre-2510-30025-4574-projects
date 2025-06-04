//
//  HomeViewModel.swift
//  SneakerMate
//
//  Created by user272495 on 6/3/25.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var shoes = [Shoe]()
    @Published var erroMessage: String? = nil
    
    func getShoes() {
        ShoeService().getShoes { shoes, message in
            DispatchQueue.main.async {
                if let shoes = shoes {
                    self.shoes = shoes
                } else  {
                    self.erroMessage = message
                }
            }
           
        }
    }
}
