import Foundation

//let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let input = [4,2]
var numbers = Array(1...input[0])
var check = [Bool](repeating: false, count: input[0])
func dfs(_ arr: [Int], _ target: Int) {
    if arr.count == target {
        print(arr.map { String($0) }.joined(separator: " "))
        return
    }
    for i in 0..<input[0] {
        if !check[i] {
            check[i] = true
            dfs(arr + [numbers[i]], target)
            check[i] = false
        }
    }
}
dfs([],input[1])
