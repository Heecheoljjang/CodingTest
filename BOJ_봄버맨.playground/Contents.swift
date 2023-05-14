import Foundation

let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
let r = input[0]; let c = input[1]; let n = input[2];
var board: [[(String,Int)]] = [] //상태,시간
var bomb:[(Int,Int,Int)] = [] //x,y,시간
let d = [(0,1),(1,0),(0,-1),(-1,0)]
for _ in 0..<r {
    let temp = readLine()!.map{ String($0) }
    var t: [(String,Int)] = []
    for j in 0..<temp.count {
        if temp[j] == "."{
            t.append((".",0))
        } else {
            t.append(("O",3))
        }
    }
    board.append(t)
}

func setBomb(_ time: Int) {
    for i in 0..<r {
        for j in 0..<c {
            if board[i][j] == (".",0) {
                board[i][j] = ("O",time+3)
            }
        }
    }
}

func checkBomb(_ time: Int) {
    var check: [(Int,Int)] = []
    for i in 0..<r {
        for j in 0..<c {
            if board[i][j].0 == "O" && board[i][j].1 == time {
//                board[i][j] = (".",0)
                check.append((i,j))
                for k in 0..<4 {
                    let new = (i+d[k].0,j+d[k].1)
                    if new.0 < 0 || new.1 < 0 || new.0 >= r || new.1 >= c {
                        continue
                    }
                    if board[new.0][new.1].0 == "." {
                        continue
                    }
//                    board[new.0][new.1] = (".",0)
                    check.append(new)
                }
            }
        }
    }
    for p in check {
        board[p.0][p.1] = (".",0)
    }
}

func printBoard() {
    for line in board{
        var temp = ""
        for p in line {
            temp += p.0
        }
        print(temp)
    }
}
print("시작")
for a in board{
    print(a)
}
if n == 1 {
    printBoard()
} else {
    for t in 2...n{
        setBomb(t)
        checkBomb(t)
        print("바뀐 후", "시간\(t)")
        for a in board{
            print(a)
        }
    }
    printBoard()
}

