import Foundation

let num: String = readLine()!
let M: Int = Int(num.split(separator: " ")[0])!
let N: Int = Int(num.split(separator: " ")[1])!

var arr = [Int](repeating: 0, count: N + 1)

for i in 2...N {
    arr[i] = i
}
for j in 2...N {
    if arr[j] == 0 {
        continue
    }
    for k in stride(from: j + j , through: N, by: j) {
        arr[k] = 0
    }
    if arr[j] != 0 && arr[j] >= M {
        print(j)
    }
}

