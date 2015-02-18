//
//  ViewController.swift
//  PracCalc_2.18.15
//
//  Created by Shelda Eason on 2/18/15.
//  Copyright (c) 2015 Shelda Eason. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let calculator = CalculatorModel()
    var tappingNumbers = false
    
    var displayLabel = UILabel()
    var nineButton = UIButton()
    var eightButton = UIButton()
    var sevenButton = UIButton()
    var sixButton = UIButton()
    var fiveButton = UIButton()
    var fourButton = UIButton()
    var threeButton = UIButton()
    var twoButton = UIButton()
    var oneButton = UIButton()
    var zeroButton = UIButton()
    
    var addButton = UIButton()
    var subtractButton = UIButton()
    var multiplyButton = UIButton()
    var divideButton = UIButton()
    
    var clearButton = UIButton()
    var plusMinusButton = UIButton()
    var percentButton = UIButton()
    
    var decimalButton = UIButton()
    var equalButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        doLayout()
    }
    
    
    //Begin View
    func doLayout() {
        // Using Springs and Struts
        let buttonWidth = self.view.frame.width / 4
        let buttonHeight = buttonWidth + 10
        let labelWidth = self.view.frame.width - 20
        let labelHeight = self.view.frame.height - (buttonHeight * 5)
        
        self.view.backgroundColor = UIColor(red: 245/255.0, green: 216/255.0, blue: 195/255.0, alpha: 1.0)
        
        // Display Label
        displayLabel.frame = CGRect(x: 0, y: 0, width: labelWidth, height: labelHeight)
        displayLabel.backgroundColor = UIColor(red: 245/255.0, green: 216/255.0, blue: 195/255.0, alpha: 1.0)
        displayLabel.text = "0"
        displayLabel.textColor = UIColor(red: 136/255.0, green: 76/255.0, blue: 12/255.0, alpha: 1.0)
        displayLabel.font = UIFont(name: "Arial Rounded MT Bold", size: 65)
        displayLabel.textAlignment = .Right
        self.view.addSubview(displayLabel)
        
        // Button Frames
        var row1 = [clearButton, percentButton, plusMinusButton, multiplyButton]
        var row2 = [oneButton, twoButton, threeButton, divideButton]
        var row3 = [fourButton, fiveButton, sixButton, addButton]
        var row4 = [sevenButton, eightButton, nineButton, subtractButton]
        var row5 = [zeroButton, decimalButton, equalButton]
        var topRows = [row1, row2, row3, row4]
        
        for (rowIndex, rowArray) in enumerate(topRows) {
            for (columnIndex, button) in enumerate(rowArray) {
                var buttonX = CGFloat(columnIndex) * buttonWidth
                var buttonY = displayLabel.frame.maxY + CGFloat(rowIndex) * buttonHeight
                button.frame = CGRect(x: buttonX, y: buttonY, width: buttonWidth, height: buttonHeight)
            }
        }
        
        // Wide Button Frame
        for (index, button) in enumerate(row5) {
            var buttonX = (CGFloat(index) + 1) * buttonWidth
            var buttonY = displayLabel.frame.maxY + 4 * buttonHeight
            var buttonW = buttonWidth
            
            if index == 0 {
                buttonX = 0.0
                buttonW = buttonWidth * 2
            }
            button.frame = CGRect(x: buttonX, y: buttonY, width: buttonW, height: buttonHeight)
        }
        
        // Button Titles
        var numberButtons: [UIButton: String] = [oneButton: "1", twoButton: "2", threeButton: "3", fourButton: "4", fiveButton: "5", sixButton: "6", sevenButton: "7", eightButton: "8", nineButton: "9", zeroButton: "0"]
        
        var operatorButtons: [UIButton: String] = [divideButton: "÷", multiplyButton: "×", subtractButton: "−", addButton: "+", equalButton: "="]
        
        var specialButtons: [UIButton: String] = [clearButton: "AC", plusMinusButton: "+/-", percentButton: "%", decimalButton: "."]
        
        var allButtons = [numberButtons, operatorButtons, specialButtons]
        
        // Add Buttons to View
        for buttonArray in allButtons {
            for (button, strTitle) in buttonArray {
                button.backgroundColor = UIColor(red: 136/255.0, green: 76/255.0, blue: 12/255.0, alpha: 1.0)
                button.layer.borderColor = UIColor.whiteColor().CGColor
                button.layer.borderWidth = 1
                button.titleLabel?.font = UIFont(name: "Arial Rounded MT Bold", size: 45)
                button.setTitle(strTitle, forState: .Normal)
                self.view.addSubview(button)
            }
        }
        
        // Number Button Actions
        for (button, strTitle) in numberButtons {
            button.addTarget(self, action: "didTapNumber:", forControlEvents: .TouchUpInside)
        }
        
        // Operator Button Actions
        for (button, strTitle) in operatorButtons {
            button.addTarget(self, action: "didTapOperator:", forControlEvents: .TouchUpInside)
            button.backgroundColor = UIColor(red: 254/255.0, green: 128/255.0, blue: 35/255.0, alpha: 1.0)
        }
        
        // Special Button Actions
        for (button, strTitle) in specialButtons {
            switch button {
            case clearButton:
                button.addTarget(self, action: "didTapClear:", forControlEvents: .TouchUpInside)
            case decimalButton:
                button.addTarget(self, action: "didTapDecimal", forControlEvents: .TouchUpInside)
            case plusMinusButton:
                button.addTarget(self, action: "didTapPlusMinus", forControlEvents: .TouchUpInside)
            case percentButton:
                button.addTarget(self, action: "didTapPercent", forControlEvents: .TouchUpInside)
            default:
                break
            }
        }
    }
    
    
    //Begin Controller
    func updateDisplay(str:String) {
        displayLabel.text = str
    }
    
    func didTapNumber(sender: UIButton) {
        if let currentDisplay = displayLabel.text {
            if let currentButton = sender.titleLabel?.text {
                let previousDisplay = tappingNumbers ? currentDisplay : ""
                updateDisplay(previousDisplay + currentButton)
                clearButton.setTitle("C", forState: .Normal)
                tappingNumbers = true
            }
        }
    }
    
    func didTapDecimal() {
        if let currentDisplay = displayLabel.text {
            let previousDisplay = tappingNumbers ? currentDisplay : "0"
            if tappingNumbers {
                // In the middle of tapping
                if currentDisplay.rangeOfString(".") == nil {
                    updateDisplay(previousDisplay + ".")
                }
            } else {
                // Clearing out display
                updateDisplay(previousDisplay + ".")
            }
            clearButton.setTitle("C", forState: .Normal)
            tappingNumbers = true
        }
    }
    
    func didTapOperator(sender: UIButton) {
        if let currentOperator = sender.titleLabel?.text {
            if let displayString = displayLabel.text {
                if tappingNumbers {
                    tappingNumbers = false
                    var newDisplay = calculator.updateEquation(convertToDouble(displayString))
                    updateDisplay(convertToText(newDisplay))
                }
                calculator.updateOperator(currentOperator)
            }
        }
    }
    
    func didTapClear(sender: UIButton) {
        tappingNumbers = false
        
        // Determine button state
        if let currentClear = sender.titleLabel?.text{
            if currentClear == "C" {
                sender.setTitle("AC", forState: .Normal)
                displayLabel.text = "0"
            } else {
                calculator.allClear()
            }
        }
    }
    
    func didTapPlusMinus() {
        tappingNumbers = true
        if let currentDisplay = displayLabel.text {
            var currentDouble = convertToDouble(currentDisplay)
            if currentDouble != 0 {
                currentDouble *= -1.0
                updateDisplay(convertToText(currentDouble))
            }
            
        }
    }
    
    func didTapPercent() {
        tappingNumbers = true
        if let currentDisplay = displayLabel.text {
            var newDisplay = convertToDouble(currentDisplay) / 100
            updateDisplay(convertToText(newDisplay))
        }
    }
    
    func convertToDouble(str:String) -> Double {
        var displayDouble = (str as NSString).doubleValue
        return displayDouble
    }
    
    func convertToText(number:Double) -> String {
        var displayText = "\(number)"
        
        // Remove .0 from string
        if displayText.hasSuffix(".0") {
            displayText = dropLast(dropLast(displayText))
        }
        return displayText
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

