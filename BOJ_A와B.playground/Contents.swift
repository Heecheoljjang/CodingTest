import Foundation

var s = readLine()!.map{ String($0) }
var t = readLine()!.map{ String($0) }
var check = false
if s == t {
    check = true
} else {
    while t.count >= s.count {
        if t[t.count-1] == "A" {
            t.removeLast()
        } else {
            t.removeLast()
            t = Array(t.reversed())
        }
        if t == s {
            check = true
        }
    }
}
if check {
    print("1")
} else {
    print("0")
}
