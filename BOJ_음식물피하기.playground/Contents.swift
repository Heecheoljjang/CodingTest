import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0]; let m = input[1]; let k = input[2]
var result = 0
let dx = [1,0,-1,0]; let dy = [0,1,0,-1]
var trash: [[Int]] = []
for _ in 0..<k {
    trash.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}
var board = Array(repeating: Array(repeating: 0, count: m), count: n)
for point in trash {
    board[point[0] - 1][point[1] - 1] = 1
}
for i in 0..<n {
    for j in 0..<m {
        if board[i][j] == 1 {
            var temp = 1
            board[i][j] = 0
            var queue = [(i,j)]
            while !queue.isEmpty {
                let cur = queue.removeFirst()
                for k in 0..<dx.count {
                    let newX = cur.0 + dx[k]
                    let newY = cur.1 + dy[k]
                    if newX < 0 || newY < 0 || newX >= n || newY >= m {
                        continue
                    }
                    if board[newX][newY] == 1 {
                        queue.append((newX,newY))
                        board[newX][newY] = 0
                        temp += 1
                    }
                }
            }
            result = max(result,temp)
        }
    }
}
print(result)
