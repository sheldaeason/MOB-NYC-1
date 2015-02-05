// Lesson 03 playground

import Foundation

// TODO: Create two variables, name and age. Name is a string, age is an integer.
var name = "Dale Cooper" // alternatively: var name: String = "Dale Cooper"
var age = 30  // alternatively: var age: Int = 30




// TODO: Print "Hello {whatever the value of name is}, you are {whatever the value of age is} years old!"
println("Hello \(name), you are \(age) years old.")





// TODO: Print “You can drink” below the above text if the user is above 21. If they are above 18, print “you can vote”. If they are above 16, print “You can drive”
if age >= 21 {
  println("You can drink.")
}
if age >= 18 {
  println("You can vote.")
}
if age >= 16 {
  println("You can drive.")
}







// TODO: Print “you can drive” if the user is above 16 but below 18. It should print “You can drive and vote” if the user is above 18 but below 21. If the user is above 21, it should print “you can drive, vote and drink (but not at the same time!”.
if age >= 21 {
  println("You can drink and drive but not at the same time.")
} else if age >= 18 {
  println("You can drive and vote")
} else if age > 16 {
  println("You can drive")
}








// TODO: Print the first fifty multiples of seven minus one (e.g. the first three multiples are 7, 14, 21. The first three multiples minus one are 6, 13, 20)
for i in 1...50 {
  let r = i * (7 - 1)
  println(r)
}





// TODO: Create a constant called number
let number = 11






// TODO: Print whether the above number is even
let result = (number % 2 == 0) ? "even" : "odd"
println(result)







// TODO: The first fibonacci number is 0, the second is 1, the third is 1, the fourth is two, the fifth is 3, the sixth is 5, etc. The Xth fibonacci number is the sum of the X-1th fibonacci number and the X-2th fibonacci number. Print the 37th fibonacci number below
var queryIndex = 4 // the 0th index is the 1st element in the sequence

var fi = 0
var fj = 1
var fibValue = fi + fj

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
println("\(fibValue)")








// TODO: Print out "Hello {whatever the value of name is}, your name is {however long the string name is} characters long!. Use countElements()
println("Hello \(name), yout name is \(countElements(name)) characters long!")







// TODO: Print the sum of one hundred random numbers. Use rand() to generate random numbers.
var sum = 0

for _ in 1...100 {
  let randInt = Int(rand())
  sum += randInt
}

println("\(sum)") // alternatively: println(sum)
















