//import Foundation
//
////var student: [[String]] = []
//var student = [["Y","Y","Y","Y","Y"],
//               ["S","Y","S","Y","S"],
//               ["Y","Y","Y","Y","Y"],
//               ["Y","S","Y","Y","S"],
//               ["Y","Y","Y","Y","Y"]]
//var result = 0
//var lee: [[Int]] = []
//var lim: [[Int]] = []
//var total: [[Int]] = []
//var seven: [[[Int]]] = []
//let dx = [1,0,-1,0]; let dy = [0,1,0,-1]
////for _ in 0..<5 {
////    student.append(readLine()!.map { String($0) })
////}
//for i in 0..<5 {
//    for j in 0..<5 {
////        if student[i][j] == "Y" {
////            lim.append([i,j])
////        } else {
////            lee.append([i,j])
////        }
//        total.append([i,j])
//    }
//}
//print(total)
//
//func combi(_ arr: [[Int]], _ idx: Int) {
//    if arr.count == 7 {
//        let temp = arr.map { student[$0[0]][$0[1]] }
//        if temp.filter { $0 == "Y" }.count >= 4 {
//            return
//        }
//        seven.append(arr)
//        return
//    }
//    for i in idx..<total.count {
//        combi(arr + [total[i]], i + 1)
//    }
//}
//combi([], 0)
//
////인접한거 확인해야함
//for test in seven {
//    var count = 1
//    var queue = [test[0]]
//    var visited = Array(repeating: Array(repeating: false, count: 5), count: 5)
//    visited[test[0][0]][test[0][1]] = true
//    var idx = 0
//    while idx < queue.count {
//        let cur = queue[idx]
//        idx += 1
//        for i in 0..<dx.count {
//            let newX = cur[0] + dx[i]
//            let newY = cur[1] + dy[i]
//            if test.contains([newX,newY]) && !visited[newX][newY] {
//                count += 1
//                queue.append([newX,newY])
//                visited[newX][newY] = true
//            }
//        }
//    }
//    if count == 7 {
//        result += 1
//    }
//}
//print(result)

import Foundation

var student: [[String]] = []
var result = 0
var total: [[Int]] = []
var seven: [[[Int]]] = []
let dx = [1,0,-1,0]; let dy = [0,1,0,-1]
for _ in 0..<5 {
    student.append(readLine()!.map { String($0) })
}
for i in 0..<5 {
    for j in 0..<5 {
        total.append([i,j])
    }
}
func combi(_ arr: [[Int]], _ idx: Int) {
    if arr.count == 7 {
        let temp = arr.map { student[$0[0]][$0[1]] }
        if temp.filter { $0 == "Y" }.count >= 4 {
            return
        }
        seven.append(arr)
        return
    }
    for i in idx..<total.count {
        combi(arr + [total[i]], i + 1)
    }
}
combi([], 0)

for test in seven {
    var count = 1
    var queue = [test[0]]
    var visited = Array(repeating: Array(repeating: false, count: 5), count: 5)
    visited[test[0][0]][test[0][1]] = true
    var idx = 0
    while idx < queue.count {
        let cur = queue[idx]
        idx += 1
        for i in 0..<dx.count {
            let newX = cur[0] + dx[i]
            let newY = cur[1] + dy[i]
            if test.contains([newX,newY]) && !visited[newX][newY] {
                count += 1
                queue.append([newX,newY])
                visited[newX][newY] = true
            }
        }
    }
    if count == 7 {
        result += 1
    }
}
print(result)
