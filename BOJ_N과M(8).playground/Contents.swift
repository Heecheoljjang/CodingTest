import Foundation
//
//let input = readLine()!.split(separator: " ").map { Int(String($0))! }
//let numbers = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted(by: <)

let input = [4,2]
let numbers = [1,7,8,9]
func dfs(_ current: String, _ depth: Int, _ num: Int) {
    if depth == input[1] {
        print(current)
        return
    }
    for i in num..<input[0] {
        dfs(current + "\(numbers[i]) ", depth + 1, i)
    }
}
dfs("",0,0)
