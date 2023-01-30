import Foundation

//let n = Int(readLine()!)!
//let numbers = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = 10
//let numbers = [-1,-2,-3,-4,-5]
let numbers = [2,1,-4,3,4,-4,6,5,-5,1]
var maxValue = numbers.max()!
var cache = numbers[0]
var result = maxValue
for i in 1..<n {
    if cache + numbers[i] < 0 {
        cache = maxValue < 0 ? maxValue : 0
    } else {
        cache += numbers[i]
    }
    result = max(result,cache)
}
print(result)
