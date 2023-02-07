import Foundation

//let k = Int(readLine()!)!
let k = 2
//for _ in 0..<k {
//    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let input = [3,3]
let temp = [[1,2],[2,3],[1,3]]
    let v = input[0]; let e = input[1]
    var lines: [Int: [Int]] = [:]
    var count = 0
    var visited = Array(repeating: false, count: v + 1)
    var queue: [[Int]] = []
var left: [Int] = []
var right: [Int] = []
    for i in 0..<e {
//        let line = readLine()!.split(separator: " ").map { Int(String($0))! }
        let line = temp[i]
//        lines[line[0]]!.append(line[1])
        if lines[line[0]] == nil {
            lines[line[0]] = [line[1]]
        } else {
            lines[line[0]]!.append(line[1])
        }
    }
print(lines)
outer: for i in 1...v {
        if visited[i] {
            continue
        }
        queue = [[i,0]]
        visited[i] = true
        while !queue.isEmpty {
            let cur = queue.removeFirst()
            if cur[1] % 2 == 0 {
                left.append(cur[0])
            } else {
                right.append(cur[0])
            }
            print(left,right)
            if lines[cur[0]] == nil {
                continue
            }
            for j in 0..<lines[cur[0]]!.count {
                if !visited[lines[cur[0]]![j]] {
                    queue.append([lines[cur[0]]![j],cur[1] + 1])
                    visited[lines[cur[0]]![j]] = true
                } else {
                    //방문했다면 나랑 같은 집합에있는지 확인
                    if cur[1] % 2 == 0 {
                        if left.contains(lines[cur[0]]![j]) {
                            print("NO")
//                            continue outer
                            break outer
                            
                        }
                    } else {
                        if right.contains(lines[cur[0]]![j]) {
                            print("No")
//                            continue outer
                            break outer
                        }
                    }
                }
            }
        }
    }
    print("YES")
//}
