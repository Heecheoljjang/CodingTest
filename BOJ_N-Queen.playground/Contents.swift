import Foundation

let n = Int(readLine()!)!
var result = 0
var horizon = Array(repeating: false, count: n)
var leftToRight = Array(repeating: false, count: 2 * n - 1)
var rightToLeft = Array(repeating: false, count: 2 * n - 1)

func solution(_ count: Int) {
    if count == n {
        result += 1
        return
    }
    for i in 0..<n {
        if !horizon[i] && !rightToLeft[i + count] && !leftToRight[i - count + (n - 1)] {
            horizon[i] = true
            rightToLeft[i + count] = true
            leftToRight[i - count + (n - 1)] = true
            solution(count + 1)
            horizon[i] = false
            rightToLeft[i + count] = false
            leftToRight[i - count + (n - 1)] = false
        }
    }
}
solution(0)
print(result)
