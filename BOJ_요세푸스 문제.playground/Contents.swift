import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
var numbers = Array(1...input[0])
var result: [Int] = []
var idx = input[1] - 1

while true {
    result.append(numbers.remove(at: idx))
    if numbers.isEmpty {
        break
    }
    idx = (idx + input[1] - 1) % numbers.count
}
print("<\(result.map { String($0) }.joined(separator: ", "))>")

//let input = readLine()!.split(separator: " ").map { Int(String($0))! }
//var queue: [Int] = []
//var result: [Int] = []
//
//for i in 1...input[0] {
//    queue.append(i)
//}
//while result.count != input[0] {
//    for _ in 0..<input[1]-1 {
//        queue.append(queue.removeFirst())
//    }
//    result.append(queue.removeFirst())
//}
//print("<\(result.map { String($0) }.joined(separator: ", "))>")
