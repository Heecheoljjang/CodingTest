import Foundation

let n = Int(readLine()!)!
if n == 1 {
    print(0)
    exit(0)
}
var result = Array(repeating: 0, count: n + 1)
result[1] = 0
for i in 2...n {
    result[i] = result[i - 1] + 1
    if i % 2 == 0 {
        result[i] = min(result[i], result[i / 2] + 1)
    }
    if i % 3 == 0 {
        result[i] = min(result[i], result[i / 3] + 1)
    }
}
print(result[n])
