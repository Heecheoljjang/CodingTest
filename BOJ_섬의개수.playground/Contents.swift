import Foundation

let dx = [1,0,-1,0,1,1,-1,-1]
let dy = [0,1,0,-1,1,-1,1,-1]
while true {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    if input == [0,0] {
        break
    }
    let w = input[0]; let h = input[1]
    var board: [[Int]] = []
    var visited = Array(repeating: Array(repeating: false, count: w), count: h)
    for _ in 0..<h {
        board.append(readLine()!.split(separator: " ").map { Int(String($0))! })
    }
    var count = 0
    for i in 0..<h {
        for j in 0..<w {
            if board[i][j] == 1 && !visited[i][j]  {
                var queue = [[i,j]]
                count += 1
                while !queue.isEmpty {
                    let current = queue.removeFirst()
                    for k in 0..<dx.count {
                        let newX = current[0] + dx[k]
                        let newY = current[1] + dy[k]
                        if newX < 0 || newY < 0 || newX >= h || newY >= w {
                            continue
                        }
                        if visited[newX][newY] || board[newX][newY] == 0 {
                            continue
                        }
                        queue.append([newX,newY])
                        visited[newX][newY] = true
                    }
                }
            }
        }
    }
    print(count)
}
