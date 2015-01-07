//
//  ThirdViewController.swift
//  Lesson02
//
//  Created by Rudd Taylor on 9/28/14.
//  Copyright (c) 2014 General Assembly. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
  
  //MARK: IBOutlets
  @IBOutlet weak var inputTextField: UITextField!
  @IBOutlet weak var outputLabel: UILabel!
  
/*
    TODO six: Hook up the number input text field, button and text label to this class. When the button is pressed, a message should be printed to the label indicating whether the number is even.

*/
  func isEven(number: Int) -> Bool {
    return number % 2 == 0
  }
  
  func updateViews() {
    let number = inputTextField.text.toInt()
    if let n = number {
      outputLabel.text = isEven(n) ? "is even" : "is odd" //this type of syntax is called the "ternary operator"
    }
  }
  
  //MARK: IBAction
  
  @IBAction func calculateTapped(sender: AnyObject) {
    updateViews()
  }
  
}









