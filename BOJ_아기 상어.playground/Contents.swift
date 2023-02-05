import Foundation

let n = Int(readLine()!)!
var space: [[Int]] = []
for _ in 0..<n {
    space.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}
var size = 2
var count = 0
var queue: [[Int]] = []
var result = 0
var visited = Array(repeating: Array(repeating: false, count: n), count: n)
let dx = [1,0,-1,0]
let dy = [0,1,0,-1]
outer: for i in 0..<n {
    for j in 0..<n {
        if space[i][j] == 9 {
            queue.append([i,j,0])
            visited[i][j] = true
            space[i][j] = 0
            break outer
        }
    }
}
while true {
    var fish: [[Int]] = []
    visited = Array(repeating: Array(repeating: false, count: n), count: n)
    var idx = 0
    while idx < queue.count {
        let current = queue[idx]
        idx += 1
        visited[current[0]][current[1]] = true
        for i in 0..<dx.count {
            let newX = current[0] + dx[i]
            let newY = current[1] + dy[i]
            if newX < 0 || newY < 0 || newX >= n || newY >= n {
                continue
            }
            if space[newX][newY] > size {
                continue
            }
            if !visited[newX][newY] {
                if space[newX][newY] == 0 || space[newX][newY] == size {
                    queue.append([newX,newY,current[2] + 1])
                } else {
                    fish.append([newX,newY,current[2] + 1])
                }
                visited[newX][newY] = true
            }
        }
    }
    if fish.isEmpty {
        print(result)
        break
    }
    fish = fish.sorted {
        if $0[2] == $1[2] {
            if $0[0] == $1[0] {
                return $0[1] < $1[1]
            }
            return $0[0] < $1[0]
        }
        return $0[2] < $1[2]
    }
    let eat = fish.first!
    count += 1
    if count == size {
        size += 1
        count = 0
    }
    space[eat[0]][eat[1]] = 0
    result = eat[2]
    queue.removeAll()
    queue.append(eat)
}

