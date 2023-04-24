import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0]
let m = input[1]
var d = [(1,0),(0,1),(-1,0),(0,-1)]
var result = 0
var rest = 0
var ch: [[Int]] = []
for _ in 0..<n {
    ch.append(readLine()!.split(separator: " ").map{ Int(String($0))! })
}
while true {
    var removeCh: [(Int,Int)] = []
    var visited = Array(repeating:Array(repeating: 0, count: m), count: n)
    var queue = [(0,0)]
    visited[0][0] = 1
    while !queue.isEmpty {
        let cur = queue.removeFirst()
        for i in 0..<4 {
            let new = (cur.0+d[i].0,cur.1+d[i].1)
            if new.0 < 0 || new.1 < 0 || new.0 >= n || new.1 >= m {
                continue
            }
            if visited[new.0][new.1] == 1 {
                continue
            }
            if ch[new.0][new.1] == 0 {
                queue.append(new)
                visited[new.0][new.1] = 1
            } else {
                removeCh.append(new)
                visited[new.0][new.1] = 1
                ch[new.0][new.1] = 0
            }
        }
    }
    if removeCh.isEmpty {
        break
    } else {
        rest = removeCh.count
    }
    result += 1
}
print(result)
print(rest)
