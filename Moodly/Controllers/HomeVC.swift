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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .systemBackground
        
//        NetworkManager.shared.getCurrentWeather(for: "Seattle") { [weak self] result in
//            guard let self = self else {return}
//
//            switch result{
//            case .success(let city):
//                DispatchQueue.main.async {
//                    print(city)
//                }
//
//            case .failure(let error):
//                print(error)
//            }
//        }
        
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=Seattle&units=imperial&appid=5a53d613fe98be346f15a66e850c565e") else {return}
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        guard let dataResponse = data,
                  error == nil else {
                  print(error?.localizedDescription ?? "Response Error")
                  return }
            do{
                //here dataResponse received from a network request
                let decoder = JSONDecoder()
                let model = try decoder.decode(City.self, from: dataResponse)
                print("\(model.name) : \(model.main.temp): \(model.weather[0].description)") //Response result
             } catch let parsingError {
                print("Error", parsingError)
           }
        }
        task.resume()
        
    }


}

