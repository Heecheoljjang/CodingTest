import Foundation

let n = Int(readLine()!)!
var score = [0]
for _ in 0..<n {
    score.append(Int(readLine()!)!)
}
var result = Array(repeating: Array(repeating: 0, count: 3), count: n + 2)
if n == 1 {
    print(score[1])
    exit(0)
}
result[1][1] = score[1]
result[2][1] = score[2]
result[2][2] = score[1] + score[2]

for i in 2...n {
    result[i][1] = max(result[i - 2][1], result[i - 2][2]) + score[i]
    result[i][2] = result[i - 1][1] + score[i]
}
print(max(result[n][1], result[n][2]))
