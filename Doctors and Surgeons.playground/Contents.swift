// Some protocols and extensions:

protocol Payable {
  func calculateWages() -> Int
}

extension Payable {
  func calculateWages() -> Int {
    return 10000
  }
}

protocol ProvidesTreatment {
  func treat(name: String)
}

extension ProvidesTreatment {
  func treat(name: String) {
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
  func performSurgery(isEmergency emergency: Bool)
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

protocol Employee: Payable, HasRestTime, NeedsTraining {}


class Doctor: Employee, ProvidesDiagnosis, ProvidesTreatment {
  var name: String
  private(set) var currentPatient: String
  
  init(name: String, currentPatient: String) {
    self.name = name
    self.currentPatient = currentPatient
  }
  
  final func assignToPatient(_ name: String) {
    currentPatient = name
  }
  
  func performSurgery(isEmergency emergency: Bool) {
    if emergency {
      print("OK, let's go!")
    } else {
      print("Please find a surgeon")
    }
  }
}

final class Surgeon: Doctor, ConductsSurgery {
  var specialty: String
  
  init(name: String, specialty: String, currentPatient: String) {
    self.specialty = specialty
    super.init(name: name, currentPatient: currentPatient)
  }
  
  override func performSurgery(isEmergency emergency: Bool) {
    if emergency {
      print("OK, let's go!")
    } else {
      print("I'll do it next")
    }
  }
  
  func calculateWages() -> Int {
    return 20000
  }
}

// playing with Doctor()
let bones = Doctor(name: "Leonard McCoy", currentPatient: "Spock")
print(bones.name)
bones.name = "Leonard Bones McCoy"
print(bones.name)
bones.performSurgery(isEmergency: false)
bones.calculateWages()
bones.takeBreak()

// playing with Surgeon()
let pulaski = Surgeon(name: "Katherine Pulaski", specialty: "Cardiologist", currentPatient: "Picard")
pulaski.assignToPatient("Worf")
print(pulaski.currentPatient)
pulaski.performSurgery(isEmergency: true)
pulaski.performSurgery(isEmergency: false)
pulaski.calculateWages()
pulaski.diagnose()
pulaski.study()


