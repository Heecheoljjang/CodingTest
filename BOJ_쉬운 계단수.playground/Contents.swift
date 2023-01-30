import Foundation

//let n = Int(readLine()!)!
let n = 1
var result = Array(repeating: Array(repeating: 0, count: 10), count: n + 1)
for i in 1...9 {
    result[1][i] = 1
}
for i in 2...n {
    for j in 0...9 {
        if j == 0 {
            result[i][j] = result[i - 1][j + 1] % 1000000000
        } else if j == 9 {
            result[i][j] = result[i - 1][j - 1] % 1000000000
        } else {
            result[i][j] = result[i - 1][j - 1] % 1000000000 + result[i - 1][j + 1] % 1000000000
        }
    }
}
print(result[n].reduce(0) { $0 + $1 } % 1000000000)
