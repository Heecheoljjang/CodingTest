import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let numbers = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted(by: <)

func dfs(_ current: String, _ depth: Int) {
    if depth == input[1] {
        print(current)
        return
    }
    for i in 0..<input[0] {
        dfs(current + "\(numbers[i]) ", depth + 1)
    }
}
dfs("",0)
