import Foundation
//n: input[0], m: input[1], d: input[2]
let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
var board: [[Int]] = []
var baseBoard: [[Int]] = []
for _ in 0..<input[0]{
    let t = readLine()!.split(separator: " ").map{ Int(String($0))! }
    board.append(t)
    baseBoard.append(t)
}

var result = 0 //제거한 적의 수
var total: [[(Int,Int)]] = []

//거리 구하는 함수
func getDistance(_ f: (Int,Int), _ s: (Int,Int)) -> Int {
    return abs(f.0-s.0) + abs(f.1-s.1)
}
//궁수 모든 위치 구하는 함수
func getTotal(_ arr: [Int], _ idx: Int) {
    if arr.count == 3 {
        var t: [(Int,Int)] = []
        for i in 0..<arr.count {
            t.append((input[0],arr[i]))
        }
        total.append(t)
        return
    }
    for i in idx..<input[1] {
        getTotal(arr+[i],i + 1)
    }
}
//적 한칸씩 아래로
func enemyMove() {
    var temp:[(Int,Int)] = []
    for i in 0..<input[0] {
        for j in 0..<input[1] {
            if board[i][j] == 1 {
                if i != input[0] - 1 {
                    temp.append((i+1,j))
                }
                board[i][j] = 0
            }
        }
    }
    for i in 0..<temp.count {
        board[temp[i].0][temp[i].1] = 1
    }
}
//적 체크
func isEnemyEl() -> Bool {
    for i in 0..<input[0] {
        for j in 0..<input[1] {
            if board[i][j] == 1 {
                return false
            }
        }
    }
    return true
}
getTotal([],0)
for i in 0..<total.count {
    var tempCount = 0
    board = baseBoard
    while !isEnemyEl() {
        let archer = total[i] //얘넨 고정임
        var killed:[[Int]] = []
        //가장 가까운 적 제거하고 한칸 아래로
        for j in 0..<archer.count {
            let cur = archer[j] //(Int,Int)
            var temp = (99,99,9999)
            for p in 0..<input[0] {
                for q in 0..<input[1] {
                    if board[p][q] == 1 {
                        let d = getDistance(cur,(p,q))
                        if d > input[2] {
                            continue
                        }
                        if (temp.2 == d && temp.1 > q) || temp.2 > d {
                            temp = (p,q,d)
                        }
                    }
                }
            }
            if temp != (99,99,9999) {
                killed.append([temp.0,temp.1])
            }
        }
        killed = Array(Set(killed))
        for e in killed {
            board[e[0]][e[1]] = 0
        }
        tempCount += killed.count
        enemyMove()
    }
    result = max(result,tempCount)
}
print(result)
