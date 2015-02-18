//
//  ViewController.swift
//  MyPractice_2.17.15
//
//  Created by Shelda Eason on 2/17/15.
//  Copyright (c) 2015 Shelda Eason. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var total:Int = 0
    var mode:Int = 0
    var valueString:String! = ""
    var lastButtonWasMode:Bool = false

    @IBAction func multiplyTap(sender: AnyObject) {
        self.setMode(2)
    }
    
    @IBOutlet weak var outputLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func numberTap(sender: UIButton) {
        var str:String! = sender.titleLabel!.text
        var num:Int! = str.toInt()
        if(num == 0 && total == 0)
        {
            return
        }
        if (lastButtonWasMode)
        {
            lastButtonWasMode = false
            valueString = ""
        }
        valueString = valueString.stringByAppendingString(str)
        
        var formatter:NSNumberFormatter = NSNumberFormatter()
        formatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        var n:NSNumber = formatter.numberFromString(valueString)!
        
        outputLabel.text = formatter.stringFromNumber(n)
        
        if (total == 0)
        {
            total = valueString.toInt()!
        }
 //       total += valueString.toInt()!
    }
    
    
    @IBAction func plusTap(sender: AnyObject) {
        self.setMode(1)
    }
    
    @IBAction func minusTap(sender: AnyObject) {
        self.setMode(-1)
    }
    
    @IBAction func Equaltap(sender: AnyObject) {
        if (mode == 0)
        {
            return
        }
        var iNum:Int = valueString.toInt()!
        if (mode == 1)
        {
            total += iNum
        }
        if (mode == -1)
        {
            total -= iNum
        }
        if (mode == 2)
        {
            total *= iNum
        }
        
        valueString = "\(total)"
        var formatter:NSNumberFormatter = NSNumberFormatter()
        formatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        var n:NSNumber = formatter.numberFromString(valueString)!
        
        outputLabel.text = formatter.stringFromNumber(n)
        mode = 0
    }
    
    @IBAction func clearTap(sender: AnyObject) {
        total = 0
        mode = 0
        valueString = ""
        outputLabel.text = "0"
        lastButtonWasMode = false
    }
    func setMode(m:Int)
    {
        if (total == 0)
        {
            return
        }
        mode = m
        lastButtonWasMode = true
        total = valueString.toInt()!
    }


}

