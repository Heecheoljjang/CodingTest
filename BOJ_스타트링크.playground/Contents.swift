import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let f = input[0]
let s = input[1]
let g = input[2]
let u = input[3]
let d = input[4]

let dy = [u,-d]
var floor = Array(repeating: -1, count: f + 1)
var queue: [Int] = []

queue.append(s)
floor[s] = 0

while !queue.isEmpty {
    let current = queue.removeFirst()
    for i in 0..<dy.count {
        let newS = current + dy[i]
        if newS < 1 || newS > f {
            continue
        }
        if floor[newS] == -1 {
            queue.append(newS)
            floor[newS] = floor[current] + 1
        }
        if newS == g {
            break
        }
    }
}
floor[g] == -1 ? print("use the stairs") : print(floor[g])
