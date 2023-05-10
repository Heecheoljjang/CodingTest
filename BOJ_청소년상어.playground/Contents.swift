import Foundation

let input = [[2,6,10,8,6,7,9,4],
             [1,7,16,6,4,2,5,8],
             [3,7,8,6,7,6,14,8],
             [12,7,15,4,11,3,13,3]]

var board: [[(Int,Int)]] = [] //번호,방향
var sortedFish: [(Int,Int,Int,Int)] = [] //번호,방향,x,y
var d = [(0,0),(-1,0),(-1,-1),(0,-1),(1,-1),(1,0),(1,1),(0,1),(-1,1)]
for j in 0..<4 {
//    let line = readLine()!.split(separator: " ").map{ Int(String($0))! }
    let line = input[j]
    var temp: [(Int,Int)] = []
    for i in stride(from:0, through: 6, by:2) {
        temp.append((line[i],line[i+1]))
        sortedFish.append((line[i],line[i+1],j,i/2))
    }
    board.append(temp)
}
sortedFish.sort(by:{ $0.0 < $1.0 })
var shark = (0,0,board[0][0].1) //x,y,방향
let start = board[0][0].0
var result = 0
sortedFish[board[0][0].0-1] = (0,0,0,0)
board[0][0] = (0,0) //빈 칸은 (0,0)으로
print(sortedFish)
//물고기 움직이기
func fishMove(_ sh: (Int,Int,Int), _ tb: [[(Int,Int)]], _ ts: [(Int,Int,Int,Int)]) -> ([[(Int,Int)]],[(Int,Int,Int,Int)]){
    var tBoard = tb
    var tSorted = ts
    print("=============물고기 움직이기 시작함!!!!!================")
    for i in 0..<tSorted.count {
        print("보드")
        for a in tBoard {
            print(a)
        }
        if tSorted[i] == (0,0,0,0) {
            continue
        }
        //1번물고기부터
        var curD = tSorted[i].1
        let baseD = curD
        //지금 방향으로 움직일 수 있는지
        var check = false
        while !check {
            //움직이는 곳이 벽이 아니고, 상어가 아니어야함
            let newD = (tSorted[i].2+d[curD].0,tSorted[i].3+d[curD].1)
            print("newD",newD)
            if newD.0 >= 0 && newD.1 >= 0 && newD.0 < 4 && newD.1 < 4 && (newD.0,newD.1) != (sh.0,sh.1) {
                check = true
                //해당 위치에 물고기가 있으면 위치바꾸고, 없으면 그냥 이동만. 보드도 바꿔줘야함
                if tBoard[newD.0][newD.1] == (0,0) {
                    tBoard[newD.0][newD.1] = (tSorted[i].0,curD)
                    tBoard[tSorted[i].2][tSorted[i].3] = (0,0)
                    tSorted[i] = (i+1,curD,newD.0,newD.1)
                } else {
                    //위치바꿔줘야함
                    print(newD,"dkdkdk")
                    let tempFish = tBoard[newD.0][newD.1] //번호,방향
                    tBoard[newD.0][newD.1] = (tSorted[i].0,curD)
                    tBoard[tSorted[i].2][tSorted[i].3] = tempFish
                    tSorted[tempFish.0-1] = (tempFish.0,tempFish.1,tSorted[i].2,tSorted[i].3)
                    tSorted[i] = (i+1,curD,newD.0,newD.1)
                }
            } else {
                curD += 1
                if curD > 8 {
                    curD = 1
                }
                //다시 돌아온 경우 움직일 수 없는거임
                if curD == baseD {
                    break
                }
            }
        }
    }
    return (tBoard,tSorted)
}
//상어움직이기
func sharkMove(_ s: (Int,Int,Int), _ tb: [[(Int,Int)]], _ ts: [(Int,Int,Int,Int)], _ c: Int) {
    var r = fishMove(s,tb,ts) //물고기 움직임
    var count = 1
    var ch = 0
    var tempB = r.0
    var tempS = r.1
    print("Shark", s)
    print("====board======")
    for a in tempB{
        print(a)
    }
    print("====sortedFish======")
    for a in tempS{
        print(a)
    }
    print("===============\n")
    
    while true {
        var ttB = tempB
        var ttS = tempS
        let newD = (s.0+d[s.2].0*count,s.1+d[s.2].1*count)
        if newD.0 < 0 || newD.1 < 0 || newD.0 >= 4 || newD.1 >= 4 {
            break
        }
        if ttB[newD.0][newD.1] == (0,0) {
            count += 1
            continue
        }
        ch += 1
        //상어정보, 보드 빈칸으로 만들고 상어 있던 곳도 빈칸, sorted도 해당 물고기 0으로바꾸기, c에 더해서 재귀
        let newShark = (newD.0,newD.1,ttB[newD.0][newD.1].1)
        let eat = ttB[newD.0][newD.1]
//        tempB[s.0][s.1] = (0,0)
        ttB[newD.0][newD.1] = (0,0)
        ttS[eat.0-1] = (0,0,0,0)
        sharkMove(newShark,ttB,ttS,c+eat.0)
        count += 1
    }
    //이동할 수 있는 칸이 없음
    if ch == 0 {
        result = max(result,c)
//        print("\n\n")
//        print("@@@@@@@@@@@@@@@결과는??", c)
    }
}
sharkMove(shark,board,sortedFish,start)
print(result)
