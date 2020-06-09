//
//  ErrorMessage.swift
//  Moodly
//
//  Created by Gonzalo Birrueta on 6/8/20.
//  Copyright © 2020 Gonzalo Birrueta. All rights reserved.
//

import Foundation

enum CustomError: String, Error{
    case invalidCity = "This user does not exist, please check the username."
    case unableToComplete = "Unable to complete your request. Please check your internet connection."
    case invalidResponse = "Invalid response from the server. Please try again later."
    case invalidData = "The data recieved from the server was invalid. Please try again later."
}
