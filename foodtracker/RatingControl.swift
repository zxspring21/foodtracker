//
//  RatingControl.swift
//  foodtracker
//
//  Created by Portran Lu on 2019/4/1.
//  Copyright © 2019 盧柏瑋. All rights reserved.
//

import UIKit
//UIStackView subclass, called RatingControl
//@IBDesignable. This lets Interface Builder instantiate and draw a copy of your control directly in the canvas. Now, its layout engine can properly position and size the control.
@IBDesignable class RatingControl: UIStackView {
    //MARK: Properties
    //Interface Builder supports the inspection of basic types (and their corresponding optionals), including: Booleans, numbers, strings, as well as CGRect, CGSize, CGPoint, and UIColor
        // You need to reset the control’s buttons every time these attributes change. To do that, add a property observer to each property
        // Property observers are called every time a property’s value is set, and can be used to perform work immediately before or after the value changes
    @IBInspectable var starSize: CGSize = CGSize(width: 44.0, height: 44.0){
        didSet {
            setupButtons()
        }
    }
    @IBInspectable var starCount: Int = 5{
        didSet {
            setupButtons()
        }
    }
    private var ratingButtons = [UIButton]()
    
    var rating = 0
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
    }
    //required: indicating that their subclasses must also implement the initializers.
    //If you don’t provide any initializers, Swift classes automatically inherit all of their super class’s designated initializers.
    //If you implement any initializers, you not longer inherit any of the superclasses initializers
    required init(coder: NSCoder) {
        // If adding following line will cause super.init() function never tiggered.
        //fatalError("init(coder:) has not been implemented")
        super.init(coder: coder)
        setupButtons()
    }
    
    //MARK: Button Action
    @objc func ratingButtonTapped(button: UIButton) {
        print("Button pressed 👍")
    }
    
    //MARK: Private Methods
    private func setupButtons() {
        // Create the button
        // This initializer calls init(frame:) and passes in a zero-sized rectangle, and default Auto Layout
        // But when you add a view to a stack view, the stack view automatically sets the view’s translatesAutoresizingMaskIntoConstraints property to false
        
        
        //The underscore (_) represents a wildcard, which you can use when you don’t need to know which iteration of the loop is currently executing.
        
        for _ in 0..<starCount{
            let button = UIButton()
            button.backgroundColor = UIColor.red
            
            // Add constraints
            // If this property set True(default), then it tells layout engine to create constraints that define the view’s size and position based on the view’s frame and autoresizingmask properties.
            
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
            
            // Setup the button action
            // It's attaching the ratingButtonTapped(_:) action method to the button object, which will be triggered whenever the .TouchDown event occurs
            button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchUpInside)
            // Add the button to the stack
            addArrangedSubview(button)
            // Add the new button to the rating button array
            ratingButtons.append(button)
        }
    }
}
