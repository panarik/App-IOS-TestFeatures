import Foundation


// MARK: Classes
class MyClass {
    
    //Computed property
    var fullTitle:String {
        // do some code as function with return.
        return "New full Title with author"
    }
    
    // Property
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


// MARK: Structions

// Create a structure.
struct MyStruct {
    
    // Have variables.
    var message = "some message"
    var myObject = MyClass()
    
    // Have functions.
    func myFunc() {
        print(message)
    }
    
    // Have classes.
    class MyClass {
        var message = "Hello!"
    }
    
}

// Use structures.
var a = MyStruct() // Create object of struction.
a.message = "Hello from struction!" // Assign data to object.
a.myFunc() // Use object.





