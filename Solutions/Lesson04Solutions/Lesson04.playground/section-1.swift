// Playground - noun: a place where people can play
// Lesson 04

import Foundation
import UIKit

// Complete these, in order, writing code under each TODO statement. Each statement calls for a function to be written, write each of them and then immediately call it after the function definition.



// TODO: Write a function that prints out "Hello world!" 10 times
func helloWorld() {
  for i in 1...10 {
    println("Hello world!")
  }
}
helloWorld()






//// TODO: Write a function that prints out "Hit this line {number of iterations of the loop} times!" 20 times
func hitLine(times: Int) {
  for i in 1...times {
    println("Hit this line \(i) times!")
  }
}
hitLine(20)


//// TODO: Write a function that accepts a string as a parameter. Print "Hello {value of string}!"
func helloWithInput(name: String) {
  println("Hello \(name)")
}

helloWithInput("Dale")







//// TODO: Write a function accepts a string optional. If the string optional exists, print "Hello {value of string}!". If it doesn't, print "Hello world!"
func helloOptional(name: String?) {
  if let n = name {
    println("Hello \(n)!")
  } else {
    println("Hello world!")
  }
}
helloOptional("Coop")
helloOptional(nil)











//// TODO: Write a function that takes one parameter, n, and returns an integer, the nth series in the fibonacci sequence. The first fibonacci number is 0, the second is 1, the third is 1, the fourth is 2, fifth is 3, sixth is 5, etc. fibonacci numbers at sequence n are the sum of the n-1 and n-2 fibonacci number.
func fibSeq(n: Int) -> Int {
  var fi = 0
  var fj = 1
  var fibValue = fi + fj
  
  var queryIndex = n // make a variable so I can change the value of n
  
  if queryIndex < 0 {
    println("indices should only be positive")
    
  } else if queryIndex == 0 {
    fibValue = fi
    
  } else if queryIndex == 1 {
    fibValue = fj
    
  } else {
    while queryIndex > 1 {
      fibValue = fi + fj
      fi = fj
      fj = fibValue
      queryIndex--
    }
  }
  return fibValue
}
//fibSeq(1)








////// TODO: Write a function that calls the above function in order to return the sum of the first ? fibonacci numbers.
func fibSum(toIndex: Int) -> Int {
  var sum = 0
  if toIndex < 0 { return 0 }
  
  for i in 0...toIndex {
    sum += fibSeq(i)
  }
  return sum
}
//fibSum(-1)
//fibSum(4)









// TODO: Write a function that takes in a number and prints out whether it is prime, composite or neither.
func compositeTester(n: Int) -> String {
  let neither = "neither"
  let prime = "prime"
  let composite = "composite"
  var testDivisor = 2
  if n < testDivisor {
    println("\(n): \t\t\(neither)")
    return neither
  }
  
  while testDivisor < n {
    if n % testDivisor == 0 {
      println("\(n): \t\t\(composite)")
      return composite
    }
    testDivisor++
  }
  
  println("\(n): \t\t\(prime)")
  return prime
}

compositeTester(-1)
compositeTester(0)
compositeTester(1)
compositeTester(2)
compositeTester(4)
compositeTester(100)








// TODO: Write a function that prints out each of the first 20 fibonacci numbers and whether they are prime. (e.g. 0 is not prime or composite, 1 is prime, etc)
func fibCompositeTester(toIndex: Int) {
  for i in 0...toIndex {
    let value = fibSeq(i)
    let result = compositeTester(value)
    println("the \(i) fibonacci number is \(value), and it is \(result)")
  }
}
fibCompositeTester(10)















// TODO: Write a function that takes in two numbers, a bill amount and an optional tip percentage (represented as a float, e.g. .2 = 20% tip). Return a tuple with the total bill amount and the tip amount (if included).



func tipCalc(subTotal: Float, tip: Float?) -> (Float, Float) {
  
  var total = subTotal
  var tipAmount: Float = 0
  
  if let t = tip {
    tipAmount = subTotal * t
  }
  
  total += tipAmount
  return(total, tipAmount)
}


let tipResult = tipCalc(10, 0.2)
let t = tipResult.0
let tndfgfgb = tipResult.1


 //TODO: Write a function that takes in a string and returns a string that is the reverse of the input. Append two strings using the + operator.

func reverseString(originalString: String) -> String {
  var reverseString = ""
  for c in originalString {
    reverseString = "\(c)" + reverseString
  }
  return reverseString
}
reverseString("travis lee holt")
reverseString("!skrow ti")











// BONUS TODO: Write a function that takes in an array of strings and a search term string. Return a boolean indicating whether the search term string exists in the array.

func searchForTerm(term: String, inWords words: [String]) -> Bool {
  var matchFound = false
  for word in words {
    if word == term {
      matchFound = true
      break
    }
  }
  return matchFound
}

let words = ["a", "supposedly", "fun", "thing"]
let termA = "a"
let termB = "not"
let found = searchForTerm(termA, inWords: words)
let notFound = searchForTerm(termB, inWords: words)













// BONUS TODO: Write a function that accepts a string and returns a boolean indicating whether a string is a palindrome (reads the same backwards or forwards).

func isPalindrome(word: String) -> Bool {
  let reversedWord = reverseString(word)
  let reverseWordArray = Array(reversedWord)

  for (index, character) in enumerate(Array(word)) {
    if character != reverseWordArray[index] { return false }
  }
  return true
}

isPalindrome("apple")
isPalindrome("racecar")












// BONUS TODO: Write a function that takes in two strings and returns a boolean indicating whether the two strings have the same number of lowercase 'a's in them


func countMatches(string: String, testString: String) -> Int {
  var count = 0
  let testLength = countElements(testString)
  let stringArray = Array(string)
  if testLength > stringArray.count { return 0 }
  
  for var i = 0; i <= stringArray.count - testLength; i++ {
    let partToTest = stringArray[i..<(i + testLength)]
    var pttConcat = ""
    //TODO: Look for function that takes [String] and returns String
    for j in partToTest {
      pttConcat += "\(j)"
    }
    if pttConcat == testString { count++ }
  }
  return count
}

func charSequenceCountCompatator(stringsToCompare: [String], testString: String) -> Bool {
  
  //count how many times the test sequence appears in each string
  var counts = [Int](count: stringsToCompare.count, repeatedValue: 0)
  for (index, string) in enumerate(stringsToCompare) {
    counts[index] = countMatches(stringsToCompare[index], testString)
  }
  
  //compare the values of each element to eachother
  for element in counts {
    for e in counts {
      if element != e { return false }
    }
  }
  return true
}

let csccWords = ["goat", "pogo"]
let testString = "go"
let result = charSequenceCountCompatator(csccWords, testString)













// BONUS TODO: Write a function that accepts two parameters, a string and a function that accepts a string and returns a string. Print the result of passing the string into the function 10 times.

func stringFunctionExciter(function: (String -> String), inString: String) -> String {
  return "!!! " + function(inString) + " !!!"
}

let higherOrderFunctionTest = stringFunctionExciter(reverseString, "dehsinif era ew")

















