import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
var maze: [[Int]] = []
for _ in 0..<input[0] {
    maze.append(readLine()!.map { Int(String($0))! })
}
let dx = [1, 0, -1, 0]
let dy = [0, 1, 0, -1]
var left: [[Int]] = []
var right: [[Int]] = []
var count = 0
left.append([0,0])
while !left.isEmpty || !right.isEmpty {
    var current: [Int] = []
    if right.isEmpty {
        right = left.reversed()
        left.removeAll()
    }
    current = right.removeLast()
    for i in 0..<dx.count {
        let newX = current[0] + dx[i]
        let newY = current[1] + dy[i]
        if newX < 0 || newY < 0 || newX >= input[0] || newY >= input[1] {
            continue
        }
        if maze[newX][newY] == 1 {
            maze[newX][newY] = maze[current[0]][current[1]] + 1
            left.append([newX,newY])
        }
    }
}
print(maze[input[0] - 1][input[1] - 1])
