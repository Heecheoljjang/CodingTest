import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let depth = input[1]
func dfs(_ arr: [String], _ current: Int) {
    if arr.count == depth {
        print(arr.joined(separator: " "))
        return
    }
    if current > input[0] {
        return
    }
    for i in current...input[0] {
        dfs(arr + [String(i)], i + 1)
    }
}
dfs([], 1)
