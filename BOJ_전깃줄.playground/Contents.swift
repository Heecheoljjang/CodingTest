import Foundation

//let n = Int(readLine()!)!
//var lines: [[Int]] = []
//for _ in 0..<n {
//    lines.append(readLine()!.split(separator: " ").map { Int(String($0))! })
//}
let n = 8
var lines = [[1,8],[3,9],[2,2],[4,1],[6,4],[10,10],[9,7],[7,6]]
//let n = 2
//var lines = [[1,2],[4,1]]
lines = lines.sorted { $0[0] < $1[0] }
var arr = Array(repeating: 1, count: n + 1)
for i in 0..<n {
    for j in 0...i {
        if lines[i][1] > lines[j][1] {
            arr[i] = max(arr[i], arr[j] + 1)
        }
    }
}
print(n - arr.max()!)
