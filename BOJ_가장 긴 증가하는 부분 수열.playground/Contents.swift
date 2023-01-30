import Foundation

let n = Int(readLine()!)!
var numbers = readLine()!.split(separator: " ").map { Int(String($0))! }
var result = Array(repeating: 1, count: n + 1)
for i in 0..<n {
    for j in 0...i {
        if numbers[i] > numbers[j] {
            result[i] = max(result[i], result[j] + 1)
        }
    }
}
print(result.max()!)
