import Foundation

let n = Int(readLine()!)!
var queue: [String] = []

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { String($0) }
    if input[0] == "push" {
        queue.append(input[1])
    } else if input[0] == "pop" {
        queue.isEmpty ? print(-1) : print(queue.removeFirst())
    } else if input[0] == "size" {
        print(queue.count)
    } else if input[0] == "empty" {
        queue.isEmpty ? print(1) : print(0)
    } else if input[0] == "front" {
        queue.isEmpty ? print(-1) : print(queue[0])
    } else {
        queue.isEmpty ? print(-1) : print(queue.last!)
    }
}
