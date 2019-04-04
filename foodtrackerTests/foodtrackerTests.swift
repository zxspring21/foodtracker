//
//  foodtrackerTests.swift
//  foodtrackerTests
//
//  Created by 盧柏瑋 on 2018/11/13.
//  Copyright © 2018 盧柏瑋. All rights reserved.
//

import XCTest
@testable import foodtracker

class foodtrackerTests: XCTestCase {

    //MARK: Meal Class Tests
    // Confirm that the Meal initializer returns a Meal object when passed a valid parameters
    // automatically run
    func testMealInitializationSucceeds(){
        
        // Zero rating
        let zeroRatingMeal = Meal.init(name: "Zero", photo: nil, rating: 0)
        // check returned Meal object which isn't nil
        XCTAssertNotNil(zeroRatingMeal)
        
        // Highest positive rating
        let positiveRatingMeal = Meal.init(name: "Positive", photo: nil, rating: 5)
        XCTAssertNotNil(positiveRatingMeal)
        
    }

    // Confirm that the Meal initialier returns nil when passed a negative rating or an empty name.
    func testMealInitializationFails() {
        //these calls to init(name:, photo:, rating:) should fail.
        // Negative rating
        let negativeRatingMeal = Meal.init(name: "Negative", photo: nil, rating: -1)
        XCTAssertNil(negativeRatingMeal)
        
        // Rating exceeds maximum
        let largeRatingMeal = Meal.init(name: "Large", photo: nil, rating: 6)
        XCTAssertNil(largeRatingMeal)
        
        // Empty String
        let emptyStringMeal = Meal.init(name: "", photo: nil, rating: 0)
        XCTAssertNil(emptyStringMeal)
        
    }

}
