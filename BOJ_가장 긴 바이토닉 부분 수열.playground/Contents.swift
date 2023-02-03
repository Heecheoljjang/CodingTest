import Foundation

//let n = Int(readLine()!)!
//let numbers = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = 10
let numbers = [1,5,2,1,4,3,4,5,2,1]
let reversedNum = Array(numbers.reversed())
var result = Array(repeating: 1, count: n)
var second = Array(repeating: 0, count: n)
for i in 0..<n {
    for j in 0..<i {
        if numbers[j] < numbers[i] {
            result[i] = max(result[i],result[j] + 1)
        }
        if reversedNum[j] < reversedNum[i] {
            second[n - 1 - i] = max(second[n - 1 - i],second[n - 1 - j] + 1)
        }
    }
}
for i in 0..<n {
    result[i] += second[i]
}
print(result.max()!)
