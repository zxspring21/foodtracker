//
//  RatingControl.swift
//  foodtracker
//
//  Created by Portran Lu on 2019/4/1.
//  Copyright © 2019 盧柏瑋. All rights reserved.
//

import UIKit
//UIStackView subclass, called RatingControl
class RatingControl: UIStackView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
    }
    //required: indicating that their subclasses must also implement the initializers.
    //If you don’t provide any initializers, Swift classes automatically inherit all of their super class’s designated initializers.
    //If you implement any initializers, you not longer inherit any of the superclasses initializers
    required init(coder: NSCoder) {
        //fatalError("init(coder:) has not been implemented")
        super.init(coder: coder)
        setupButtons()
    }
    
    //MARK: Private Methods
    private func setupButtons() {
        // Create the button
        // This initializer calls init(frame:) and passes in a zero-sized rectangle, and default Auto Layout
        // But when you add a view to a stack view, the stack view automatically sets the view’s translatesAutoresizingMaskIntoConstraints property to false
        let button = UIButton()
        button.backgroundColor = UIColor.red
        // Add constraints
        // If this property set True(default), then it tells layout engine to create constraints that define the view’s size and position based on the view’s frame and autoresizingmask properties.
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
        button.widthAnchor.constraint(equalToConstant: 44.0).isActive = true
        
        // Add the button to the stack
        addArrangedSubview(button)
        
    }
    
}
