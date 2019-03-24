//
//  ViewController.swift
//  foodtracker
//
//  Created by 盧柏瑋 on 2018/11/13.
//  Copyright © 2018 盧柏瑋. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    //Mark: Propertoies

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var mealNameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Handle the text field's user input through delegate callbacks
        nameTextField.delegate = self
        
    }
    //Mark: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        //Hide the key
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        mealNameLabel.text = textField.text
    }
    
    //Mark: Actions
    @IBAction func setDefaultLabelText(_ sender: UIButton) {
        mealNameLabel.text = "Default Text"
    }
    
}

