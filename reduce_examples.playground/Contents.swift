//: reduce() examples

let scores = [100, 90, 95]
let result = scores.reduce(0){$0 + $1}
print(result)
let result2 = scores.reduce("") { $0 + String($1) }
print(result2)


let names = ["Kirk", "Spock", "Bones", "Uhura", "Scotty", "Sulu"]

let count = names.reduce(0) { $0 + $1.count }
print(count)

// non-functional method of doing this:
var count2 = 0

for name in names {
  count2 += name.count
}

print(count2)

////*** EXERCISE ***//
// Using reduce(), find the number of names that are less than 5 characters

let countNames = names.reduce(0) { $1.count < 5 ? $0 + 1 : $0 }
countNames

let altCountNames = names.reduce(0){ $0 + ($1.count < 5 ? 1 : 0) }
altCountNames



// reducing to a boolean; are all the names at least 5 characters?
let longEnough = names.reduce(true) { $0 && $1.count > 4 }
print(longEnough)


// reducing to find a value
let longest = names.reduce("") { $1.count > $0.count ? $1 : $0 }
print(longest)

// alternate route with maxElement()
let numbers = [10, 6, 3, 9, 4, 6]
numbers.min()
numbers.max()

let longest2 = names.max { $1.count > $0.count }
print(longest2)  // notice it is an optional; compare with reduce which always has a value






