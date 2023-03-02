import Foundation

let n = Int(readLine()!)!
var numbers: [Int] = []
for _ in 0..<n {
    numbers.append(Int(readLine()!)!)
}
for i in numbers.sorted(by: <) {
    print(i)
}
