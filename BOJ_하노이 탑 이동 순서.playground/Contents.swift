import Foundation

func hanoi(_ n: Int, _ from: Int, _ to: Int) {
    if n == 1 {
        print("\(from) \(to)")
    } else {
        hanoi(n-1, from, 6 - from - to)
        hanoi(1, from, to)
        hanoi(n-1, 6 - from - to, to)
    }
}

let n = Int(readLine()!)!
print(pow(2, n) - 1)
hanoi(n, 1, 3)
