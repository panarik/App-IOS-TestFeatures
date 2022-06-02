import Foundation

class MyClass {
    var title = ""
    var body = ""
    var sign = ""
    var rating = 0
    
    func upRating(add digit:Int) {
        rating += digit
    }
}

// Create object
let myObject = MyClass()

// Fill fields.
myObject.title = "My title"
myObject.body = "My body"
myObject.sign = "signed"

// Use methods
myObject.upRating(add: 5)

// Use fields
print(myObject.rating)





