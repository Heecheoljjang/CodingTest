import Foundation

//let n = Int(readLine()!)!
let n = 7
//var region: [[Int]] = []
var region = [[9,9,9,9,9,9,9],
              [9,2,1,2,1,2,9],
              [9,1,8,7,8,1,9],
              [9,2,7,9,7,2,9],
              [9,1,8,7,8,1,9],
              [9,2,1,2,1,2,9],
              [9,9,9,9,9,9,9]]
var result = 1
//var height: [Int] = []
var height = [9,2,1,7,8]
let dx = [1,0,-1,0]
let dy = [0,1,0,-1]
//for _ in 0..<n {
//    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
//    region.append(input)
//    height += input
//}
//중복제거
height = Array(Set(height))
//높이별로 다 확인해야할듯
for cur in height {
    var queue: [[Int]] = []
    var visited = Array(repeating: Array(repeating: false, count: n), count: n)
    var count = 0
    for i in 0..<n {
        for j in 0..<n {
            if !visited[i][j] && region[i][j] >= cur {
                queue.append([i,j])
                visited[i][j] = true
                count += 1
                while !queue.isEmpty {
                    let current = queue.removeFirst()
                    for k in 0..<dx.count {
                        let newX = current[0] + dx[k]
                        let newY = current[1] + dy[k]
                        if newX < 0 || newY < 0 || newX >= n || newY >= n {
                            continue
                        }
                        if visited[newX][newY] || region[newX][newY] < cur {
                            continue
                        }
                        queue.append([newX,newY])
                        visited[newX][newY] = true
                    }
                }
            }
        }
    }
    result = max(result,count)
}
print(result)
