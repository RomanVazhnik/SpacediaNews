//
//  NetworkingManager.swift
//  Spacedia
//
//  Created by Роман Важник on 30/08/2019.
//  Copyright © 2019 Александр Б. All rights reserved.
//

import UIKit

class NetworkingManager {
    
    static func fetchData(for url: String, complition: @escaping ([Flight]?) -> ()) {
        
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
                let flights = try decoder.decode([Flight].self, from: jsonData)
                
                DispatchQueue.main.async {
                    complition(flights)
                }
            } catch let error {
                print("error: ", error)
            }
        }.resume()
    }
    
    static func fetchImage(for url: String, complition: @escaping (UIImage?)->()){
        
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, respons, error) in
            if let error = error {
                print(error)
                return
            }
            
            guard let data = data, let image = UIImage(data: data) else { return }
            
            DispatchQueue.main.async {
                complition(image)
            }
        }.resume()
    }
    
}
