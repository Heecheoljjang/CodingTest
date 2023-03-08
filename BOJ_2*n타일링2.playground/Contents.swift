import Foundation

let n = Int(readLine()!)!
var result = Array(repeating: 0, count: n + 1)
if n == 1 {
    print(1)
} else if n == 2 {
    print(3)
} else {
    result[1] = 1; result[2] = 3
    if n <= 2 {
        print(result[n])
        exit(0)
    }
    for i in 3...n {
        result[i] = (result[i - 1] + 2 * result[i - 2]) % 10007
    }
    print(result[n])
}
