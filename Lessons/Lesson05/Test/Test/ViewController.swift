//
//  ViewController.swift
//  Test
//
//  Created by Rudd Taylor on 1/12/15.
//  Copyright (c) 2015 GA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var label: NSLayoutConstraint!
    @IBAction func didTapDog(sender: AnyObject) {
        var dog = Animal()
        dog.name = "Rover"
        dog.species = "Dog"
        textLabel.text = dog.stringRepresentation()
        
        view.backgroundColor = UIColor.redColor()
    }
    @IBAction func didTapCat(sender: AnyObject) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

