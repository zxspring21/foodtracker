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
        // Initialization should fail if there is no name or if the rating is negative.
        if name.isEmpty || rating < 0  {
            return nil
        }
        // Initialize stored properties.
        self.name = name
        self.photo = photo
        self.rating = rating
    }
}
