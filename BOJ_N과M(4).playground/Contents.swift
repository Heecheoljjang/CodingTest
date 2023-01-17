import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }

func dfs(_ current: String, _ depth: Int, _ num: Int) {
    if depth == input[1] {
        print(current)
        return
    }
    for i in num...input[0] {
        dfs(current + "\(i) ", depth + 1, i)
    }
}
dfs("",0,1)
