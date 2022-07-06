import Foundation

var counter = 10
var sum = 0

// Loop with index
for index in 0...10 {
    print(index)
    sum += index
}
print(sum)

// Loop without index
for _ in 0...10 {
    print("Hello!")
}

// Loop one less than
for i in 0..<10 {
    print(i)
}

// Loop "While"
while counter > 0 {
    print(counter)
    counter -= 1
}

// Loop "Repeat"
repeat {
    print(counter)
    counter += 1
} while counter <= 10
