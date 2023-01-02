import Foundation

let k = Int(readLine()!)!
var result: [Int] = []
for _ in 0..<k {
    let input = Int(readLine()!)!
    if input == 0 {
        result.removeLast()
    } else {
        result.append(input)
    }
}
print(result.reduce(0) { $0 + $1 })
