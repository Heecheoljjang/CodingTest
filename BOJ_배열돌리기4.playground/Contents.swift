import Foundation

let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
let n = input[0]; let m = input[1]; let k = input[2]
var board:[[Int]] = []
var commands:[(Int,Int,Int)] = []
for _ in 0..<n {
    board.append(readLine()!.split(separator: " ").map{ Int(String($0))! })
}
for _ in 0..<k {
    let temp = readLine()!.split(separator: " ").map{ Int(String($0))! }
    commands.append((temp[0],temp[1],temp[2]))
}
var total: [[(Int,Int,Int)]] = []
var visited = Array(repeating: false, count: commands.count)
var result = 9999999
func getTotal(_ arr: [(Int,Int,Int)]) {
    if arr.count == commands.count {
        total.append(arr)
        return
    }
    for i in 0..<commands.count {
        if !visited[i] {
            visited[i] = true
            getTotal(arr + [commands[i]])
            visited[i] = false
        }
    }
}
getTotal([]) //모든 순서 구했음.
func rotate(_ r: Int, _ c: Int, _ s: Int, _ temp: [[Int]]) -> [[Int]] {
    var t = temp
    for i in 1...s {
        //위 -> x는 r-1-i로 고정
        for j in c-i...c-1+i {
            t[r-1-i][j] = temp[r-1-i][j-1]
        }
        //오 -> y는 c-1+i로 고정
        for j in r-i...r-1+i{
            t[j][c-1+i] = temp[j-1][c-1+i]
        }
        //아 -> x는 r-1+i로 고정
        for j in c-i-1...c+i-2 {
            t[r-1+i][j] = temp[r-1+i][j+1]
        }
        //왼 -> y는 c-1-i
        for j in r-i-1...r+i-2{
            t[j][c-1-i] = temp[j+1][c-1-i]
        }
    }
    return t
}
func getAddValue(_ b: [[Int]]) {
    var temp = 9999999
    for i in 0..<n {
        temp = min(temp,b[i].reduce(0) { $0 + $1 })
    }
    result = min(temp,result)
}
for i in 0..<total.count {
    let cur = total[i]
    var tBoard = board
    for c in cur {
        tBoard = rotate(c.0,c.1,c.2,tBoard)
    }
    getAddValue(tBoard)
}
print(result)
