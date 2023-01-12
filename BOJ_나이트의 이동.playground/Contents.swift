import Foundation

let caseCount = Int(readLine()!)!
let dx = [1,2,2,1,-1,-2,-2,-1]
let dy = [2,1,-1,-2,-2,-1,1,2]
for _ in 0..<caseCount {
    let l = Int(readLine()!)!
    let start = readLine()!.split(separator: " ").map { Int(String($0))! }
    let target = readLine()!.split(separator: " ").map { Int(String($0))! }
    var queue:[[Int]] = []
    var chess = Array(repeating: Array(repeating: -1, count: l), count: l)
    chess[start[0]][start[1]] = 0
    var idx = 0
    queue.append(start)
    outer: while idx < queue.count {
        let current = queue[idx]
        if current == target {
            print(0)
            break
        }
        idx += 1
        for i in 0..<dx.count {
            let newX = current[0] + dx[i]
            let newY = current[1] + dy[i]
            if newX == target[0] && newY == target[1] {
                print(chess[current[0]][current[1]] + 1)
                break outer
            }
            if newX < 0 || newY < 0 || newX >= l || newY >= l {
                continue
            }
            if chess[newX][newY] != -1 {
                continue
            }
            chess[newX][newY] = chess[current[0]][current[1]] + 1
            queue.append([newX,newY])
        }
    }
}
