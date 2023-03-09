import Foundation

//let n = Int(readLine()!)!
//let numbers = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = 3
let numbers = [10,2,9]
var result = Array(repeating: 0, count: n)
for i in 0..<n {
    result[i] = numbers[i]
    for j in 0...i {
        if numbers[j] < numbers[i] {
            result[i] = max(result[i], result[j] + numbers[i])
        }
    }
}
print(result)
print(result.max()!)

