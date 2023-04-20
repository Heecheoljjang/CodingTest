import Foundation

//let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let input = [2,2,0,0,16]
let n = input[0]
let m = input[1]
let k = input[4]
var start = (input[2],input[3])
var board: [[Int]] = []
//let command = readLine()!.split(separator: " ").map { Int(String($0))! }
let command = [4,4,4,4,1,1,1,1,3,3,3,3,2,2,2,2]
var dice = [0,0,0,0,0,0] //위,앞,오,왼,뒤,아
func check(_ num: Int) -> Bool {
    if num == 1{
        if start.1 + 1 >= m{
            return false
        }
    } else if num == 2{
        if start.1 - 1 < 0{
            return false
        }
    } else if num == 3{
        if start.0 - 1 < 0{
            return false
        }
    } else{
        if start.0 + 1 >= n{
            return false
        }
    }
    return true
}
func rollDice(_ num: Int) {
    if num == 1{
        dice = [dice[3],dice[1],dice[0],dice[5],dice[4],dice[2]]
        start = (start.0,start.1+1)
    } else if num == 2{
        dice = [dice[2],dice[1],dice[5],dice[0],dice[4],dice[3]]
        start = (start.0,start.1-1)
    } else if num == 3{
        dice = [dice[4],dice[0],dice[2],dice[3],dice[5],dice[1]]
        start = (start.0-1,start.1)
    } else {
        dice = [dice[1],dice[5],dice[2],dice[3],dice[0],dice[4]]
        start = (start.0+1,start.1)
    }
}
//
//for _ in 0..<n{
//    let temp = readLine()!.split(separator: " ").map { Int(String($0))! }
//    board.append(temp)
//}
board = [[0,2],
         [3,4]]
//동1,서2,북3,남4
for num in command{
    if check(num){
        rollDice(num)
        if board[start.0][start.1] == 0{
            board[start.0][start.1] = dice[5]
        } else{
            dice[5] = board[start.0][start.1]
            board[start.0][start.1] = 0
        }
        print(dice[0])
    }
}
