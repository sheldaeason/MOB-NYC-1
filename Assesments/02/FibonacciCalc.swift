//
//  FibonacciCalc.swift
//  Lesson02
//
//  Created by Shelda Eason on 2/7/15.
//  Copyright (c) 2015 General Assembly. All rights reserved.
//

import UIKit

class FibonacciCalc: NSObject {

    func fibonacciNumberAtIndex(index: Int) -> Int {
        var a = 0
        var b = 1
        var c = a + b
        
        if index < 0 {return -1}
        if index == 0 {return 0}
        if index == 1 {return 1}
        
        for i in 2...index {
            c = a + b
            a = b
            b = c
        }
    }
}
