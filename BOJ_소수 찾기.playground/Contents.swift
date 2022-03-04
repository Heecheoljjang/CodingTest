import Foundation

//let N = Int(readLine()!)!
//var array = [Int](repeating: 0, count: N)
//
//for i in 0..<N {
//    array[i] = Int((readLine()?.split(separator: " ")[i])!)!
//}

let aa = "1 9 5 34 6 3"
let N = 6
var temp = [Int](repeating: 0, count: N)


for i in 0..<N {
    temp[i] = Int(aa.split(separator: " ")[i])!
}
temp = temp.sorted{$0 < $1}
print(temp)
var arr = [Int](repeating: 0, count: temp.last! + 1)

for i in temp {
    arr[i] = i
}
if arr.contains(1) {
    arr[1] = 0
}

if arr.count > 2 {
    for i in 2...(arr.count - 1) {
        for j in stride(from: i + i, through: arr.count, by: i) {
            if arr.contains(j) {
                arr[j] = 0
            }
        }
    }
}
print(arr.filter{$0 != 0}.count)


