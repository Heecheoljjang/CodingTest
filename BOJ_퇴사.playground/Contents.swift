import Foundation

//let n = Int(readLine()!)!
//var data: [[Int]] = []
//for _ in 0..<n {
//    data.append(readLine()!.split(separator: " ").map { Int(String($0))! })
//}
let n = 10
let data = [[5,50],[4,40],[3,30],[2,20],[1,10],[1,10],[2,20],[3,30],[4,40],[5,50]]
var result = Array(repeating: 0, count: 80)
for i in stride(from: n, through: 1, by: -1) {
    if i + data[i - 1][0] > n + 1 {
        result[i] = result[i + 1]
    } else {
        result[i] = max(result[i + 1], result[i + data[i - 1][0]] + data[i - 1][1])
    }
}
print(result)
