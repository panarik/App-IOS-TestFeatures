import Foundation

let a = 0
let b = 2
let c = 5

var boolAnd = a==0 && b==0 // And
var boolOr = a==0 || b==0 // Or
var boolNot = !(a==0) // Not
var bool3 = (a==0 && b==0) || c==5

if a > 0  {
    print("only if a > 0")
}
else if boolAnd {
    print("only if a < 0")
}
else {
    print("a = 0")
}

