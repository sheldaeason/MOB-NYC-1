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
  
  //MARK: IBOutlets
  @IBOutlet weak var numberInputTextField: UITextField!
  @IBOutlet weak var numberOutputLabel: UILabel!
  
  //TODO five: Display the cumulative sum of all numbers added every time the ‘add’ button is pressed. Hook up the label, text box and button to make this work.
  func updateSum() {
    let inputNumber = numberInputTextField.text.toInt()
    if let n = inputNumber {
      sum += n // this is identical to "sum = sum + n", it's called the "addition assignment operator"
    }
  }
  
  func outputSum() {
    numberOutputLabel.text = "\(sum)"
  }
  
  //MARK: IBActions
  @IBAction func addButtonTapped(sender: AnyObject) {
    updateSum()
    outputSum()
  }
  
  //MARK: UITextFieldDelegate
  func textFieldShouldReturn(textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }
}
