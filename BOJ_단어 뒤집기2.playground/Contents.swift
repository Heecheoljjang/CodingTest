import Foundation

var str = readLine()!.map { String($0) }
var result: [String] = []
var stack: [String] = []
var check = false

for i in 0..<str.count {
    if check {
        result.append(str[i])
        if str[i] == ">" {
            check = false
        }
        continue
    }
    if str[i] == "<" {
        if !stack.isEmpty {
            result.append(contentsOf: stack.reversed())
            stack = []
        }
        check = true
        result.append("<")
        continue
    }
    if str[i] == " "{
        if !stack.isEmpty {
            result.append(contentsOf: stack.reversed())
            stack = []
        }
        result.append(" ")
        continue
    }
    stack.append(str[i])
}
if !stack.isEmpty {
    result.append(contentsOf: stack.reversed())
}
print(result.joined())
