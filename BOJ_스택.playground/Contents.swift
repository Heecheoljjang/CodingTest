import Foundation

let n = Int(readLine()!)!
var stack: [Int] = []

for _ in 0..<n {
    let input = readLine()!.components(separatedBy: " ").map { $0 }
    let command = input[0]
    switch command {
        case "push":
            let num = Int(input[1])!
            stack.append(num)
        case "pop":
            if stack.count == 0 {
                print("-1")
            } else {
                print(stack.removeLast())
            }
        case "size":
            print(stack.count)
        case "empty":
            print(stack.isEmpty ? "1" : "0")
        case "top":
            print(stack.isEmpty ? "-1" : stack.last!)
        default:
            break
    }
}
