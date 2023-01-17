import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let numbers = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted(by: <)

var check = [Bool](repeating: false, count: input[0])
func dfs(_ current: String, _ depth: Int) {
    if depth == input[1] {
        print(current)
        return
    }
    for i in 0..<numbers.count {
        if !check[i] {
            check[i] = true
            dfs(current + "\(numbers[i]) ", depth + 1)
            check[i] = false
        }
    }
}
dfs("",0)
