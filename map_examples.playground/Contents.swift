//: map() examples

func lengthOfStrings(_ strings: [String]) -> [Int] {
  var result = [Int]()
  
  for string in strings {
    result.append(string.count)
  }
  
  return result
}

let qbs = ["Tom Brady", "Ben Roethlisberger", "Drew Brees", "Aaron Rogers"]
lengthOfStrings(qbs)

// much easier, simpler function using map()
func lengthOfStringsMap(_ strings: [String]) -> [Int] {
  return strings.map { $0.count }
}

lengthOfStringsMap(qbs)

// other examples
let fruits = ["Apple", "Cherry", "Orange", "Pineapple"]
let upperFruits = fruits.map { $0.uppercased() }
upperFruits

let scores = [100, 80, 85]
let formatted = scores.map { "Your score was \($0)" }
formatted

let passOrFail = scores.map { $0 > 85 ? "Pass" : "Fail" }
passOrFail


let position = [50, 60, 40]
let averageResults = position.map { 45...55 ~= $0  ? "Within average" : "Outside average" }
averageResults

import Foundation
let numbers: [Double] = [4, 9, 16, 25, 36, 49]
let result = numbers.map(sqrt)
result


// dealing with optionals
let i: Int? = 10
let j = i.map { $0 * 2 }
print(j)


// another example showing how map() makes it easier...
func fetchUsername(_ id: Int) -> String? {
  if id == 1 {
    return "profh"
  } else{
    return nil
  }
}

var username: String? = fetchUsername(12)
let formattedUsername = username.map { "Welcome, \($0)" } ?? "Unknown user"
print(formattedUsername)

// the non-functional alternative:
let username2 = fetchUsername(12)
let formattedUsername2: String

if let uname = username2 {
  formattedUsername2 = "Welcome, \(uname)"
} else {
  formattedUsername2 = "Unknown user"
}
print(formattedUsername2)

// or with a ternary operator as well as force unwrapping:
let username3 = fetchUsername(51)
let formattedUsername3 = username3 != nil ? "Welcome, \(username3!)!" : "Unknown user"
print(formattedUsername3)


// forEach() -- Swift's equivalent of Ruby's each()
["Kirk", "Spock", "Bones", "Uhura", "Scotty"].forEach { print($0) }

