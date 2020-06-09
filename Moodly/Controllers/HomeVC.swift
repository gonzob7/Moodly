//
//  ViewController.swift
//  Moodly
//
//  Created by Gonzalo Birrueta on 6/2/20.
//  Copyright © 2020 Gonzalo Birrueta. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    
//    var city: City!
    var cityName: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .systemBackground
        getWeather(for: cityName)

    }
    
    
    func getWeather(for city: String){
        NetworkManager.shared.getCurrentWeather(for: city) { [weak self] result in
            guard let self = self else {return}

            switch result{
            case .success(let city):
                DispatchQueue.main.async {
                    print(city.weather[0].description)
                }

            case .failure(let error):
                print(error)
            }
        }
        
    }
    
    

    
    

    
    



}

