import Foundation

//let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let input = [7,7]
let n = input[0]
let m = input[1]
//var lab: [[Int]] = []
//for _ in 0..<n {
//    lab.append(readLine()!.split(separator: " ").map { Int(String($0))! })
//}
var lab = [[2,0,0,0,1,1,0],
           [0,0,1,0,1,2,0],
           [0,1,1,0,1,0,0],
           [0,1,0,0,0,0,0],
           [0,0,0,0,0,1,1],
           [0,1,0,0,0,0,0],
           [0,1,0,0,0,0,0]]
let dx = [1,0,-1,0]
let dy = [0,1,0,-1]
var zeros: [[Int]] = []
var virus: [[Int]] = []
var result: [Int] = []
//0, 2인 위치 구하기
for i in 0..<n {
    for j in 0..<m {
        if lab[i][j] == 0 {
            zeros.append([i,j])
        } else if lab[i][j] == 2 {
            virus.append([i,j])
        }
    }
}
//3개 조합 구하기
var temp: [[[Int]]] = []
//func combi(_ arr: [[Int]], _ idx: Int) {
//    if arr.count == 3 {
//        temp.append(arr)
//        return
//    }
//    for i in idx..<zeros.count {
//        combi(arr + [zeros[i]], i + 1)
//    }
//}
//combi([],0)
for i in 0..<zeros.count {
    for j in i + 1..<zeros.count {
        for k in j + 1..<zeros.count {
            temp.append([zeros[i],zeros[j],zeros[k]])
        }
    }
}
//조합 하나씩 1로 만들어서 각각 bfs한 뒤에 안전영역 최대확인
for combi in temp {
    var newLab = lab
    //벽세우기
    for point in combi {
        newLab[point[0]][point[1]] = 1
    }
//    print("\n")
//    print("newLab")
//    print(newLab)
    //bfs
    var queue = virus
    var idx = 0
    while idx < queue.count {
        let current = queue[idx]
        idx += 1
        for i in 0..<dx.count {
            let newX = current[0] + dx[i]
            let newY = current[1] + dy[i]
            if newX < 0 || newY < 0 || newX >= n || newY >= m {
                continue
            }
            if newLab[newX][newY] == 1 || newLab[newX][newY] == 2 {
                continue
            }
            newLab[newX][newY] = 2
            queue.append([newX,newY])
        }
    }
//    print("queue")
//    print(queue)
//    print("zeroCOunt \(zeros.count)")
//    print("queueCount: \(queue.count)")
    result.append(zeros.count - 3 - queue.count + virus.count)
}
print(result.max()!)
