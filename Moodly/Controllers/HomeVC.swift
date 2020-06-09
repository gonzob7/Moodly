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
    let cityTextField = MLTextField()
    
    var isCityEntered: Bool{
        return !cityTextField.text!.isEmpty
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .systemBackground
        configureTextField()
        
        
        NetworkManager.shared.getCurrentWeather(for: "Seattle") { [weak self] result in
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
    
    
    func configureTextField(){
        view.addSubview(cityTextField)
//        cityTextField.delegate = self
        
        NSLayoutConstraint.activate([
            cityTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            cityTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            cityTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            cityTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }


}

