import Foundation

//let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let input = [5,7,3]
let m = input[0]
let n = input[1]
let k = input[2]
let dx = [1,0,-1,0]
let dy = [0,1,0,-1]
let temp = [[0,2,4,4],[1,1,2,5],[4,0,6,2]]
var paper = Array(repeating: Array(repeating: 0, count: n), count: m)
var queue: [[Int]] = []
var count = 0
var result: [Int] = []
for a in 0..<k {
//    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let input = temp[a]
    for i in input[1]..<input[3] {
        for j in input[0]..<input[2] {
            paper[i][j] = 1
        }
    }
}
for i in 0..<m {
    for j in 0..<n {
        if paper[i][j] == 0 {
            queue.append([i,j])
            paper[i][j] = 1
            count += 1
            var area = 0
            while !queue.isEmpty {
                area += 1
                let current = queue.removeFirst()
                for k in 0..<dx.count {
                    let newX = current[0] + dx[k]
                    let newY = current[1] + dy[k]
                    if newX < 0 || newY < 0 || newX >= m || newY >= n {
                        continue
                    }
                    if paper[newX][newY] == 0 {
                        paper[newX][newY] = 1
                        queue.append([newX,newY])
                    }
                }
            }
            result.append(area)
        }
    }
}
print(count)
print(result.sorted(by:<).map { String($0) }.joined(separator: " "))
