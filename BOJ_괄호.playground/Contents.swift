import Foundation

//let T = Int(readLine()!)!
//var str = [String](repeating: "", count: T)
//
//for i in 0..<T {
//    str[i] = readLine()!
//}

let T = 6
let str = ["(())())", "(((()())()", "(()())((()))", "((()()(()))(((())))()", "(()((())()("]

for ps in str {
    var left = 0
    var right = 0
    if ps.first == ")" {
        print("NO")
        continue
    } else if ps.last == "(" {
        print("NO")
        continue
    } else {
        for element in ps {
            if element == "(" {
                left += 1
            } else {
                right += 1
                if right > left {
                    print("NO")
                    break
                }
            }
        }
    }
}
