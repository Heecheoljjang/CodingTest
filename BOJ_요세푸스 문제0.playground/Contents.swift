import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
var leftQueue = Array(1...input[0])
var rightQueue: [Int] = []
var result: [Int] = []
var count = 1
while !leftQueue.isEmpty {
    rightQueue = leftQueue.reversed()
    leftQueue.removeAll()
    if count == input[1] {
        result.append(rightQueue.removeLast())
        count = 0
    } else {
        leftQueue.append(rightQueue.removeLast())
    }
    leftQueue = rightQueue.reversed() + leftQueue
    rightQueue.removeAll()
    count += 1
}
print("<\(result.map { String($0) }.joined(separator: ", "))>")
