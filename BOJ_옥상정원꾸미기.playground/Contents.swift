import Foundation

//MARK: - 시간초과 O(n^2)
//let n = Int(readLine()!)!
//var result = Array(repeating: 0, count: n)
//var stack: [Int] = []
//var buildings: [Int] = []
//
//for i in 0..<n {
//    let height = Int(readLine()!)!
//    buildings.append(height)
//    while !stack.isEmpty && buildings[stack.last!] < buildings[i] {
//        stack.removeLast()
//    }
//    for idx in stack {
//        result[idx] += 1
//    }
//    stack.append(i)
//}
//print(result.reduce(0) { $0 + $1 })

let n = Int(readLine()!)!
var result = 0
var stack: [Int] = []
var buildings: [Int] = []

for i in 0..<n {
    buildings.append(Int(readLine()!)!)
    while !stack.isEmpty && buildings[stack.last!] < buildings[i] {
        stack.removeLast()
    }
    result += stack.count
    stack.append(i)
}
print(result)
