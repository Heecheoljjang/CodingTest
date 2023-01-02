import Foundation

let n = Int(readLine()!)!
var stack: [Int] = []
var current = 1

for i in 0..<n {
    let number = Int(readLine()!)!
    
    while number >= current {
        print("+")
        stack.append(current)
        current += 1
    }
    if stack.last == number {
        stack.removeLast()
        print("-")
    } else {
        print("NO")
        break
    }
}
