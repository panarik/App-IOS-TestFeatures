import Foundation


class Car {
    var topSpeed = 200
    
    func drive() {
        print("Car driving at \(topSpeed) km/hour.")
    }
}

// Inherit.
class FutureCar : Car {
    
    // Override parent method.
    override func drive() {
        super.drive() // Use parent method.
    }
    
    func fly() {
        print("Car flying.")
    }
}

let car = Car()
let futureCar = FutureCar()
car.drive()
futureCar.drive()
futureCar.fly()
