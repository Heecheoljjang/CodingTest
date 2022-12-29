import Foundation

let input = readLine()!.components(separatedBy: " ")
let n = Int(input[0])!
let k = Int(input[1])!
var result = Array(repeating: [0,0], count: 6)
var count = 0

for _ in 0..<n {
    let input = readLine()!.components(separatedBy: " ").map { String($0) }
    result[Int(input[1])!-1][Int(input[0])!] += 1
}
for i in 0..<result.count {
    for j in 0...1 {
        if result[i][j] % k == 0 {
            count += result[i][j] / k
        } else {
            count += (result[i][j] / k) + 1
        }
    }
}
print(count)
