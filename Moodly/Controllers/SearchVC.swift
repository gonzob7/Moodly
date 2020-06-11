//
//  SearchVC.swift
//  Moodly
//
//  Created by Gonzalo Birrueta on 6/9/20.
//  Copyright © 2020 Gonzalo Birrueta. All rights reserved.
//

import UIKit

class SearchVC: UIViewController {

    let logoImageView = UIImageView()
    let cityTextField = MLTextField()
    let callToActionButton = MLButton(bgColor: .systemTeal, title: "Get Weather")

    var isCityEntered: Bool{
        return !cityTextField.text!.isEmpty
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        // Do any additional setup after loading the view.
        configureLogoImageView()
        configureTextField()
        configureCallToActionButton()
        dismissKeyboard()

    }
    
    func configureLogoImageView(){
        view.addSubview(logoImageView)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.image = UIImage(named: "moodly-logo")!
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 250),
            logoImageView.widthAnchor.constraint(equalToConstant: 250)
        ])
    }
    
        func configureTextField(){
            view.addSubview(cityTextField)
    //        cityTextField.delegate = self
            cityTextField.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                cityTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 50),
                cityTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
                cityTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
                cityTextField.heightAnchor.constraint(equalToConstant: 50)
            ])
        }
    
    func configureCallToActionButton(){
        view.addSubview(callToActionButton)
        callToActionButton.translatesAutoresizingMaskIntoConstraints = false
        callToActionButton.addTarget(self, action: #selector(pushTabBar), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            callToActionButton.topAnchor.constraint(equalTo: cityTextField.bottomAnchor, constant: 20),
            callToActionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            callToActionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            callToActionButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc func pushTabBar(){
        guard isCityEntered else{
            print("No city entered!")
            return }
                
        let newTabBar = createTabBar()
        
        guard let window = UIApplication.shared.windows.first else {
            return
        }
        
        UIApplication.shared.windows.first?.rootViewController = newTabBar
        
        
        
        let options: UIView.AnimationOptions = .transitionCrossDissolve
        let duration: TimeInterval = 0.3
        UIView.transition(with: window, duration: duration, options: options, animations: {}, completion:
        { completed in
            return
        })
    }
    
    

    
    
    
    func dismissKeyboard(){
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        view.addGestureRecognizer(tap)
    }
    
    
    func createHomeNC() -> UINavigationController{
        
        let homeVC = HomeVC()
        homeVC.cityName = cityTextField.text!
        homeVC.cityNameFormatted = cityTextField.text!.replacingOccurrences(of: " ", with: "+", options: .literal, range: nil)
        homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
         
         return UINavigationController(rootViewController: homeVC)
     }
     
     func createHistoryNC() -> UINavigationController{
         let historyVC = HistoryVC()
         historyVC.title = "History"
         historyVC.tabBarItem = UITabBarItem(title: "History", image: UIImage(systemName: "clock"), selectedImage: UIImage(systemName: "clock.fill"))
         
         return UINavigationController(rootViewController: historyVC)
     }
     
     
     func createTabBar() -> UITabBarController{
         
         let tabbar = UITabBarController()
         UITabBar.appearance().tintColor = .systemTeal
         tabbar.viewControllers = [createHomeNC(), createHistoryNC()]
          
         return tabbar
      }
    
}

extension SearchVC: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushTabBar()
        return true
    }
}
