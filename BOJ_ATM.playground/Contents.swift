import Foundation

let n = Int(readLine()!)!
var numbers = readLine()!.split(separator: " ").map { Int(String($0))! }
numbers.sort(by: { $0 < $1 })
var result = 0
var temp = 0
for num in numbers {
    result += temp + num
    temp += num
}
print(result)
