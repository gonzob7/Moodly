//
//  MLMoodSelectorCardVC.swift
//  Moodly
//
//  Created by Gonzalo Birrueta on 6/11/20.
//  Copyright © 2020 Gonzalo Birrueta. All rights reserved.
//

import UIKit

class MLMoodSelectorCardVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        layoutUI()
    }
    
    let moodStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 10
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    
    let happyButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "happy"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.layer.cornerRadius = 10
        return button
    }()
    
    
    let sadButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "sad"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.layer.cornerRadius = 10
        return button
    }()
    
    
    let neutralButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "neutral"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.layer.cornerRadius = 10
        return button
    }()
    
    
    let frustratedButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "frustrated"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.layer.cornerRadius = 10
        return button
    }()
    
    
    let saveButton: UIButton = {
        let button = UIButton()

        
        return button
    }()
    
    
    
    func layoutUI(){
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        
        view.addSubview(moodStackView)
        moodStackView.addArrangedSubview(happyButton)
        moodStackView.addArrangedSubview(neutralButton)
        moodStackView.addArrangedSubview(sadButton)
        moodStackView.addArrangedSubview(frustratedButton)

        NSLayoutConstraint.activate([
            
            moodStackView.widthAnchor.constraint(equalTo:  view.widthAnchor, multiplier: 0.95),
            moodStackView.heightAnchor.constraint(equalTo:  view.heightAnchor, multiplier: 0.75),
            moodStackView.centerXAnchor.constraint(equalTo:  view.centerXAnchor),
            moodStackView.centerYAnchor.constraint(equalTo:  view.centerYAnchor),
            
        ])
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
