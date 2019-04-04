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
    
    var rating = 0{
        didSet {
            updateButtonSelectionStates()
        }
    }
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
        guard let index = ratingButtons.firstIndex(of: button) else {
            fatalError("The button, \(button), is not in the ratingButtons array: \(ratingButtons)")
        }
        
        // Calculate the rating of the selected button
        let selectedRating = index + 1
        
        if selectedRating == rating {
            // If the selected star represents the current rating, reset the rating to 0.
            rating = 0
        } else {
            // Otherwise set the rating to the selected star
            rating = selectedRating
        }
    }
    
    //MARK: Private Methods
    private func setupButtons() {
        // clear any existing buttons
        for button in ratingButtons {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        ratingButtons.removeAll()
        // Create the button
        // This initializer calls init(frame:) and passes in a zero-sized rectangle, and default Auto Layout
        // But when you add a view to a stack view, the stack view automatically sets the view’s translatesAutoresizingMaskIntoConstraints property to false
        
        
        //The underscore (_) represents a wildcard, which you can use when you don’t need to know which iteration of the loop is currently executing.
        
        // Load Button Images
        let bundle = Bundle(for: type(of: self))
        let filledStar = UIImage(named: "filledStar", in: bundle, compatibleWith: self.traitCollection)
        let emptyStar = UIImage(named:"emptyStar", in: bundle, compatibleWith: self.traitCollection)
        let highlightedStar = UIImage(named:"highlightedStar", in: bundle, compatibleWith: self.traitCollection)
        
        for index in 0..<starCount{
            let button = UIButton()
            // Set the button images
            // Buttons have five different states: normal, highlighted, focused, selected, and disabled.
            button.setImage(emptyStar, for: .normal)
            button.setImage(filledStar, for: .selected)
            button.setImage(highlightedStar, for: .highlighted)
            button.setImage(highlightedStar, for: [.highlighted, .selected])
            // Add constraints
            // If this property set True(default), then it tells layout engine to create constraints that define the view’s size and position based on the view’s frame and autoresizingmask properties.
            
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
            // Set the accessibility label
            button.accessibilityLabel = "Set \(index + 1) star rating"
            
            // Setup the button action
            // It's attaching the ratingButtonTapped(_:) action method to the button object, which will be triggered whenever the .TouchDown event occurs
            button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchUpInside)
            // Add the button to the stack
            addArrangedSubview(button)
            // Add the new button to the rating button array
            ratingButtons.append(button)
        }
        updateButtonSelectionStates()
    }
    private func updateButtonSelectionStates() {
        for (index, button) in ratingButtons.enumerated() {
            // If the index of a button is less than the rating, that button should be selected.
            button.isSelected = index < rating
            
            // Set the hint string for the currently selected star
            let hintString: String?
            if rating == index + 1 {
                hintString = "Tap to reset the rating to zero."
            } else {
                hintString = nil
            }
            
            // Calculate the value string
            let valueString: String
            switch (rating) {
            case 0:
                valueString = "No rating set."
            case 1:
                valueString = "1 star set."
            default:
                valueString = "\(rating) stars set."
            }
            
            // Assign the hint string and value string
            button.accessibilityHint = hintString
            button.accessibilityValue = valueString
        }
    }
}
