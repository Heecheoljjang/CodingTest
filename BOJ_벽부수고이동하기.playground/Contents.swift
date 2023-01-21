import Foundation

//var input: [Int] = []
//for _ in 0...1 {
//    input.append(file.readInt())
//}
var input = [4,4]
//var board: [[String.Element]] = []
var board = [["0","1","1","1"],
             ["1","1","1","1"],
             ["1","1","1","1"],
             ["1","1","1","0"]]
var result = Array(repeating: Array(repeating: Array(repeating: -1, count: 2), count: input[1]), count: input[0])
let dx = [1,0,-1,0]
let dy = [0,1,0,-1]
//for _ in 0..<input[0] {
//    board.append(file.readString().map { $0 })
//}
var queue: [[Int]] = []
var idx = 0
result[0][0][0] = 0
result[0][0][1] = 0
queue.append([0,0,0]) //좌표, 벽을 부셨는지
while idx < queue.count {
    let current = queue[idx]
    idx += 1
    if current[0] == input[0] - 1 && current[1] == input[1] - 1 {
        print(result[current[0]][current[1]][current[2]] + 1)
        exit(0)
    }
    for i in 0..<dx.count {
        let newX = current[0] + dx[i]
        let newY = current[1] + dy[i]
        let status = current[2] // 벽 부셨는지 안부셨는지
        if newX < 0 || newY < 0 || newX >= input[0] || newY >= input[1] {
            continue
        }
        if result[newX][newY][status] == -1 {
            if board[newX][newY] == "0" {
                //그냥 가면됨
                result[newX][newY][status] = result[current[0]][current[1]][status] + 1
                queue.append([newX,newY,status])
            } else {
                if status == 0 {
                    result[newX][newY][1] = result[current[0]][current[1]][status] + 1
                    queue.append([newX,newY,1])
                }
            }
        }
    }
}
print(-1)
