import Foundation
let input = readLine()!.split(separator: " ").map { Int(String($0))! }
//var left: [[Int]] = []
//var right: [[Int]] = []
var queue: [[Int]] = []
var tomato: [[Int]] = []
let dx = [1,0,-1,0]
let dy = [0,1,0,-1]
var minDay = 1
for _ in 0..<input[1] {
    tomato.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}
//큐에 미리 넣어놓기
for i in 0..<input[1] {
    for j in 0..<input[0] {
        if tomato[i][j] == 1 {
//            left.append([i,j])
            queue.append([i,j])
        }
    }
}
//BFS
var idx = 0
while idx < queue.count {
    let current = queue[idx]
    idx += 1
    for i in 0..<dx.count {
        let newX = current[0] + dx[i]
        let newY = current[1] + dy[i]
        if newX < 0 || newY < 0 || newX >= input[1] || newY >= input[0] {
            continue
        }
        if tomato[newX][newY] == 0 {
            tomato[newX][newY] = tomato[current[0]][current[1]] + 1
            minDay = max(minDay, tomato[newX][newY])
            queue.append([newX,newY])
        }
    }
}
//while !left.isEmpty || !right.isEmpty {
//    if right.isEmpty {
//        right = left.reversed()
//        left.removeAll()
//    }
//    let current = right.removeLast()
//    for i in 0..<dx.count {
//        let newX = current[0] + dx[i]
//        let newY = current[1] + dy[i]
//        if newX < 0 || newY < 0 || newX >= input[1] || newY >= input[0] {
//            continue
//        }
//        if tomato[newX][newY] == 0 {
//            tomato[newX][newY] = tomato[current[0]][current[1]] + 1
//            minDay = max(minDay, tomato[newX][newY])
//            left.append([newX,newY])
//        }
//    }
//}
minDay -= 1
outer: for i in 0..<input[1] {
    for j in 0..<input[0] {
        if tomato[i][j] == 0 {
            minDay = -1
            break outer
        }
    }
}
print(minDay)
