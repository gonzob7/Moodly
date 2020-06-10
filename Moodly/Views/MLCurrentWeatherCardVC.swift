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
    

    
    let tempLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 50, weight: .bold)
        label.textColor = .systemTeal
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
        
    }
    
    func layoutUI(){
        view.addSubview(tempLabel)
        
        NSLayoutConstraint.activate([
            tempLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            tempLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            tempLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            tempLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
        
    }

}
