import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
var maze: [[String.Element]] = []
var fire = Array(repeating: Array(repeating: -1, count: input[1]), count: input[0])
var person = Array(repeating: Array(repeating: -1, count: input[1]), count: input[0])
var fireQueue: [[Int]] = []
var personQueue: [[Int]] = []
var idx = 0
let dx = [1,0,-1,0]
let dy = [0,1,0,-1]
var minDay = 0
var check = false
for _ in 0..<input[0] {
    maze.append(readLine()!.map { $0 })
}
//초기세팅
for i in 0..<input[0] {
   for j in 0..<input[1] {
       if maze[i][j] == "F" {
           fire[i][j] = 0
           fireQueue.append([i,j])
       }
       if maze[i][j] == "J" {
           person[i][j] = 0
           personQueue.append([i,j])
       }
   }
}
//불이 어느 시간에 도착하는지 먼저 구하기
while idx < fireQueue.count {
    let current = fireQueue[idx]
    idx += 1
    for i in 0..<dx.count {
        let newX = current[0] + dx[i]
        let newY = current[1] + dy[i]
        if newX < 0 || newY < 0 || newX >= input[0] || newY >= input[1] {
            continue
        }
        if fire[newX][newY] == -1 && maze[newX][newY] != "#" {
            fire[newX][newY] = fire[current[0]][current[1]] + 1
            fireQueue.append([newX,newY])
        }
    }
}
idx = 0
//불보다 먼저 도착하는 경우만 생각
outer: while idx < personQueue.count {
    let current = personQueue[idx]
    idx += 1
    for i in 0..<dx.count {
        let newX = current[0] + dx[i]
        let newY = current[1] + dy[i]
        if newX < 0 || newY < 0 || newX >= input[0] || newY >= input[1] {
            //경계를 벗어난 것이므로 탈출한것임.
            check = true
            minDay = person[current[0]][current[1]] + 1
            break outer
        }
        if person[newX][newY] >= 0 || maze[newX][newY] == "#" {
            continue
        }
        if fire[newX][newY] != -1 && fire[newX][newY] <= person[current[0]][current[1]] + 1 {
            continue
        }
        person[newX][newY] = person[current[0]][current[1]] + 1
        personQueue.append([newX, newY])
    }
}
if check {
    print(minDay)
} else {
    print("IMPOSSIBLE")
}
