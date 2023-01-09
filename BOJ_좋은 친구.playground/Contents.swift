import Foundation

var input = readLine()!.split(separator: " ").map { Int(String($0))! }
let k = input[1]
var left: [Int] = []
var right: [Int] = []
var student: [Int: Int] = [:]
var result = 0
for _ in 0..<input[0] {
    if left.count + right.count > k {
        if right.isEmpty {
            right = left.reversed()
            left.removeAll()
        }
        student[right.removeLast()]! -= 1
    }
    left.append(readLine()!.map { $0 }.count)
    if student[left.last!] == nil {
        student[left.last!] = 1
    } else {
        student[left.last!]! += 1
    }
    result += student[left.last!]! - 1
}
print(result)
