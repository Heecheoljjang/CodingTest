import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
var paper: [[String]] = []
for _ in 0..<input[0] {
    paper.append(readLine()!.split(separator: " ").map { String($0) })
}
var visited = Array(repeating: Array(repeating: false, count: input[1]),count: input[0])
var queue: [[Int]] = []
var maxArea = 0
var count = 0
let dx = [1,0,-1,0]
let dy = [0,1,0,-1]

for i in 0..<input[0] {
    for j in 0..<input[1] {
        if visited[i][j] || paper[i][j] == "0" {
            continue
        }
        //BFS
        queue.append([i,j])
        visited[i][j] = true
        count += 1
        var area = 0
        while !queue.isEmpty {
            let current = queue.removeFirst()
            area += 1
            for k in 0..<dx.count {
                let newX = current[0] + dx[k]
                let newY = current[1] + dy[k]
                if newX < 0 || newY < 0 || newX >= input[0] || newY >= input[1] {
                    continue
                }
                if visited[newX][newY] || paper[newX][newY] != "1" {
                    continue
                }
                queue.append([newX, newY])
                visited[newX][newY] = true
            }
        }
        maxArea = max(maxArea, area)
    }
}
print(count, maxArea)
