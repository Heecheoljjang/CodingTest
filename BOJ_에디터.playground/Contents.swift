import Foundation

var left = readLine()!.map { String($0) }
var right: [String] = []
let m = Int(readLine()!)!
for _ in 0..<m {
    var input = readLine()!
    switch input {
        case "L":
            if !left.isEmpty {
                right.append(left.removeLast())
            }
        case "D":
            if !right.isEmpty {
                left.append(right.removeLast())
            }
        case "B":
            if !left.isEmpty {
                left.removeLast()
            }
        default:
            left.append(String(input.last!))
    }
}
print((left + right.reversed()).joined())
