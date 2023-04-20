import Foundation

let first = readLine()!.map{ String($0) }
let second = readLine()!.map{ String($0) }
var result = Array(repeating: Array(repeating: 0, count: second.count), count: first.count)
var maxValue = 0
for i in 0..<first.count{
    for j in 0..<second.count{
        if first[i] == second[j]{
            if i - 1 >= 0 && j - 1 >= 0{
                result[i][j] = result[i-1][j-1] + 1
                maxValue = max(maxValue,result[i-1][j-1]+1)
            } else {
                result[i][j] = 1
            }
        }
    }
}
print(maxValue)
