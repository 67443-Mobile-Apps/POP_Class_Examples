//: Extensions and Protocol Oriented Programming

// Extensions allow you to add functionality to specific types. For example, you can
// add a squared() method to integers like this:
extension Int {
  func squared() -> Int {
    return self * self
  }
}

// trying out the extension:
(1..<5).forEach { print($0.squared()) }

// this works...
let number: Int = 5
let result = number.squared()

// this doesn't...
//let uNumber: UInt = 5
//let result2 = uNumber.squared()    // unsigned int not the same data type

extension UInt {
  func squared() -> UInt {
    return self * self
  }
}

let num: Int = 5
let result3 = num.squared()
let uNumber: UInt = 5
let result4 = uNumber.squared()


// *******************************
// Applying to protocol extensions

protocol Payable {
  func calculateWages() -> Int
}

extension Payable {
  func calculateWages() -> Int {
    return 10000
  }
}

// applying this:

//struct Doctor { }
struct Doctor: Payable { }
struct Surgeon { }

//extension Doctor: Payable { }

let bones = Doctor()
print(bones.calculateWages())

// we can declare our own calculateWages w/o overriding
extension Surgeon: Payable {
  func calculateWages() -> Int {
    return 20000
  }
}

let pulaski = Surgeon()
print(pulaski.calculateWages())

let holodoc: Payable = Surgeon()
print(holodoc.calculateWages())

// bottom line: until you're comfortable with this distinction, always declare your methods in your protocols

