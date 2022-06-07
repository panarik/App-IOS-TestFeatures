import Foundation


// Simple.
func myFunction() {
    print("Hello from function.")
}
myFunction()


// Return.
func myFunctionRetun() -> String {
    return "Returned from function."
}
print(myFunctionRetun())


// Without argument and replace parameters
func myFunctionParam(_ text:String) -> String {
    return text
}
print(myFunctionParam("Hello from param with replased."))


// Without arg
func myFunctionParam(text:String) -> String {
    return text
}
print(myFunctionParam(text: "Hello from param."))


// With arg
func myFunctionParam(arg param:String) -> String {
    return param
}
print(myFunctionParam(arg:"Hello from param with argument."))


// Several params.
func add(digit1:Int, digit2:Int) -> Int {
    return digit1 + digit2
}
print(add(digit1:1, digit2:2))


// Optional params.
func multiple(a:Int, b:Int = 10) -> Int {
    return a*b
}
print(multiple(a:2, b:10)) // using both parameters
print(multiple(a: 2)) // using one parameter

