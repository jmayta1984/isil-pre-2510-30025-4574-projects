//
//  ShoService.swift
//  SneakerMate
//
//  Created by user272495 on 6/3/25.
//

import Foundation

class ShoeService {
    static let shared = ShoeService()
    private init() {}
    
    func getShoes(completion: @escaping([Shoe]?, String?) -> Void) {
        let url = "https://sugary-wool-penguin.glitch.me/shoes"
        
        HttpRequestHelper().GET(url: url) { data, message in
            guard message == nil else {
                completion(nil, message )
                return
            }
            
            guard let data = data else {
                completion(nil, message)
                return
            }
            
            do {
                let shoes = try JSONDecoder().decode([ShoeDTO].self, from: data).map { shoeDTO in
                    shoeDTO.toDomain()
                }
                completion(shoes, nil)
                
            } catch let decodingError {
                completion(nil, decodingError.localizedDescription)
            }
        }
    }
}
