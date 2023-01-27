import Foundation

//let n = Int(readLine()!)!
let n = 3
//var cost: [[Int]] = []
//for _ in 0..<n {
//    cost.append(readLine()!.split(separator: " ").map { Int(String($0))! })
//}
let cost = [[0],[1,100,100],[100,1,100],[100,100,1]]
var result = Array(repeating: Array(repeating: 0, count: 3), count: n + 1)
result[1][0] = cost[1][0]
result[1][1] = cost[1][1]
result[1][2] = cost[1][2]
for i in 2...n {
    result[i][0] = min(result[i - 1][1], result[i - 1][2]) + cost[i][0]
    result[i][1] = min(result[i - 1][2], result[i - 1][0]) + cost[i][1]
    result[i][2] = min(result[i - 1][0], result[i - 1][1]) + cost[i][2]
}
print(result[n].min()!)
