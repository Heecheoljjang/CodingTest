import Foundation

//let n = Int(readLine()!)!
let n = 1000
var result = Array(repeating: 0, count: n + 1)
if n <= 2 {
    print(n)
    exit(0)
}
result[1] = 1
result[2] = 2
for i in 3...n {
    result[i] = (result[i - 1] + result[i - 2]) % 10007
}
print(result[n])
