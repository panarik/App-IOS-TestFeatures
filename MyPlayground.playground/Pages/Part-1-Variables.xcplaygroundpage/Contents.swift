import Foundation

// Declare
var greeting = "Hello, playground"
var a = 1
a = 2

// Declare force.
var a1:String = "Hello"
var b:Int = 2
var c:Float = 2.5
var d:Double = 3.666666
var e:Bool = false
var g:Character = "@"
e = true

// Declare Constans
let cons = 5

// Declare computing property
var computedPr:String {
    a1 + " world!" // if one line, 'return' word isn't nesessary.
}

//Methods
print(computedPr)

//Round
print(round(d))

//Convert
print(Int(c)) // Float to Int
let line:String = String(a) // Int to String


//Concat
print("Hello " + "world!") // String with String
print("some text with digit \(b)") // String with Int


