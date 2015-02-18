//
//  CalculatorModel.swift
//  PracCalc_2.18.15
//
//  Created by Shelda Eason on 2/18/15.
//  Copyright (c) 2015 Shelda Eason. All rights reserved.
//

import UIKit

class CalculatorModel: NSObject {
        
        var numberArray:[Double] = [0.0]
        var operatorArray = [String]()
        
        // Does NOT adhere to PEMDAS
        func updateEquation(currentDisplay:Double) -> Double {
        
        numberArray.append(currentDisplay)
        var newDisplay:Double = currentDisplay
        
        if numberArray.count > 2 {
        // Retrieve next to last element
        var storedValue = numberArray[numberArray.count - 2]
        newDisplay = performMath(storedValue, currentDisplay: currentDisplay, operation: getCurrentOperator())
        numberArray.append(newDisplay)
        }
        
        return newDisplay
        }
        
        func performMath(storedValue:Double, currentDisplay:Double, operation:String) -> Double {
        var result: Double
        
        switch operation {
    case "÷":
        result = storedValue / currentDisplay
    case "×":
        result = storedValue * currentDisplay
    case "+":
        result = storedValue + currentDisplay
    case "−":
        result = storedValue - currentDisplay
    default:
        result = currentDisplay
        }
        return result
        }
        
        func updateOperator(operation:String) {
        operatorArray.append(operation)
        }
        
        func getCurrentOperator() -> String {
        var currentOperator = ""
        if let currentOperation = operatorArray.last {
        currentOperator = currentOperation
        }
        return currentOperator
        }
        
        func allClear() {
        numberArray = [0.0]
        operatorArray.removeAll(keepCapacity: false)
        }
    
}
