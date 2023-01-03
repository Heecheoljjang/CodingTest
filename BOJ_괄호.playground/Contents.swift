import Foundation

let t = Int(readLine()!)!
var result = Array(repeating: "YES", count: t)
for i in 0..<t {
    var input = readLine()!.map { String($0) }
    var left = 0
    var right = 0
    while !input.isEmpty {
        if input.removeLast() == ")" {
            right += 1
        } else {
            left += 1
        }
        if left > right {
            result[i] = "NO"
            break
        }
    }
    if right != left {
        result[i] = "NO"
    }
}
print(result)
//let T = Int(readLine()!)!
//var str = [String](repeating: "", count: T)
//
//for i in 0..<T {
//    str[i] = readLine()!
//}
//
//for ps in str {
//    var left = 0
//    var right = 0
//
//    for element in ps {
//        if element == "(" {
//            left += 1
//        } else {
//            right += 1
//            if right > left {
//                break
//            }
//        }
//    }
//    if left == right {
//        print("YES")
//    } else {
//        print("NO")
//    }
//}
