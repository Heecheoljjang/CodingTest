import Foundation

let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
var board: [[Int]] = []
var queue: [(Int,Int,Int)] = [] //x,y,종류
for i in 0..<input[0] {
    let temp = readLine()!.split(separator: " ").map{ Int(String($0))! }
    for j in 0..<temp.count {
        if temp[j] != 0 {
            queue.append((i,j,temp[j]))
        }
    }
    board.append(temp)
}
let sInput = readLine()!.split(separator: " ").map{ Int(String($0))! }
let d = [(1,0),(0,1),(-1,0),(0,-1)]
let target = (sInput[1]-1,sInput[2]-1)
var time = 0
queue.sort{ $0.2 < $1.2 }
while time < sInput[0] {
    var tempQueue: [(Int,Int,Int)] = []
    while !queue.isEmpty {
        let cur = queue.removeFirst()
        for i in 0..<4 {
            let new = (cur.0+d[i].0,cur.1+d[i].1,cur.2)
            if new.0 < 0 || new.1 < 0 || new.0 >= input[0] || new.1 >= input[0] {
                continue
            }
            if board[new.0][new.1] != 0 {
                continue
            }
            tempQueue.append(new)
            board[new.0][new.1] = new.2
        }
    }
    time += 1
    queue = tempQueue
}
print(board[target.0][target.1])
