/*:
 # Protocol Oriented Programming
 
 Some protocols and extensions:
 */
protocol Payable {
  func calculateWages() -> Int
}

extension Payable {
  func calculateWages() -> Int {
    return 10000
  }
}

protocol ProvidesTreatment {
  func treat(_ name: String)
}

extension ProvidesTreatment {
  func treat(_ name: String) {
    print("I have treated \(name)")
  }
}

protocol ProvidesDiagnosis {
  func diagnose() -> String
}

extension ProvidesDiagnosis {
  func diagnose() -> String {
    return "He's dead, Jim"
  }
}

protocol ConductsSurgery {
  func performSurgery()
}

extension ConductsSurgery {
  func performSurgery() {
    print("Success!")
  }
}

protocol HasRestTime {
  func takeBreak()
}

extension HasRestTime {
  func takeBreak() {
    print("Time to watch Star Trek")
  }
}

protocol NeedsTraining {
  func study()
}

extension NeedsTraining {
  func study() {
    print("I'm reading a manual")
  }
}


/*:
Some initial structs
*/
struct Receptionist { }
struct Nurse { }
struct Doctor { }
struct Surgeon { }

/*:
 These protocols and extension can help us expand the functionality of those structs
 */
//extension Receptionist: Payable, HasRestTime, NeedsTraining {}
//extension Nurse: Payable, HasRestTime, NeedsTraining, ProvidesTreatment {}
//extension Doctor: Payable, HasRestTime, NeedsTraining, ProvidesTreatment, ProvidesDiagnosis {}
//extension Surgeon: Payable, HasRestTime, NeedsTraining, ProvidesDiagnosis, ConductsSurgery {}
//











/*:
 **Refactoring time?**
 
 Notice that everyone needs Payable, HasRestTime, NeedsTraining -- that repetition (code smell) alerts us to the fact that we might be able to refactor...
 */
protocol Employee: Payable, HasRestTime, NeedsTraining {}

//extension Receptionist: Employee {}
//extension Nurse: Employee, ProvidesTreatment {}
//extension Doctor: Employee, ProvidesDiagnosis, ProvidesTreatment {}
//extension Surgeon: Employee, ProvidesDiagnosis, ConductsSurgery {}




/*:
 Revising and customizing our extensions
 */
extension Receptionist: Employee {
  func calculateWages() -> Int {
    return 5000
  }

  func study() {
    print("Going to training session")
  }
}
extension Nurse: Employee, ProvidesTreatment {
  func calculateWages() -> Int {
    return 8000
  }
}
extension Doctor: Employee, ProvidesDiagnosis, ProvidesTreatment {}
extension Surgeon: Employee, ProvidesDiagnosis, ConductsSurgery {
  func calculateWages() -> Int {
    return 20000
  }
}

/*:
 Apple' advice for POP is this: *"don't start with a class, start with a protocol."*
 And that's exactly what we've done here: we started by defining the various behaviors
 we wanted to represent in our app, then created structs that adopted those behaviors
 to bring it all to life.
 */



/*:
 Limiting our extension so they are only applied when appropriate
 */
//extension Employee {
//  func checkInsurance() {
//    print("Yup, I'm totally insured")
//  }
//}

//  Problem here is that all employees get this, but really only those who have protocol
//  ProvidesTreatment really need this.  There are constrained extensions in this case:

extension Employee where Self: ProvidesTreatment {
  func checkInsurance() {
    print("Yup, I'm totally insured")
  }
}

/*:
 Trying it all out...
 */
let troi = Receptionist()
let chappell = Nurse()
let bones = Doctor()
let pulaski = Surgeon()


// all are payable: calculateWages
troi.calculateWages()
chappell.calculateWages()
bones.calculateWages()
pulaski.calculateWages()

// all have needRestTime: takeBreak
troi.takeBreak()
chappell.takeBreak()
bones.takeBreak()
pulaski.takeBreak()

// all have NeedsTraining: study
troi.study()
chappell.study()
bones.study()
pulaski.study()

// only nurses and doctors ProvidesTreatment: treat
//troi.treat("no one")
chappell.treat("Sulu")
bones.treat("Chekov")
//pulaski.treat("Picard")

// only doctors and surgeons ProvidesDiagnosis: diagnose
//troi.diagnose()
//chappell.diagnose()
bones.diagnose()
pulaski.diagnose()

// only surgeons ConductsSurgery: performSurgery
//bones.performSurgery()
pulaski.performSurgery()

// only nurses and doctors checkInsurance b/c only they ProvidesTreatment
//troi.checkInsurance()
chappell.checkInsurance()
bones.checkInsurance()
//pulaski.checkInsurance()



