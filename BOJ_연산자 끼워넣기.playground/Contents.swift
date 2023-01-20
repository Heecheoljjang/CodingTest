import Foundation

//let n = Int(readLine()!)!
//let numbers = readLine()!.split(separator: " ").map { Int(String($0))! }
//var tempOper = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = 3
let numbers = [3,4,5]
var oper = [1,0,1,0]
var maxResult = -1000000000
var minResult = 1000000000
var temp = 0

func dfs(_ current: Int, _ depth: Int) {
    if depth == n {
        maxResult = max(maxResult, current)
        minResult = min(minResult, current)
        return
    }
    for i in 0...3 {
        if oper[i] != 0 {
            oper[i] -= 1
            if i == 0 {
                dfs(current + numbers[depth], depth + 1)
            } else if i == 1 {
                dfs(current - numbers[depth], depth + 1)
            } else if i == 2 {
                dfs(current * numbers[depth], depth + 1)
            } else {
                dfs(current / numbers[depth], depth + 1)
            }
            oper[i] += 1
        }
    }
}
dfs(numbers[0],1)
print(minResult, maxResult)
