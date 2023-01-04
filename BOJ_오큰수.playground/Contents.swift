//**
import Foundation

let n = Int(readLine()!)!
var numbers = readLine()!.split(separator: " ").map { Int(String($0))! }
var stack: [Int] = []

for i in 0..<n {
    while !stack.isEmpty && numbers[stack.last!] < numbers[i] {
        numbers[stack.removeLast()] = numbers[i]
    }
    stack.append(i)
}
for num in stack {
    numbers[num] = -1
}
print(numbers.map { String($0) }.joined(separator: " "))
