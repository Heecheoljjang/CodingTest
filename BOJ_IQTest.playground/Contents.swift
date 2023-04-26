import Foundation

let n = Int(readLine()!)!
var num = readLine()!.split(separator: " ").map{ Int(String($0))! }
if n == 1 {
    print("A")
} else if n == 2 {
    if num[0] == num[1] {
        print(num[0])
    } else {
        print("A")
    }
} else {
    if num[1] != num[0] {
        let a = (num[2] - num[1]) / (num[1] - num[0])
        let ch = (num[2] - num[1]) % (num[1] - num[0])
        if ch != 0 {
            print("B")
        } else {
            let b = num[1] - num[0]*a
            for i in 0..<num.count-1 {
                if num[i+1] != num[i]*a + b {
                    print("B")
                    exit(0)
                }
            }
            print("\(num.last!*a+b)")
        }
    } else {
        if num.filter{ $0 == num[0] }.count != num.count {
            print("B")
        } else {
            print(num[0])
        }
    }
}
