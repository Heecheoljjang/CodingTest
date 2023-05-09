import Foundation

let first = readLine()!.map{ String($0) }
let second = readLine()!.map{ String($0) }
var check = Array(repeating: Array(repeating: 0, count: second.count+1), count: first.count+1)
for i in 1...first.count {
    for j in 1...second.count {
        if first[i-1] == second[j-1] {
            check[i][j] = check[i-1][j-1] + 1
        } else {
            check[i][j] = max(check[i-1][j],check[i][j-1])
        }
    }
}
print(check[first.count][second.count])
