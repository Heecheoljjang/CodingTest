import Foundation

var input = "()(((()())(())()))(())".replacingOccurrences(of: "()", with: "*")
var stack = 0
var result = 0
for char in input {
    if char == "*" {
        if stack != 0 {
            result += stack
        }
    } else if char == "(" {
        stack += 1
    } else if char == ")" {
        stack -= 1
        result += 1
    }
}
print(result)
