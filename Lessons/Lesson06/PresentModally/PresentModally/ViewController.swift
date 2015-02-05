//
//  ViewController.swift
//  PresentModally
//
//  Created by Rudd Taylor on 1/14/15.
//  Copyright (c) 2015 GA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        println("View loaded!")
    }
    
    override func viewDidAppear(animated: Bool) {
        println("view appeared! Woohoo!")
    }
    
    override func viewDidDisappear(animated: Bool) {
        println("Phew, we finally dismissed a modal!")
    }
    
    @IBAction func didTapLogin(sender: AnyObject) {
        if countElements(emailField.text) > 0 {
//            dismissViewControllerAnimated(true, completion:nil)
            performSegueWithIdentifier("thanks", sender: nil)
        }
    }
    
}

