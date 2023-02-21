import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
var office: [[Int]] = []
for _ in 0..<input[0] {
    office.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}
