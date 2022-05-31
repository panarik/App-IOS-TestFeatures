import Foundation

var char:Character = "c"

switch char {
    
    case "a":
        print("is 'a'")
    
    case "b", "c":
        print("is 'b' or 'c'")
    
    default:
        print("is default")
}
