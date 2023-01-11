import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
var queue: [[Int]] = []
let dx = [1,0,-1,0,0,0]
let dy = [0,1,0,-1,0,0]
let dz = [0,0,0,0,1,-1]
var tomato: [[[Int]]] = []
var minDay = 1
for i in 0..<input[2] {
    var temp: [[Int]] = []
    for j in 0..<input[1] {
        temp.append(readLine()!.split(separator: " ").map { Int(String($0))! })
    }
    tomato.append(temp)
}

//1인 토마토 큐에 넣기
for i in 0..<input[2] {
    for j in 0..<input[1] {
        for k in 0..<input[0] {
            if tomato[i][j][k] == 1 {
                queue.append([i,j,k]) //i가 높이, j가 행, k가 열
            }
        }
    }
}
//BFS
var idx = 0
while idx < queue.count {
    let current = queue[idx]
    idx += 1
    for i in 0..<dx.count {
        let newX = current[1] + dx[i] //행
        let newY = current[2] + dy[i] //열
        let newZ = current[0] + dz[i] //높이
        if newX < 0 || newY < 0 || newZ < 0 || newX >= input[1] || newY >= input[0] || newZ >= input[2] {
            continue
        }
        if tomato[newZ][newX][newY] == 0 {
            tomato[newZ][newX][newY] = tomato[current[0]][current[1]][current[2]] + 1
            minDay = max(minDay, tomato[newZ][newX][newY])
            queue.append([newZ,newX,newY])
        }
    }
}
minDay -= 1
for i in 0..<input[2] {
    for j in 0..<input[1] {
        for k in 0..<input[0] {
            if tomato[i][j][k] == 0 {
                minDay = -1
                break
            }
        }
    }
}
print(minDay)
