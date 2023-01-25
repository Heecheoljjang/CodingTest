import Foundation

//let k = Int(readLine()!)!
//let input = readLine()!.split(separator: " ").map { Int(Strin($0))! }
//var board: [[Int]] = []
//for _ in 0..<input[1] {
//    board.append(readLine()!.split(separator: " ").map { Int(String($0))! })
//}
let k = 1
let input = [4,4]
let board = [[0,0,0,0],
             [1,0,0,0],
             [0,0,1,0],
             [0,1,0,0]]
var check = Array(repeating: Array(repeating: Array(repeating: -1, count: k + 1), count: input[0]), count: input[1])
var queue = [[0,0,0]] // x, y, 횟수
var idx = 0
let dx = [1,0,-1,0]
let dy = [0,1,0,-1]
let jumpX = [1,2,2,1,-1,-2,-2,-1]
let jumpY = [2,1,-1,-2,-2,-1,1,2]
//for i in 0...k {
//    check[0][0][i] = 0
//}
check[0][0][0] = 0
outer: while idx < queue.count {
    let current = queue[idx]
    if current[0] == input[1] - 1 && current[1] == input[0] - 1 {
        print(check[current[0]][current[1]][current[2]])
        exit(0)
    }
    idx += 1
    for i in 0..<dx.count {
        let newX = current[0] + dx[i]
        let newY = current[1] + dy[i]
        if newX < 0 || newY < 0 || newX >= input[1] || newY >= input[0] {
            continue
        }
        if board[newX][newY] == 1 {
            continue
        }
        if check[newX][newY][current[2]] > check[current[0]][current[1]][current[2]] + 1 {
            check[newX][newY][current[2]] = check[current[0]][current[1]][current[2]] + 1
            queue.append([newX,newY,current[2]])
            continue
        }
    }
    for i in 0..<jumpX.count {
        let newX = current[0] + jumpX[i]
        let newY = current[1] + jumpY[i]
        let newJ = current[2] + 1
        if newJ > k {
            continue outer
        }
        if newX < 0 || newY < 0 || newX >= input[1] || newY >= input[0] {
            continue
        }
        if board[newX][newY] == 1 {
            continue
        }
        if check[newX][newY][newJ] != -1 {
            if check[newX][newY][newJ] > check[current[0]][current[1]][current[2]] + 1 {
                check[newX][newY][newJ] = check[current[0]][current[1]][current[2]] + 1
                queue.append([newX,newY,newJ])
            }
        } else {
            check[newX][newY][newJ] = check[current[0]][current[1]][current[2]] + 1
            queue.append([newX,newY,newJ])
        }
    }
}
print(-1)
