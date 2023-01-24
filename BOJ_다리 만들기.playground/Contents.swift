import Foundation

let n = Int(readLine()!)!
var country: [[Int]] = []
for _ in 0..<n {
    country.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}
let dx = [1,0,-1,0]
let dy = [0,1,0,-1]
var result = 9999999
var queue: [[Int]] = []
var map = Array(repeating: Array(repeating: -1, count: n), count: n)
var visited = Array(repeating: Array(repeating: false, count: n), count: n)
for i in 0..<n {
    for j in 0..<n {
        if country[i][j] == 1 && !visited[i][j] {
            map = Array(repeating: Array(repeating: -1, count: n), count: n)
            map[i][j] = 0
            visited[i][j] = true
            queue = [[i,j]]
            var tempIsland: [[Int]] = []
            while !queue.isEmpty {
                let current = queue.removeFirst()
                for k in 0..<dx.count {
                    let newX = current[0] + dx[k]
                    let newY = current[1] + dy[k]
                    if newX < 0 || newY < 0 || newX >= n || newY >= n {
                        continue
                    }
                    if country[newX][newY] == 0 && !visited[newX][newY] {
                        tempIsland.append([current[0],current[1]])
                        continue
                    }
                    if !visited[newX][newY] && country[newX][newY] == 1 {
                        visited[newX][newY] = true
                        map[newX][newY] = 0
                        queue.append([newX,newY])
                    }
                }
            }
            tempIsland = Array(Set(tempIsland))
        secondOuter: for start in tempIsland {
            queue = [start]
            var tempMap = map
            while !queue.isEmpty {
                let current = queue.removeFirst()
                for k in 0..<dx.count {
                    let newX = current[0] + dx[k]
                    let newY = current[1] + dy[k]
                    if newX < 0 || newY < 0 || newX >= n || newY >= n {
                        continue
                    }
                    if tempMap[newX][newY] == -1 && country[newX][newY] == 0 {
                        queue.append([newX,newY])
                        tempMap[newX][newY] = tempMap[current[0]][current[1]] + 1
                        continue
                    }
                    if tempMap[newX][newY] == -1 && country[newX][newY] == 1 {
                        result = min(result,tempMap[current[0]][current[1]])
                        continue secondOuter
                    }
                }
            }
        }
        }
    }
}
print(result)
