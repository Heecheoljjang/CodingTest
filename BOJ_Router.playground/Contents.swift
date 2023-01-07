import Foundation

let n = Int(readLine()!)!
var leftQueue: [String] = []
var rightQueue: [String] = []

while true {
    let number = readLine()!
    if number == "-1" {
        break
    }
    if number == "0" {
        if rightQueue.isEmpty {
            rightQueue = leftQueue.reversed()
            leftQueue.removeAll()
        }
        rightQueue.removeLast()
    } else {
        if leftQueue.count + rightQueue.count != n {
            leftQueue.append(number)
        }
    }
}
let result = rightQueue.reversed() + leftQueue
print(result.joined(separator: " "))
