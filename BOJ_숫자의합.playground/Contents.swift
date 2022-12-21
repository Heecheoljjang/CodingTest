import Foundation

let count = Int(readLine()!)!
let numbers = readLine()!.map { "\($0)" }
var temp: Int = 0
for i in 0..<numbers.count {
    temp += Int(numbers[i])!
}
print(temp)
