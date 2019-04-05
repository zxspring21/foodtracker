//
//  Meal.swift
//  foodtracker
//
//  Created by Portran Lu on 2019/4/3.
//  Copyright © 2019 盧柏瑋. All rights reserved.
//
// Importing UIKit also gives you access to Foundation(default).
import UIKit
class Meal {
    
    //MARK: Properties
    
    var name: String
    var photo: UIImage?
    var rating: Int
    //MARK: Initialization
    
//Failable initializers always start with either init? or init!. These initializers return optional values or implicitly unwrapped optional values, respectively. Optionals can either contain a valid value or nil. You must check to see if the optional has a value, and then safely unwrap the value before you can use it.
    init?(name: String, photo: UIImage?, rating: Int) {
//A guard statement declares a condition that must be true in order for the code after the guard statement to be executed. If the condition is false, the guard statement’s else branch must exit the current code block (for example, by calling return, break, continue, throw, or a method that doesn’t return like fatalError(_:file:line:)).
        // The name must not be empty
        guard !name.isEmpty else {
            return nil
        }
        
        // The rating must be between 0 and 5 inclusively
        guard (rating >= 0) && (rating <= 5) else {
            return nil
        }
        // Initialize stored properties.
        self.name = name
        self.photo = photo
        self.rating = rating
    }
}
