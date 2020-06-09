//
//  City.swift
//  Moodly
//
//  Created by Gonzalo Birrueta on 6/8/20.
//  Copyright © 2020 Gonzalo Birrueta. All rights reserved.
//

import UIKit

struct City: Codable{
    var name: String
    let main: Main
    let wind: Wind?
    let weather: [Weather]
//    var temp: Double
//    var speed: Double
//    var description: String
    
    private enum CodingKeys: String, CodingKey {
        case shortDesc = "main"
        case desc = "description"
        
    }
    
}

struct Weather: Codable{
    var shortDesc: String
    var desc: String
    
    private enum CodingKeys: String, CodingKey {
        case shortDesc = "main"
        case desc = "description"
        
    }
    
}

struct Main: Codable{
    var temp: Double
    var feels_like: Double
}

struct Wind: Codable{
    var speed: Double?
}
