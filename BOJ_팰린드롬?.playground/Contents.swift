import Foundation

//let n = file.readInt()
//var numbers: [Int] = []
//for _ in 0..<n {
//    numbers.append(file.readInt())
//}
//let m = file.readInt()
let n = 7
let numbers = [1,2,1,3,1,2,1]
let m = 4
let tttt = [[1,3],[2,5],[3,3],[5,7]]
var result = Array(repeating: Array(repeating: -1, count: n), count: n)

for i in 0..<m {
    //    let s = file.readInt() - 1
    //    let e = file.readInt() - 1
    let s = tttt[i][0] - 1
    let e = tttt[i][1] - 1
    if s == e {
        print("1")
        result[s][e] = 1
        continue
    }
    //이미 값이 있으면 바로 출력
    if result[s][e] != -1{
        print(result[s][e])
        continue
    }
    //값이 없으면 result[s+1][e-1]의 값이 있는지 확인후, 없으면 그대로 진행
    //있으면 numbers[s]와 numbers[e]가 같은지 확인후 같으면 result[s][e] = 1, 다르면 0
    if s != n-1 && e != 0 {
        if result[s+1][e-1] == 1 {
            if numbers[s] == numbers[e] {
                print("1")
                result[s][e] = 1
                continue
            } else {
                print("0")
                result[s][e] = 0
                continue
            }
        } else if result[s+1][e-1] == 0 {
            print("0")
            result[s][e] = 0
            continue
        }
    }
    let tArr = Array(numbers[s...e])
    var start = 0
    var end = tArr.count - 1
    var ch = true
    while start < end {
        if tArr[start] != tArr[end] {
            ch = false
            break
        } else {
            start += 1
            end -= 1
        }
    }
    if ch {
        print("1")
        result[s][e] = 1
    } else {
        print("0")
        result[s][e] = 0
    }
}
