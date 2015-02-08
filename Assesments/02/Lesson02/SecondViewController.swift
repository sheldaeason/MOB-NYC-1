//
//  SecondViewController.swift
//  Lesson02
//
//  Created by Rudd Taylor on 9/28/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {
    
    var sum = 0
    
    //My IBOutlets
    
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var sumLabel: UILabel!

    //TODO five: Display the cumulative sum of all numbers added every time the ‘add’ button is pressed. Hook up the label, text box and button to make this work.
    
    
    func calcSum() {
        let sumNumber = numberTextField.text.toInt()
        if let n = sumNumber {
            sum += n
        }
    }

    func totalCalcSum() {
        sumLabel.text = "\(sum)"
    }
    
    //My IBAction Button
    @IBAction func calcButton(sender: AnyObject) {
        calcSum()
        totalCalcSum()
    }
    
    //My UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {textField.resignFirstResponder()
        return true
    }
   //MyNotes (1) Created a var called sum = 0.  This will start the calculation at 0. (2) Connected 2 IBOutlets called numberTextField and sumLabel. (3) Created a function called calcSum with a constant called sumNumber = numberTextField and an if let condition. (4) Created another function for the total calculation called totalCalcSum. (5) Added an IBAction function for the button. (6) Added an UITextFieldDelegate to clear out the text field.
}
