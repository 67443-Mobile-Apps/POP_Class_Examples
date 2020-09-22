class Doctor {
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

final class Surgeon: Doctor {
  var specialty: String
  
  init(name: String, specialty: String, currentPatient: String) {
    self.specialty = specialty
    super.init(name: name, currentPatient: currentPatient)
  }
  
  override final func performSurgery(isEmergency emergency: Bool) {
    if emergency {
      print("OK, let's go!")
    } else {
      print("I'll do it next")
    }
  }
  
//  This won't work b/c can't override a final function
//  override func assignToPatient(name: String) {
//    currentPatient = name.uppercaseString
//  }
}

// playing with Doctor()
let bones = Doctor(name: "Leonard McCoy", currentPatient: "Spock")
print(bones.name)
bones.name = "Leonard Bones McCoy"
print(bones.name)
bones.performSurgery(isEmergency: false)

// playing with Surgeon()
let pulaski = Surgeon(name: "Katherine Pulaski", specialty: "Cardiologist", currentPatient: "Picard")
pulaski.assignToPatient("Worf")
print(pulaski.currentPatient)
pulaski.performSurgery(isEmergency: true)
pulaski.performSurgery(isEmergency: false)

// This won't work b/c can't override a final class
// class Cardiologist: Surgeon { }


