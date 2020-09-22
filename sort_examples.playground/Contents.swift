//: sort() examples

var scoresString = ["99", "95", "85", "90", "99"]
//scoresString.sort()




var scoresInt = scoresString.compactMap { Int($0) }
print(scoresInt)
scoresInt.sorted()
print(scoresInt)  // not changed
scoresInt.sort()
print(scoresInt)  // sorted in place
scoresInt.sorted().reversed()
Array(scoresInt.sorted().reversed())
//scoresInt.sort()  // note if just map() then get [Int?] which doesn't have sort()

// sorting structs
//struct Person {
//  var name: String
//  var age: Int
//}

struct Person: Comparable {
  var name: String
  var age: Int
}

func <(lhs: Person, rhs: Person) -> Bool {
  return lhs.name < rhs.name
}

func ==(lhs: Person, rhs: Person) -> Bool {
  return lhs.name == rhs.name && lhs.age == rhs.age
}

let kirk = Person(name: "Kirk", age: 36)
let spock = Person(name: "Spock", age: 120)
let bones = Person(name: "Bones", age: 54)
let uhura = Person(name: "Uhura", age: 27)

kirk < spock
kirk == spock

var people = [kirk, spock, bones, uhura]
//print(people)

let sortedPeople = people.sorted(by: { $0 < $1 })
//print(sortedPeople)
print(sortedPeople.map{$0.name})

let reverseSortedPeople = people.sorted(by: { $0.name > $1.name })
//print(reverseSortedPeople)
print(reverseSortedPeople.map{$0.name})
