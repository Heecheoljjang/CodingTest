import Foundation

let n = Int(readLine()!)!
let numbers = readLine()!.components(separatedBy: " ").map { Int(String($0))! }.sorted(by: <)
let x = Int(readLine()!)!

var start = 0
var end = n - 1
var result = 0
while start < end {
    let sum = numbers[start] + numbers[end]
    if sum == x {
        result += 1
        start += 1
        end -= 1
    } else if sum > x {
        end -= 1
    } else {
        start += 1
    }
}
print(result)
