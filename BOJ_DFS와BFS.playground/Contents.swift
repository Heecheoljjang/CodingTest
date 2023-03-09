import Foundation

//let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let input = [5,5,3]
let aa = [[5,4],[5,2],[1,2],[3,4],[3,1]]
let n = input[0]; let m = input[1]; let v = input[2]
var dic: [Int: [Int]] = [:]
var visited = Array(repeating: false, count: n + 1)
var result = ""

for i in 0..<m {
//    let line = readLine().split(separator: " ").map { Int(String($0))! }
    let line = aa[i]
    if dic[line[0]] == nil {
        dic[line[0]] = [line[1]]
    } else {
        dic[line[0]]! = (dic[line[0]]! + [line[1]]).sorted(by: <)
    }
    if dic[line[1]] == nil {
        dic[line[1]] = [line[0]]
    } else {
        dic[line[1]]! = (dic[line[1]]! + [line[0]]).sorted(by: <)
    }
}
func dfs(_ num: Int) {
    visited[num] = true
    result += "\(num) "
    if dic[num] != nil {
        for i in dic[num]! {
            if !visited[i] {
                dfs(i)
            }
        }
    }
}
func bfs() {
    var queue = [v]
    while !queue.isEmpty {
        let cur = queue.removeFirst()
        if visited[cur] {
            continue
        }
        visited[cur] = true
        result += "\(cur) "
        if dic[cur] != nil {
            for num in dic[cur]! {
                if !visited[num] {
                    queue.append(num)
                }
            }
        }
    }
}
dfs(v)
print(dic)
print(result)
visited = Array(repeating: false, count: n + 1)
result = ""
bfs()
print(result)

