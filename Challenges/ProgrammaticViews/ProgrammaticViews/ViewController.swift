//
//  ViewController.swift
//  ProgrammaticViews
//
//  Created by trvslhlt on 1/7/15.
//  Copyright (c) 2015 travis holt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  let widget: UIButton
  
  override init() {
    widget = UIButton()
    super.init(nibName: nil, bundle: nil)
  }

  required init(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    setupWidget()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func setupWidget() {
    let spacingToTop: CGFloat = 20
    let width: CGFloat = 50
    let height = width
    self.view.addSubview(widget)
    widget.setTranslatesAutoresizingMaskIntoConstraints(false)
    let widthConstraint = NSLayoutConstraint(item: widget, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: width)
    let heightConstraint = NSLayoutConstraint(item: widget, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: height)
    let leftConstraint = NSLayoutConstraint(item: widget, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.LeadingMargin, multiplier: 1.0, constant: 0.0)
    let topConstraint = NSLayoutConstraint(item: widget, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.TopMargin, multiplier: 1.0, constant: spacingToTop)
    
    self.view.addConstraints([widthConstraint, heightConstraint, leftConstraint, topConstraint])
    
    widget.backgroundColor = UIColor.greenColor()
  }
  
}
