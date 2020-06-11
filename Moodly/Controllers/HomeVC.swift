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
    var currentWeatherView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureViewController()

        getWeather(for: cityNameFormatted)

        layoutUI()
    }
    
    func configureViewController(){
        view.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 255/255, alpha: 1)
        title = "Weather"
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    
    func getWeather(for city: String){
        NetworkManager.shared.getCurrentWeather(for: city) { [weak self] result in
            guard let self = self else {return}

            switch result{
            case .success(let city):
                DispatchQueue.main.async {
//                    self.currentCity = city
                    print(city.weather[0].description)
                    print(city.main.temp)
                    
                    self.add(childVC: MLCurrentWeatherCardVC(city: city), to: self.currentWeatherView)
                }

            case .failure(let error):
                print(error)
            }
            
            
        }
    }
    
    func add(childVC: UIViewController, to containerView: UIView){
        addChild(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame = containerView.bounds
        childVC.didMove(toParent: self)
    }
    
    func layoutUI(){
        view.addSubview(currentWeatherView)
        currentWeatherView.translatesAutoresizingMaskIntoConstraints = false
                
        NSLayoutConstraint.activate([
            currentWeatherView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            currentWeatherView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            currentWeatherView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            currentWeatherView.heightAnchor.constraint(equalToConstant: 320)
        
        ])
    }
    
}
    

