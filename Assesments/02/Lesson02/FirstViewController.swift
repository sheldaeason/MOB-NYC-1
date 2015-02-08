//
//  FirstViewController.swift
//  Lesson02
//
//  Created by Rudd Taylor on 9/28/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITextFieldDelegate {
    
  
    //My IBOutlets
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
  
    //My Buttons
    
    @IBAction func tapButton(sender: AnyObject) {
        updateLabelTextField()
        showNameAndAge()
        drinkingAgePermission()
        additionalAgePermissions()
    }
    

    
    /*
    TODO one: hook up a button in interface builder to a new function (to be written) in this class. Also hook up the label to this class. When the button is clicked, the function to be written must make a label say ‘hello world!’
    */

    //MyNotes TODO one: Connect button in IB called tapButton. Connect label in IB called textLabel. (2) Create a func in the class called updateLabelTextField. This will enable the label to print "Hello World!" (3) Place updateLabelTextField inside the IBAction function.
    
    func updateLabelTextField() {
        textLabel.text = "Hello World!"
    }
    
    
    /*
    TODO two: Connect the ‘name’ and ‘age’ text boxes to this class. Hook up the button to a NEW function (in addition to the function previously defined). That function must look at the string entered in the text box and print out “Hello {name}, you are {age} years old!”
    */
    
    func showNameAndAge() {
        let name = nameTextField.text
        let age = ageTextField.text
        println("Hello \(name), you are \(age) years old!")
    }
    
    //MYNotes TODO two: (1) Connected Nmae and Age text fields in IB called nameTextField and ageTextField. (2) Created new function called showNameAndAge with constants for name and age to return a string "Hello \(name), you are \(age) years old!"). (3) Placed showNameAndAge in IBAction function.
    
    /*
    TODO three: Hook up the button to a NEW function (in addition to the two above). Print “You can drink” below the above text if the user is above 21. If they are above 18, print “you can vote”. If they are above 16, print “You can drive”
    */
    
    func drinkingAgePermission() {
        let age = ageTextField.text.toInt()
        if age >= 21 {
            println("You can drink.")
    }
        
    
    //MYNotes TODO three: (1) Created new function called drinkingAgePermission with a constant for age and an if condition for age >= 21 to return a string "You can drink"). (3) Placed drinkingAgePermission in IBAction function.
    
    /*
    TODO four: Hook up the button to a NEW function (in additino to the three above). Print “you can drive” if the user is above 16 but below 18. It should print “You can drive and vote” if the user is above 18 but below 21. If the user is above 21, it should print “you can drive, vote and drink (but not at the same time!”.
*/

    func additionalAgePermissions() {
        let age = ageTextField.text.toInt()
        if age >= 21 {
            println("You can drive, vote and drink (but not at the same time)!")
        } else if age >= 18 {
            println("You can drive and vote.")
        } else if age >= 16 {
            println("You can drive.")
        }
        
        
//MyNotes for TODO four: (1) Created new function called additionalAgepermissions. (2) Created constant for ageTextField and if statement for age.  (3) Created 2 else if conditions for age 18 and 16.

//My UITextFieldDelegate
        func textFieldShouldReturn(textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return true
    }
}
        
}


