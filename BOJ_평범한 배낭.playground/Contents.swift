import Foundation

//let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let input = [4,7]
let n = input[0]
let k = input[1]
//var items: [[Int]] = []
var result = Array(repeating: Array(repeating: 0, count: k + 1), count: n + 1)
//for _ in 0..<n {
//    items.append(readLine()!.split(separator: " ").map { Int(String($0))! })
//}
let items = [[6,13],[4,8],[3,6],[5,12]]
print(items)
//result[i][k] => i번째까지 확인할 때 무게가 k까지 들어갈 수 있음
/*
 result[0][1] = 0
 result[0][2] = 0
 result[0][3] = 0
 result[0][4] = 0
 result[0][5] = 0
 result[0][6] = 13
 result[0][7] = 13
 
 result[1][1] = 0
 result[1][2] = 0
 result[1][3] = 0
 result[1][4] = 4짜리를 넣거나 안넣을 수 있음. 넣는다면 8 + result[0][4 - 4]
                                        안넣는다면 result[0][4]
 result[1][5] = 넣는다면 8 + result[0][5-4]
 result[1][6] = 0
 result[1][7] = 0
 
 */
for i in 0..<n {
    for j in 1...k {
        if i == 0 {
            if j >= items[i][0] {
                result[i][j] = items[i][1]
            }
        } else {
            result[i][j] = items[i][0] <= j ? max(items[i][1] + result[i - 1][j - items[i][0]], result[i - 1][j]) : result[i - 1][j]
        }
    }
}
print(result[n - 1][k])
