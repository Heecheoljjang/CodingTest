import Foundation

let n = Int(readLine()!)!
var glass: [Int] = []
for _ in 0..<n {
    glass.append(Int(readLine()!)!)
}
var result = Array(repeating: Array(repeating: 0, count: 3), count: n + 1)
for i in 1...n {
    result[i][0] = max(result[i - 1][1], result[i - 1][2])
    result[i][1] = i == 1 ? glass[i - 1] : result[i - 2].max()! + glass[i - 1]
    result[i][2] = result[i - 1][1] + glass[i - 1]
}
print(result[n].max()!)
