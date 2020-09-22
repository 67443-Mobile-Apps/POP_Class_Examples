//: flatMap() examples

// flatten() reduces array complexity by one level; a two-dimensional array becomes a 
// single-dimensional array by concatenating items.  Now renamed joined()

let numbers = [[1, 2], [3, 4], [5, 6]]
let flattened = numbers.joined()
let flattened2 = Array(numbers.joined())
print(flattened2)

let flattened3 = numbers.flatMap { $0 }
flattened3


// real power of compactMap() is in handling optionals:
let officers: [String?] = ["Kirk", nil, "Spock", nil, "Bones"]
let result = officers.map { $0 }
print(result)

let resultFM = officers.compactMap { $0 }
print(resultFM)


// easily purging invalid values with compactMap()
let scores = ["100", "90", "Fish", "85"]

let mapScores = scores.map { Int($0) }
print(mapScores)

let flatMapScores = scores.compactMap { Int($0) }
print(flatMapScores)

