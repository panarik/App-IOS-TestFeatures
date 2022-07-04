import Foundation

// Create
var a = [String]() // Created empty with method
var a2:[String] = [] // Created empty with native
var a3:[String] // Creater without initializing
var d = ["cat", "dog", "bird"] // Created filled.

// Use
a += ["cat", "mouse"]
a[0] = "Elefant"
a.insert("fox", at: 0)
a.append("bird")
a.remove(at: 0)
print(a)

// Classic loop
for i in 0...d.count - 1 {
    print("\(i+1)st " + d[i])
}

// Loop for arays
for item in d {
    print("my " + item)
}

//
// 2x2 arrays
var twice =
[
    [0,1],
    [0,1,2],
]

// raw use.
for i in 0...twice.count-1 {
    for j in 0...twice[i].count-1 {
        print("Raw: \(i),\(j)")
    }
}

// method use
printArray(twice)

func printArray(_ array:[[Int]]) {
    for i in 0...array.count-1 {
        for j in 0...array[i].count-1 {
            print("Method: \(i),\(j)")
        }
    }
}
