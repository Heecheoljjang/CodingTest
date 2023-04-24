import Foundation

var board: [[String]] = []
for _ in 0..<12 {
    board.append(readLine()!.map{ String($0) })
}
let d = [(1,0),(0,1),(-1,0),(0,-1)]
var result = 0
while true {
    var totalRm: [(Int,Int)] = []
    var visited = Array(repeating: Array(repeating: 0, count: 6), count: 12)
    for i in 0..<12 {
        for j in 0..<6 {
            if board[i][j] != "." && visited[i][j] == 0 {
                var queue = [(i,j)]
                var rm = [(i,j)]
                visited[i][j] = 1
                let ch = board[i][j]
                while !queue.isEmpty {
                    let cur = queue.removeFirst()
                    for k in 0..<4 {
                        let new = (cur.0+d[k].0,cur.1+d[k].1)
                        if new.0 < 0 || new.1 < 0 || new.0 >= 12 || new.1 >= 6 {
                            continue
                        }
                        if board[new.0][new.1] != ch {
                            continue
                        }
                        if visited[new.0][new.1] == 1 {
                            continue
                        }
                        queue.append(new)
                        rm.append(new)
                        visited[new.0][new.1] = 1
                    }
                }
                if rm.count >= 4 {
                    totalRm.append(contentsOf: rm)
                }
            }
        }
    }
    if totalRm.isEmpty {
        break
    }
    result += 1
    for i in 0..<totalRm.count {
        board[totalRm[i].0][totalRm[i].1] = "."
    }
    for i in 0..<6 {
        var temp: [String] = []
        for j in 0..<12 {
            if board[j][i] != "." {
                temp.append(board[j][i])
                board[j][i] = "."
            }
        }
        if !temp.isEmpty {
            //시작위치
            let start = 12 - temp.count
            for j in start..<12 {
                board[j][i] = temp[abs(j+temp.count - 12)]
            }
        }
    }
}
print(result)
