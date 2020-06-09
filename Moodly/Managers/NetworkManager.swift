//
//  NetworkManager.swift
//  Moodly
//
//  Created by Gonzalo Birrueta on 6/2/20.
//  Copyright © 2020 Gonzalo Birrueta. All rights reserved.
//

import UIKit

class NetworkManager{
    static let shared = NetworkManager()
    private let baseURL = "https://api.openweathermap.org/data/2.5/weather?q="
    
    private init() {}
    
    func getCurrentWeather(for city: String, completed: @escaping (Result<City, CustomError>) -> Void){
        
        let endpoint = baseURL + "\(city)" + "&units=imperial" + "&appid=" + "\(Constants.apiKey)"
        
        guard let url = URL(string: endpoint) else {
             completed(.failure(.invalidCity))
             return
         }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let _ = error{
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else{
                 completed(.failure(.invalidResponse))
                 return
            }
            
            guard let data = data else{
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let city = try decoder.decode(City.self, from: data)
                completed(.success(city))
            } catch{
                completed(.failure(.invalidData))
            }

        }
        
        task.resume()
        
    }
    
    
    
}
