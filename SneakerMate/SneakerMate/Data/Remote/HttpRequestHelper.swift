//
//  HttpRequestHelper.swift
//  SneakerMate
//
//  Created by user272495 on 5/27/25.
//

import Foundation

class HttpRequestHelper {
    
    func POST<T: Encodable>(url: String, request: T, completion: @escaping(Bool, Data?, String?) -> Void) {
        guard let url = URL(string: url) else {
            print("Error: cannot create URL")
            completion(false, nil, "Error: cannot create URL" )
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let data = try JSONEncoder().encode(request)
            urlRequest.httpBody = data
        } catch let encodingError {
            print("Error: \(encodingError)")
            completion(false, nil, "Error: \(encodingError)")
            return
        }
        
        let session = URLSession.shared
        
        session.dataTask(with: urlRequest) { data, response, error in
            guard error == nil else {
                print("Error: problem calling POST")
                completion(false, nil,"Error: problem calling POST" )
                return
            }
            
            guard let data = data else {
                print("Error: no data")
                completion(false, nil,"Error: no data" )
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                print("Error: HTTP request failed")
                completion(false, data,"Error: HTTP request failed" )
                return
            }
            completion(true, data, nil)
        }.resume()
        
    }
    
    func GET(url: String, completion: @escaping(Data?, String?) -> Void) {
        guard let url = URL(string: url) else {
            print("Error: cannot create URL")
            completion(nil, "Error: cannot create URL" )
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        
        let session = URLSession.shared
        session.dataTask(with: urlRequest) { data, response, error in
            guard error == nil else {
                print("Error: problem calling GET")
                completion(nil,"Error: problem calling GET" )
                return
            }
            
            guard let data = data else {
                print("Error: no data")
                completion(nil,"Error: no data" )
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                print("Error: HTTP request failed")
                completion( data,"Error: HTTP request failed" )
                return
            }
            completion(data, nil)
        }.resume()
        
    }
}
