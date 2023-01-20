import Foundation

//var board: [[Int]] = []
var board = [[0,3,5,4,6,9,2,7,8],
             [7,8,2,1,0,5,6,0,9],
             [0,6,0,2,7,8,1,3,5],
             [3,2,1,0,4,6,8,9,7],
             [8,0,4,9,1,3,5,0,6],
             [5,9,6,8,2,0,4,1,3],
             [9,1,7,6,5,2,0,8,0],
             [6,0,3,7,0,1,9,5,2],
             [2,5,8,3,9,4,7,6,0]]
var horizon = Array(repeating: Array(repeating: false, count: 9), count: 9)
var vertical = Array(repeating: Array(repeating: false, count: 9), count: 9)
var block = Array(repeating: Array(repeating: false, count: 9), count: 9)
//for _ in 0..<9 {
//    board.append(readLine()!.split(separator: " ").map { Int(String($0))! })
//}

for i in 0..<9 {
    for j in 0..<9 {
        if board[i][j] != 0 {
            horizon[i][board[i][j] - 1] = true
            vertical[j][board[i][j] - 1] = true
            block[(i / 3) * 3 + j / 3][board[i][j] - 1] = true
        }
    }
}
func dfs(_ count: Int) {
    let idxI = count / 9
    let idxJ = count % 9
    if count == 81 {
        board.forEach {
            print($0.map { String($0) }.joined(separator: " "))
        }
        exit(0)
    }
    if board[idxI][idxJ] != 0 {
        dfs(count + 1)
    } else {
        for i in 1...9 {
            if !horizon[idxI][i - 1] && !vertical[idxJ][i - 1] && !block[(idxI / 3) * 3 + idxJ / 3][i - 1] {
                horizon[idxI][i - 1] = true
                vertical[idxJ][i - 1] = true
                block[(idxI / 3) * 3 + idxJ / 3][i - 1] = true
                board[idxI][idxJ] = i
                dfs(count + 1)
                horizon[idxI][i - 1] = false
                vertical[idxJ][i - 1] = false
                block[(idxI / 3) * 3 + idxJ / 3][i - 1] = false
                board[idxI][idxJ] = 0
            }
        }
    }
}
dfs(0)
