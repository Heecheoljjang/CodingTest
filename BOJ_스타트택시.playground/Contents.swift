import Foundation

let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
let n = input[0]; let m = input[1]; var f = input[2]
var board: [[Int]] = []
for _ in 0..<n{
    board.append(readLine()!.split(separator: " ").map{ Int(String($0))! })
}
var p:[(Int,Int,Int,Int)] = [] //출x,출y,목x,목y
let s = readLine()!.split(separator: " ").map{ Int(String($0))! }
var taxi = (s[0]-1,s[1]-1)
for _ in 0..<m {
    let line = readLine()!.split(separator: " ").map{ Int(String($0))! }
    p.append((line[0]-1,line[1]-1,line[2]-1,line[3]-1))
}
let d = [(1,0),(0,1),(-1,0),(0,-1)]
var pCount = p.count

func checkDistance(_ f: (Int,Int), _ s: (Int,Int)) -> Int {
    var visited = Array(repeating: Array(repeating: -1, count: n), count: n)
    visited[f.0][f.1] = 0
    var queue = [f]
    while !queue.isEmpty {
        let cur = queue.removeFirst()
        if cur == s {
            return visited[cur.0][cur.1]
        }
        for i in 0..<4 {
            let new = (cur.0+d[i].0,cur.1+d[i].1)
            if new.0 < 0 || new.1 < 0 || new.0 >= n || new.1 >= n {
                continue
            }
            if visited[new.0][new.1] != -1 || board[new.0][new.1] == 1{
                continue
            }
            queue.append(new)
            visited[new.0][new.1] = visited[cur.0][cur.1] + 1
        }
    }
    return -1
}

while true {
    print("연료: \(f)")
    print("택시위치: \(taxi)")
    if pCount == 0 {
        print(f)
        break
    }
    var select = (-1,-1,-1,-1) //x,y,거리,idx
    //가장 가까운거 찾고, 연료 되는지는 나중에
    for i in 0..<p.count {
        print("승객: \(p[i])")
        let dis = checkDistance(taxi, (p[i].0,p[i].1))
        if dis == -1 {
            continue
        }
        print("거리: \(dis)")
        if select == (-1,-1,-1,-1) {
            select = (p[i].0,p[i].1,dis,i)
        } else {
            if dis < select.2 || (dis == select.2 && p[i].0 < select.0) || (dis == select.2 && p[i].0 == select.0 && p[i].1 < select.1) {
                select = (p[i].0,p[i].1,dis,i)
            }
        }
    }
    if select == (-1,-1,-1,-1) {
        print(-1)
        break
    }
    print("선택된 승객: \(select)")
    //승객까지 연료가 되는지 확인 후에 목적지까지 되는지 확인해서 안되면 -1
    let pToTaxi = checkDistance(taxi, (select.0,select.1))
    let taxiToTarget = checkDistance((select.0,select.1), (p[select.3].2,p[select.3].3))
    if taxiToTarget == -1{
        print(-1)
        break
    }
    if pToTaxi >= f {
        print(-1)
        break
    }
    if f - pToTaxi - taxiToTarget < 0 {
        print(-1)
        break
    }
    print("ptotax: \(pToTaxi)")
    print("taxitotar: \(taxiToTarget)")
    //택시 위치바꾸고, p 정리하고, 연료 체크
    f = f - pToTaxi + taxiToTarget
    print("바뀐 후 연료: \(f)")
    taxi = (p[select.3].2,p[select.3].3)
    p.remove(at: select.3)
    print("바뀐 후 택시: \(taxi)\n\n")
    pCount -= 1
}
