//
//  Meal.swift
//  foodtracker
//
//  Created by Portran Lu on 2019/4/3.
//  Copyright © 2019 盧柏瑋. All rights reserved.
//
// Importing UIKit also gives you access to Foundation(default).
import UIKit
import os.log
// The NSObject class’s only initializer is init(), the Swift compiler adds the call for you automatically, so you don’t need to change your code;
/*
     The NSCoding protocol declares two methods that any class that adopts to it must implement so that instances of that class can be encoded and decoded:
        1.encode(with aCoder: NSCoder)
        2.init?(coder aDecoder: NSCoder)
 */


class Meal: NSObject, NSCoding {
    //MARK: Properties
    
    //MARK: Archiving Paths
    //You mark these constants with the static keyword, which means they belong to the class instead of an instance of the class.
    //Outside of the Meal class, you’ll access the path using the syntax Meal.ArchiveURL.path. There will only ever be one copy of these properties, no matter how many instances of the Meal class you create.
    //The DocumentsDirectory constant uses the file manager’s urls(for:in:) method to look up the URL for your app’s documents directory. This is a directory where your app can save data for the user. This method returns an array of URLs, and the first parameter returns an optional containing the first URL in the array
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("meals")
    
    //MARK: Type
    struct PropertyKey {
        // The static keyword indicates that these constants belong to the structure itself, not to instances of the structure
        static let name = "name"
        static let photo = "photo"
        static let rating = "rating"
    }
    
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
    //MARK: NSCoding
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKey.name)
        aCoder.encode(photo, forKey: PropertyKey.photo)
        aCoder.encode(rating, forKey: PropertyKey.rating)
    }
    //The required modifier means this initializer must be implemented on every subclass, if the subclass defines its own initializers.
    //The convenience modifier means that this is a secondary initializer, and that it must call a designated initializer from the same class.
    //The question mark (?) means that this is a failable initializer that might return nil.
    required convenience init?(coder aDecoder: NSCoder) {
        // The name is required. If we cannot decode a name string, the initializer should fail.
        guard let name = aDecoder.decodeObject(forKey: PropertyKey.name) as? String else {
            os_log("Unable to decode the name for a Meal object.", log: OSLog.default, type: .debug)
            return nil
        }
        // Because photo is an optional property of Meal, just use conditional cast.
        // You downcast the value returned by decodeObject(forKey:) as a UIImage, and assign it to the photo constant. If the downcast fails, it assigns nil to the photo property. There is no need for a guard statement here, because the photo property is itself an optional.
        let photo = aDecoder.decodeObject(forKey: PropertyKey.photo) as? UIImage
        let rating = aDecoder.decodeInteger(forKey: PropertyKey.rating)
        // Must call designated initializer.
        // As a convenience initializer, this initializer is required to call one of its class’s designated initializers before completing. As the initializer’s arguments, you pass in the values of the constants you created while archiving the saved data.
        self.init(name: name, photo: photo, rating: rating)
    }
}
