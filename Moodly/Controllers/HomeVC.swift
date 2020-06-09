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
    var cityNameFormatted: String!
//    var currentCity: City!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureViewController()

        getWeather(for: cityNameFormatted)

    }
    
    func configureViewController(){
        view.backgroundColor = .systemBackground
        title = cityName
        navigationController?.navigationBar.prefersLargeTitles = true
        

    }
    
    
    func getWeather(for city: String){
        NetworkManager.shared.getCurrentWeather(for: city) { [weak self] result in
            guard let self = self else {return}

            switch result{
            case .success(let city):
                DispatchQueue.main.async {
//                    self.currentCity = city
                    print(city.weather[0].description)
                    self.navigationController?.navigationItem.setRightBarButton(UIBarButtonItem(title: "\(city.main.temp)", style: .plain, target: nil, action: nil), animated: false)
                    
                }

            case .failure(let error):
                print(error)
            }
        }
    }
    

        
    }
    

