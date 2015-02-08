//
//  ThirdViewController.swift
//  Lesson02
//
//  Created by Rudd Taylor on 9/28/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var calcTextField: UITextField!
    
    @IBOutlet weak var calcSumLabel: UILabel!
  
    func sumIsEven(number: Int) -> Bool {
        return number % 2 == 0
    }
    
    func updateCalc() {
        let number = calcTextField.text.toInt()
        if let n = number {
            calcSumLabel.text = sumIsEven (n) ? "Sum is even" : "Sum is odd"
        }
    }
    
    
    @IBAction func tapButton(sender: AnyObject) {
        updateCalc()
        
    }
    
    
    /*
    TODO six: Hook up the number input text field, button and text label to this class. When the button is pressed, a message should be printed to the label indicating whether the number is even.

*/
    
    
}
