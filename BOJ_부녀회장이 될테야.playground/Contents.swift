import Foundation

func solution(_ k: Int, _ n: Int) -> Int {
    var value = 0
    if k == 0 {
        return n
    }
    for i in 1...n {
        value += solution(k - 1, i)
    }
    return value
}

let caseCount = Int(readLine()!)!
for _ in 0..<caseCount {
    let k = Int(readLine()!)!
    let n = Int(readLine()!)!
    print(solution(k, n))
}
