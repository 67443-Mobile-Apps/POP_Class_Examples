//: filter() examples

let fibonacciNumbers = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55]
let evenFibonacci = fibonacciNumbers.filter { $0 % 2 == 0 }
evenFibonacci



let names = ["Michael Jackson", "Taylor Swift", "Michael Caine", "Adele Adkins", "Michael Jordan", "George Michael"]
let result = names.filter { $0.hasPrefix("Michael") }
result



import Foundation
let officers = ["Kirk", "Spock", "Bones"]
var input = "The captain of the Enterprise is James T. Kirk"
let result2 = officers.filter { input.contains($0) }
result2

var redShirt: String?
let officers2:[String?] = ["Kirk", "Spock", redShirt, "Bones"]
let result3 = officers2.filter{$0 != nil}
result3



let scores = ["Paul": 95, "Taylor": 100, "Adele": 90, "Michael": 85, "Justin": 60]
let goodScores = scores.filter { $1 > 85 }
print(goodScores)
