//
//  MLCurrentWeatherCardVC.swift
//  Moodly
//
//  Created by Gonzalo Birrueta on 6/9/20.
//  Copyright © 2020 Gonzalo Birrueta. All rights reserved.
//

import UIKit

class MLCurrentWeatherCardVC: UIViewController {

    var city: City!
    

    let weatherImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    
    let tempLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 60, weight: .light)
        label.textColor = UIColor(red: 99/255, green: 100/255, blue: 99/255, alpha: 1)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let cityLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        label.textColor = UIColor(red: 99/255, green: 100/255, blue: 99/255, alpha: 1)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let weatherLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        label.textColor = UIColor(red: 99/255, green: 100/255, blue: 99/255, alpha: 1)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    init(city: City){
        super.init(nibName: nil, bundle: nil)
        self.city = city
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutUI()
        configure()
    }
    
    func configure(){
        let tempInt = Int(city.main.temp)
        tempLabel.text = "\(tempInt)°"
        cityLabel.text = "\(city.name.uppercased())"
        weatherLabel.text = "\(city.weather[0].description.uppercased())"
        
        
        if city.weather[0].description.contains("cloud"){
            let cloudImage = UIImage(systemName: "cloud.fill")?.withTintColor(.systemTeal, renderingMode: .alwaysOriginal)
            weatherImage.image = cloudImage
        }else if city.weather[0].description.contains("sun"){
            let sunImage = UIImage(systemName: "sun.max.fill")?.withTintColor(.systemYellow, renderingMode: .alwaysOriginal)
            weatherImage.image = sunImage
        }else if city.weather[0].description.contains("snow"){
        let sunImage = UIImage(systemName: "snow")?.withTintColor(.systemTeal, renderingMode: .alwaysOriginal)
        weatherImage.image = sunImage
        }else if city.weather[0].description.contains("shower") || city.weather[0].description.contains("rain"){
        let sunImage = UIImage(systemName: "cloud.drizzle.fill")?.withTintColor(.systemTeal, renderingMode: .alwaysOriginal)
        weatherImage.image = sunImage
        }
    }
    
    func layoutUI(){
        
        view.addSubview(weatherImage)
        view.addSubview(tempLabel)
        view.addSubview(cityLabel)
        view.addSubview(weatherLabel)
        
        NSLayoutConstraint.activate([
            
            weatherImage.topAnchor.constraint(equalTo: view.topAnchor),
            weatherImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            weatherImage.heightAnchor.constraint(equalToConstant: 200),
            weatherImage.widthAnchor.constraint(equalToConstant: 200),
            
            
            tempLabel.topAnchor.constraint(equalTo: weatherImage.bottomAnchor, constant: 5),
            tempLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            tempLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 55),
            tempLabel.heightAnchor.constraint(equalToConstant: 80),
            
            cityLabel.topAnchor.constraint(equalTo: tempLabel.bottomAnchor),
            cityLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            cityLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            cityLabel.heightAnchor.constraint(equalToConstant: 20),
            
            weatherLabel.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 5),
            weatherLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            weatherLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            weatherLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
    }

}
