//
//  NetworkingManager.swift
//  Spacedia
//
//  Created by Роман Важник on 30/08/2019.
//  Copyright © 2019 Александр Б. All rights reserved.
//

import UIKit

class NetworkManager {
    
    static let shared = NetworkManager()
    
    func fetchData(for url: String, complition: @escaping ([Launch]?) -> ()) {
        
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error)
                return
            }
            
            guard let jsonData = data else { return }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let flights = try decoder.decode([Launch].self, from: jsonData)
                
                DispatchQueue.main.async {
                    complition(flights)
                }
            } catch let error {
                print("error: ", error)
            }
        }.resume()
    }
    
    func getRoadster(for url: String, complition: @escaping (Roadster?) -> ()) {
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error)
                return
            }
            
            guard let jsonData = data else { return }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let roadster = try decoder.decode(Roadster.self, from: jsonData)
                
                DispatchQueue.main.async {
                    complition(roadster)
                }
            } catch let error {
                print("error: ", error)
            }
            }.resume()
    }
    
}
