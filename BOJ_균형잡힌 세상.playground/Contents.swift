import Foundation

var result: [String] = []

outer: while true {
    var stack: [Character] = []
    let input = readLine()!
    if input == "." {
        break
    }
    for char in input {
        if char == "(" || char == "[" {
            stack.append(char)
        } else if char == "]" || char == ")" {
            if stack.isEmpty {
                result.append("no")
                continue outer
            }
            if char == "]" && stack.removeLast() != "["{
                result.append("no")
                continue outer
            } else if char == ")" && stack.removeLast() != "("{
                result.append("no")
                continue outer
            }
        }
    }
    if stack.isEmpty {
        result.append("yes")
    } else {
        result.append("no")
    }
}
print(result.joined(separator: "\n"))
