import Foundation

let str = readLine()!.map { $0 }
var stack: [String.Element] = []
var result = 0
var current = 1
var check = true

for i in 0..<str.count {
    let char = str[i]
    switch char {
    case "(":
        stack.append(char)
        current *= 2
    case "[":
        stack.append(char)
        current *= 3
    case ")":
        if stack.isEmpty || stack.last! != "("{
            check = false
            break
        }
        if str[i-1] == "(" {
            result += current
        }
        stack.removeLast()
        current /= 2
    case "]":
        if stack.isEmpty || stack.last! != "[" {
            check = false
            break
        }
        if str[i-1] == "[" {
            result += current
        }
        stack.removeLast()
        current /= 3
    default:
        break
    }
}
if !stack.isEmpty || !check {
    print(0)
} else {
    print(result)
}
