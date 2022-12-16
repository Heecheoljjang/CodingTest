import Foundation

//let n = Int(readLine()!)!
let n = 500

var result: [Int] = []
var count = 666

while result.count < n {
    if "\(count)".contains("666") {
        result.append(count)
    }
    count += 1
}
print(result[n-1])
