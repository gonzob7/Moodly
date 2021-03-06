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
    var moodSelectorView = UIView()
    let callToActionButton = MLButton(bgColor: .systemTeal, title: "Save Todays Mood")

    
    let moodLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.textColor = UIColor(red: 99/255, green: 100/255, blue: 99/255, alpha: 1)
        label.textAlignment = .center
        label.text = "What is your mood today?"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
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
                    self.add(childVC: MLMoodSelectorCardVC(), to: self.moodSelectorView)
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

        view.addSubview(moodLabel)
        
        view.addSubview(moodSelectorView)
        moodSelectorView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(callToActionButton)
        callToActionButton.translatesAutoresizingMaskIntoConstraints = false
                
        NSLayoutConstraint.activate([
            currentWeatherView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            currentWeatherView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            currentWeatherView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            currentWeatherView.heightAnchor.constraint(equalToConstant: 330),
            
            moodLabel.topAnchor.constraint(equalTo: currentWeatherView.bottomAnchor, constant: 40),
            moodLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            moodLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            moodLabel.heightAnchor.constraint(equalToConstant: 25),
            
            moodSelectorView.topAnchor.constraint(equalTo: moodLabel.bottomAnchor, constant: 5),
            moodSelectorView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            moodSelectorView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            moodSelectorView.heightAnchor.constraint(equalToConstant: 100),
            
            callToActionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            callToActionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            callToActionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            callToActionButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
}
    

