import Foundation

let n = Int(readLine()!)!
var str: [[String]] = []
for _ in 0..<n {
    str.append(readLine()!.split(separator: " ").map { String($0) })
}
var cseteram = readLine()!.split(separator: " ").map { String($0) }
outer: while !cseteram.isEmpty {
    for i in 0..<n {
        if !str[i].isEmpty && str[i][0] == cseteram[0] {
            cseteram.removeFirst()
            str[i].removeFirst()
            continue outer
        }
    }
    break
}
if cseteram.isEmpty {
    var check = true
    for i in 0..<n {
        if !str[i].isEmpty {
            check = false
            break
        }
    }
    check ? print("Possible") : print("Impossible")
} else {
    print("Impossible")
}
