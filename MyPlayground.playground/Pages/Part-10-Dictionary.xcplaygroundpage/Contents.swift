import Foundation

// Create
var myDB1 = Dictionary<String, String>()
var myDB2 = [String:String]()

// Add
myDB1["key1"] = "Value_1"
myDB1["key2"] = "Value_2"
myDB1["key1"] = "Value_new" // replace value for a key

// Use (with unwrapper)
if let result = myDB1["key1"] {
    print(result)
}

// Use loop
for (key, value) in myDB1 {
    print("\(key) contains value \(value)")
}

// Remove
myDB1["key1"] = nil
 
