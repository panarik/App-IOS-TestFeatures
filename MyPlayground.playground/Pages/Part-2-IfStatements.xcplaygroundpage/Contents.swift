import Foundation

let a = 0
let b = 2
let c = 5

var boolAnd = a==0 && b==0 // And
var boolOr = a==0 || b==0 // Or
var boolNot = !(a==0) // Not
var bool3 = (a==0 && b==0) || !(c==5) //Combine

// with boolean
if a > 0  {
    print("'a' > 0")
}
else if boolAnd {
    print("'a' < 0")
}
else if a != b {
    print("'a' not equal 'b'")
}
else {
    print("'a' = 0")
}

// with methods
if isTrue() {
    print("print: \(isTrue())")
}


func isTrue() -> Bool {
    return true
}

