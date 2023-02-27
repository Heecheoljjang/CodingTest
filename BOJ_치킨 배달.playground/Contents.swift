import Foundation

//let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let input = [5,1]
let n = input[0]; let m = input[1]
let dx = [1,0,-1,0]
let dy = [0,1,0,-1]
//var city: [[Int]] = []
//for _ in 0..<n {
//    city.append(readLine()!.split(separator: " ").map { Int(String($0))! })
//}
//var city = [[0,2,0,1,0],[1,0,1,0,0],[0,0,0,0,0],[2,0,0,1,1],[2,2,0,1,2]]
var city = [[1,2,0,2,1],[1,2,0,2,1],[1,2,0,2,1],[1,2,0,2,1],[1,2,0,2,1]]
var chicken: [[Int]] = []
var house: [[Int]] = []
var testCase: [[[Int]]] = [] //안부실것들
var result = 999999
for i in 0..<n {
    for j in 0..<n {
        if city[i][j] == 1 {
            house.append([i,j])
        } else if city[i][j] == 2 {
            chicken.append([i,j])
        }
    }
}
func dfs(_ arr: [[Int]], _ idx: Int) {
    if arr.count == m {
        testCase.append(arr)
    }
    for i in idx..<chicken.count {
        dfs(arr + [chicken[i]], i + 1)
    }
}
func getDis(_ first: [Int], _ second: [Int]) -> Int {
    return abs(first[0] - second[0]) + abs(first[1] - second[1])
}
dfs([],0)
for i in 0..<testCase.count {
    print("chicken \(testCase[i])")
    var tempResult = 0
    for j in 0..<house.count {
        print("house \(house[j])")
        print("현재 \(tempResult)")
        var temp: [Int] = []
        for k in 0..<testCase[i].count {
            print("cur \(testCase[i][k])")
            temp.append(getDis(house[j], testCase[i][k]))
        }
        print(temp)
        tempResult += temp.min()!
    }
    result = min(result, tempResult)
}
print(result)

//    for j in 0..<n {
//        for k in 0..<n {
//            if tempCity[j][k] == 1 {
//                var queue = [[j,k]]
//                var visited = Array(repeating: Array(repeating: -1, count: n), count: n)
//                visited[queue[0][0]][queue[0][1]] = 0
//                var idx = 0
//                while idx < queue.count {
//                    let cur = queue[idx]
//                    idx += 1
//                    if tempCity[cur[0]][cur[1]] == 2 && testCase[i].contains(cur) {
//                        tempResult += visited[cur[0]][cur[1]]
//                        break
//                    }
//                    for l in 0..<dx.count {
//                        let newX = cur[0] + dx[l]
//                        let newY = cur[1] + dy[l]
//                        if newX < 0 || newY < 0 || newX >= n || newY >= n {
//                            continue
//                        }
//                        if visited[newX][newY] != -1 {
//                            continue
//                        }
//                        queue.append([newX,newY])
//                        visited[newX][newY] = visited[cur[0]][cur[1]] + 1
//                    }
//                }
//            }
//        }
//    }
//    result = min(result,tempResult)
