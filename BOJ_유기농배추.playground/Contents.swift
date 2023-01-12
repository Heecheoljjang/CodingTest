import Foundation

let caseCount = Int(readLine()!)!
let dx = [1,0,-1,0]
let dy = [0,1,0,-1]
for _ in 0..<caseCount {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    var ground = Array(repeating: Array(repeating: 0, count: input[1]), count: input[0])
    var visited = Array(repeating: Array(repeating: 0, count: input[1]), count: input[0])
    var count = 0
    var queue: [[Int]] = []
    for _ in 0..<input[2] {
        let position = readLine()!.split(separator: " ").map { Int(String($0))! }
        ground[position[0]][position[1]] = 1
    }
    for i in 0..<input[0] {
        for j in 0..<input[1] {
            if ground[i][j] == 0 || visited[i][j] == 1 {
                continue
            }
            queue.append([i,j])
            visited[i][j] = 1
            count += 1
            var idx = 0
            while idx < queue.count {
                let current = queue[idx]
                idx += 1
                for k in 0..<dx.count {
                    let newX = current[0] + dx[k]
                    let newY = current[1] + dy[k]
                    if newX < 0 || newY < 0 || newX >= input[0] || newY >= input[1] {
                        continue
                    }
                    if ground[newX][newY] == 0 || visited[newX][newY] == 1 {
                        continue
                    }
                    queue.append([newX,newY])
                    visited[newX][newY] = 1
                }
            }
        }
    }
    print(count)
}
