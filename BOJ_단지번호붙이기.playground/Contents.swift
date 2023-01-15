import Foundation

//let n = Int(readLine()!)!
let n = 7
//var house: [[Int]] = []
var house = [[0,1,1,0,1,0,0],
             [0,1,1,0,1,0,1],
             [1,1,1,0,1,0,1],
             [0,0,0,0,1,1,1],
             [0,1,0,0,0,0,0],
             [0,1,1,1,1,1,0],
             [0,1,1,1,0,0,0]]
let dx = [1,0,-1,0]
let dy = [0,1,0,-1]
var queue: [[Int]] = []
var count = 0
var result: [Int] = []
//for _ in 0..<n {
//    house.append(readLine()!.map { Int(String($0))! })
//}
for i in 0..<n {
    for j in 0..<n {
        if house[i][j] == 1 {
            house[i][j] = 0
            queue.append([i,j])
            count += 1
            var area = 0
            while !queue.isEmpty {
                let current = queue.removeFirst()
                area += 1
                for k in 0..<dx.count {
                    let newX = current[0] + dx[k]
                    let newY = current[1] + dy[k]
                    if newX < 0 || newY < 0 || newX >= n || newY >= n {
                        continue
                    }
                    if house[newX][newY] == 0 {
                        continue
                    }
                    queue.append([newX,newY])
                    house[newX][newY] = 0
                }
            }
            result.append(area)
        }
    }
}
print(count)
for area in result.sorted(by: <) {
    print(area)
}
