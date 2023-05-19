import Foundation

let n = Int(readLine()!)!
var price:[Int] = readLine()!.split(separator: " ").map{ Int(String($0))! }
var result = Array(repeating: 0, count: n+1)
for i in 1...n {
    for j in 1...i {
        result[i] = max(result[i],result[i-j]+price[j-1])
    }
}
print(result[n])
