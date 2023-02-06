import Foundation

//let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let input = [8,9]
let n = input[0]; let m = input[1]
//var cheese: [[Int]] = []
//for _ in 0..<n {
//    cheese.append(readLine()!.split(separator: " ").map { Int(String($0))! })
//}
var cheese = [[0,0,0,0,0,0,0,0,0],
              [0,0,0,0,0,0,0,0,0],
              [0,1,1,0,0,0,1,1,0],
              [0,1,0,1,1,1,0,1,0],
              [0,1,0,0,1,0,0,1,0],
              [0,1,0,1,1,1,0,1,0],
              [0,1,1,0,0,0,1,1,0],
              [0,0,0,0,0,0,0,0,0]]
let dx = [1,0,-1,0]
let dy = [0,1,0,-1]
var result = 0
while true {
    var queue = [[0,0]]
    var visited = Array(repeating: Array(repeating: -1, count: m), count: n)
    visited[0][0] = 0
    var idx = 0
    var check = false
    while idx < queue.count {
        let current = queue[idx]
        idx += 1
        for i in 0..<dx.count {
            let newX = current[0] + dx[i]
            let newY = current[1] + dy[i]
            if newX < 0 || newY < 0 || newX >= n || newY >= m {
                continue
            }
            if visited[newX][newY] == -1 {
                if cheese[newX][newY] == 0 {
                    visited[newX][newY] = 0
                    queue.append([newX,newY])
                } else {
                    visited[newX][newY] = 1
                }
            } else {
                if cheese[newX][newY] == 1 {
                    visited[newX][newY] += 1
                }
            }
        }
    }
    for i in 0..<n {
        for j in 0..<m {
            if visited[i][j] >= 2 {
                cheese[i][j] = 0
                check = true
            }
        }
    }
    if !check {
        print(result)
        break
    }
    result += 1
}
