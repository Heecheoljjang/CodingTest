import Foundation

//let n = Int(readLine()!)!
let n = 6
//var s: [String] = []
var s = ["A","C","D","B","C","B"]
var t = ""
//for _ in 0..<n {
//    s.append(readLine()!)
//}
var count = 0
outer: while !s.isEmpty {
    if s[0] < s[s.count-1] {
        t += s.removeFirst()
        count += 1
        if count % 80 == 0 {
            t += "\n"
        }
        print(t)
    } else if s[0] > s[s.count-1] {
        t += s.removeLast()
        count += 1
        if count % 80 == 0 {
            t += "\n"
        }
        print(t)
    } else {
        print(s)
        for i in 0..<s.count {
            print(i)
            if s[i] != s[s.count-i-1] {
                if s[i] < s[s.count-i-1] {
                    t += s.removeFirst()
                    count += 1
                    if count % 80 == 0 {
                        t += "\n"
                    }
                } else {
                    t += s.removeLast()
                    count += 1
                    if count % 80 == 0 {
                        t += "\n"
                    }
                }
                continue outer
            }
        }
        t += s.joined()
        s.removeAll()
    }
}
print(t)
