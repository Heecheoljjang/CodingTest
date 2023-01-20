import Foundation

//let n = Int(readLine()!)!
let n = 6
//var point: [[Int]] = []
var point = [[0,1,2,3,4,5],
             [1,0,2,3,4,5],
             [1,2,0,3,4,5],
             [1,2,3,0,4,5],
             [1,2,3,4,0,5],
             [1,2,3,4,5,0]]
var result = 9999999
var check = Array(repeating: false, count: n)
//for _ in 0..<n {
//    point.append(readLine()!.split(separator: " ").map { Int(String($0))! })
//}

func dfs(_ count: Int, _ idx: Int) {
    if count == n / 2 {
        //팀이 다 짜진 상태. check가 true인 팀과 false인 팀
        var temp = 0
        for i in 0..<n {
            for j in 0..<n {
                if check[i] && check[j] {
                    temp += point[i][j]
                } else if !check[i] && !check[j] {
                    temp -= point[i][j]
                }
            }
        }
        result = min(result, abs(temp))
        return
    }
    for i in idx..<n {
        if !check[i] {
            check[i] = true
            dfs(count + 1, i)
            check[i] = false
        }
    }
}
dfs(0,0)
print(result)

