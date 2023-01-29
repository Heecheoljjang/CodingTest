import Foundation

//let n = Int(readLine()!)!
let n = 2
if n <= 2 {
    print(n)
    exit(0)
}
var result = Array(repeating: 0, count: n + 1)
result[1] = 1
result[2] = 2
for i in 3...n {
    result[i] = (result[i - 1] + result[i - 2]) % 15746
}
print(result[n])
