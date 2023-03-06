import Foundation

let n = Int(readLine()!)!
var result = Array(repeating: 0, count: n + 1)
if n == 1 || n == 2 {
    print(1)
    exit(0)
}
result[1] = 1; result[2] = 1
for i in 3...n {
    result[i] = result[i - 1] + result[i - 2]
}
print(result[n])
