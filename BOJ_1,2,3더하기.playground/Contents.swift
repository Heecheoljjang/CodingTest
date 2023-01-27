import Foundation

let t = Int(readLine()!)!
var result = Array(repeating: 0, count: 12)
result[1] = 1
result[2] = 2
result[3] = 4
for _ in 0..<t {
    let n = Int(readLine()!)!
    if n <= 3 {
        print(result[n])
        continue
    }
    for i in 4...n {
        if result[i] == 0 {
            result[i] = result[i - 1] + result[i - 2] + result[i - 3]
        }
    }
    print(result[n])
}
