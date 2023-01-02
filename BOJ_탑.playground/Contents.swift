import Foundation

let n = Int(readLine()!)!
let top = readLine()!.components(separatedBy: " ").map { Int($0)! }
var stack: [Int] = [0]
var result: [Int] = [0]

for i in 1..<n {
    while !stack.isEmpty {
        if top[stack.last!] > top[i] {
            result.append(stack.last! + 1)
            break
        }
        stack.removeLast()
    }
    if stack.isEmpty {
        result.append(0)
    }
    stack.append(i)
}

print(result.map { String($0) }.joined(separator: " "))
