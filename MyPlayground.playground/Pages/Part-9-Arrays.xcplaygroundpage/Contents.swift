import Foundation

// Create
var a = [String]() // Created empty.
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
