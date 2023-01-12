import Foundation

let n = Int(readLine()!)!
var paint: [[String]] = []
for _ in 0..<n {
    paint.append(readLine()!.map { String($0) })
}
var visited = Array(repeating: Array(repeating: 0, count: n), count: n)
var firstQueue: [[Int]] = []
var secondQueue: [[Int]] = []
let dx = [1,0,-1,0]
let dy = [0,1,0,-1]
var first = 0
var second = 0
for i in 0..<n {
    for j in 0..<n {
        if visited[i][j] == 0 {
            firstQueue.append([i,j])
            first += 1
            visited[i][j] = 1
            while !firstQueue.isEmpty {
                let current = firstQueue.removeFirst()
                for k in 0..<dx.count {
                    let newX = current[0] + dx[k]
                    let newY = current[1] + dy[k]
                    if newX < 0 || newY < 0 || newX >= n || newY >= n {
                        continue
                    }
                    if visited[newX][newY] == 1 {
                        continue
                    }
                    if paint[current[0]][current[1]] == paint[newX][newY] {
                        firstQueue.append([newX,newY])
                        visited[newX][newY] = 1
                    }
                }
            }
        }
    }
}
visited = Array(repeating: Array(repeating: 0, count: n), count: n)
for i in 0..<n {
    for j in 0..<n {
        if visited[i][j] == 0 {
            secondQueue.append([i,j])
            visited[i][j] = 1
            second += 1
            while !secondQueue.isEmpty {
                let current = secondQueue.removeFirst()
                for k in 0..<dx.count {
                    let newX = current[0] + dx[k]
                    let newY = current[1] + dy[k]
                    if newX < 0 || newY < 0 || newX >= n || newY >= n {
                        continue
                    }
                    if visited[newX][newY] == 1 {
                        continue
                    }
                    if paint[current[0]][current[1]] == "R" || paint[current[0]][current[1]] == "G" {
                        if paint[newX][newY] == "B" {
                            continue
                        }
                    } else {
                        if paint[newX][newY] != "B" {
                            continue
                        }
                    }
                    secondQueue.append([newX,newY])
                    visited[newX][newY] = 1
                }
            }
        }
    }
}
print("\(first) \(second)")
