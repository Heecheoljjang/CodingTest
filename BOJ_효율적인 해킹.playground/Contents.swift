import Foundation
//라이노하기
//let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let input = [12,11]
let n = input[0]; let m = input[1]
var computers: [Int: [Int]] = [:]
var result = Array(repeating: 1, count: n + 1)
let aa = [[2,1],[3,2],[4,2],[5,1],[2,5],[6,7],[7,8],[8,9],[9,10],[10,11],[11,12]]
for i in 0..<m {
//    let line = readLine()!.split(separator: " ").map { Int(String($0))! }
    let line = aa[i]
    if computers[line[1]] == nil {
        computers[line[1]] = [line[0]]
    } else {
        computers[line[1]]!.append(line[0])
    }
}
for i in 1...n {
    if computers[i] == nil {
        continue
    }
    var visited = Array(repeating: false, count: n + 1)
    visited[i] = true
    var queue = computers[i]!
    while !queue.isEmpty {
        let current = queue.removeFirst()
        if computers[current] == nil || visited[current] {
            continue
        }
        result[i] += computers[current]!.count
        visited[current] = true
        queue += computers[current]!
    }
}
var temp = ""
for i in 1...n {
    if result[i] == result.max()! {
        temp += "\(i) "
    }
}
print(temp)
