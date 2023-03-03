import Foundation

//let n = file.readInt()
let n = 5
let aa = [1,2,1,2,1]
var dic:[Int: Int] = [:]
for i in 0..<n {
//    let number = file.readInt()
    let number = aa[i]
    if dic[number] == nil {
        dic[number] = 1
    } else {
        dic[number]! += 1
    }
}
let maxValue = dic.values.max()!
print(dic.keys.filter { dic[$0]! == maxValue }.sorted(by: <)[0])
