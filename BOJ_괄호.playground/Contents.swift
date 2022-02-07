import Foundation

let T = Int(readLine()!)!
var str = [String](repeating: "", count: T)

for i in 0..<T {
    str[i] = readLine()!
}

for ps in str {
    var left = 0
    var right = 0
    
    for element in ps {
        if element == "(" {
            left += 1
        } else {
            right += 1
            if right > left {
                break
            }
        }
    }
    if left == right {
        print("YES")
    } else {
        print("NO")
    }
}
