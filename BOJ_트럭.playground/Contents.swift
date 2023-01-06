import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
var trucks = readLine()!.split(separator: " ").map { Int(String($0))! }
var queue: [Int] = []
var end: [Int] = []
var time = 0
while !trucks.isEmpty {
    if queue.reduce(0) { $0 + $1 } + trucks[0] <= input[2] && queue.count < input[1] {
        queue.append(trucks.removeFirst())
        end.append(time + input[1])
    }
    time += 1
    if end[0] == time {
        queue.removeFirst()
        end.removeFirst()
    }
}
print(time + input[1])
