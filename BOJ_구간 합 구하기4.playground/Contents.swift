import Foundation

//let input = readLine()!.split(separator: " ").map { Int(String($0))! }
//let n = input[0]
//let m = input[1]
//let numbers = readLine()!.split(separator: " ").map { Int(String($0))! }
let input = [5,3]
let m = input[1]
let numbers = [5,4,3,2,1]
let temp = [[1,3],[2,4],[5,5]]
var result = Array(repeating: 0, count: numbers.count + 1)
for i in 1...numbers.count {
    result[i] = result[i - 1] + numbers[i - 1]
}
print(result)
for i in 0..<m {
//    let section = readLine()!.split(separator: " ").map { Int(String($0))! }
    let section = temp[i]
    print(result[section[1]] - result[section[0] - 1])
}
