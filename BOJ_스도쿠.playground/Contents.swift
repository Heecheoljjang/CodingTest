import Foundation

var board: [[Int]] = []
var row = Array(repeating: Array(repeating: false, count: 9), count: 9)
var col = Array(repeating: Array(repeating: false, count: 9), count: 9)
var block = Array(repeating: Array(repeating: false, count: 9), count: 9)
for _ in 0..<9 {
    board.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

for i in 0..<9 {
    for j in 0..<9 {
        if board[i][j] != 0 {
            row[i][board[i][j] - 1] = true
            col[j][board[i][j] - 1] = true
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
        for i in 0..<9 {
            if !row[idxI][i] && !col[idxJ][i] && !block[(idxI / 3) * 3 + idxJ / 3][i] {
                row[idxI][i] = true
                col[idxJ][i] = true
                block[(idxI / 3) * 3 + idxJ / 3][i] = true
                board[idxI][idxJ] = i + 1
                dfs(count + 1)
                row[idxI][i] = false
                col[idxJ][i] = false
                block[(idxI / 3) * 3 + idxJ / 3][i] = false
                board[idxI][idxJ] = 0
            }
        }
    }
}
dfs(0)
