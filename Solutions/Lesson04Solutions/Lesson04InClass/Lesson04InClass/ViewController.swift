import UIKit

class ViewController: UIViewController {
  
  
    // Functions of use for this exercise:
    // Translating a string to an integer: "1".toInt()
    // Getting the text from a text field: let text = textFieldName.text
    // Setting the text on a text label or text field: textLabelName.text = "some text"
  
  @IBOutlet weak var textField: UITextField!
  @IBOutlet weak var label: UILabel!
  @IBOutlet weak var subtotalTextField: UITextField!
  @IBOutlet weak var tipTextField: UITextField!
  @IBOutlet weak var totalLabel: UILabel!
  
  var callsToFibAtIndex = 0
  var callsToDynamicFib = 0
  
  @IBAction func buttonTapped(sender: AnyObject) {
    
    helloPlusText()
    fibAtIndexOnLabel()
  }
  
    /*
    TODO: Create a text field, a label and a button in the storyboard's View Controller. Drag a new outlet from the label and text field to this file, then drag the 'touch up inside' event on the button into this file. When the button is clicked, make the text of the label display 'hello {whatever the text in the text field is}. Call an instructor/TA when you're done with this task.
    */
  
  func helloPlusText() {
    label.text = "Hello " + textField.text + "!"
  }
    
    /*
    TODO: Paste the fibonacci number function that you previously created into this class. Change the text box to use a numeric keypad for input. When the button is pressed, make the label print out the nth number in the fibonacci sequence (where n is the value of the text in the text field). Call an instructor/TA when you're done with this task.
    */
  
  
  func fibAtIndexOnLabel() {
    let index = textField.text.toInt()
    if let i = index {
      self.label.text = "\(dynamicFibAtIndex(i))"
    } else {
      self.label.text = "dOeSnOtCoMpUtE"
    }
  }
  
  func fibAtIndex(index: Int) -> Int {
    println("\(callsToFibAtIndex++)")
    if index < 0 { return -1 }
    if index == 0 { return 0 }
    if index == 1 { return 1 }
    return fibAtIndex(index - 1) + fibAtIndex(index - 2)
  }
  
  
  var results = [Int: Int]()
  func dynamicFibAtIndex(index: Int) -> Int {
    println("\(callsToFibAtIndex++)")
    if let result = results[index] {
      return result
    } else {
      if index < 0 { return -1 }
      if index == 0 { return 0 }
      if index == 1 { return 1 }
      let result = dynamicFibAtIndex(index - 1) + dynamicFibAtIndex(index - 2)
      results[index] = result
      return result
    }
  }
    
    /*
    TODO: Drag a new text field into the view controller, and create an outlet for it here. Make both text fields use the numeric keypad. One text field represents an optional tip percentage (in integer form, e.g 20 = 20% tip), the other represents the total amount of a bill. When the button is pressed, make the label display both the total amount and tip amount (e.g. "total: $100, tip: $15"). Call an instructor/TA when you're done with this task.
    */
  @IBAction func calculateTaped(sender: AnyObject) {
    tipWizard()
  }
  
  func tipWizard() {
    let subAndTip = subtotalAndTip()
    let total = calculateTotal(subAndTip.0, tip: subAndTip.1)
    displayTotal(total)
  }
  
  func subtotalAndTip() -> (Float, Float) {
    var subAndTip: (Float, Float) = (0.0, 0.0)
    
    //get inputs from text fields
    let subInInt = subtotalTextField.text.toInt()
    let tipInInt = tipTextField.text.toInt()
    
    //unwrap optionals. use values if they exist to override optionals
    if let s = subInInt { subAndTip.0 = Float(s) }
    if let t = tipInInt { subAndTip.1 = Float(t) / 100.0 }
    
    return subAndTip
  }
  
  func calculateTotal(subtotal: Float, tip: Float) -> Float {
    return subtotal * (1.0 + tip)
  }
  
  func displayTotal(total: Float) {
    totalLabel.text = String(format: "%.2f", total)
  }
}






















