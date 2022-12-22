import Foundation
var count = 0
func recursion(_ s: [String], _ l: Int, _ r: Int) -> Int {
    count += 1
    if l >= r {
        return 1
    } else if s[l] != s[r] {
        return 0
    } else {
        return recursion(s, l + 1, r - 1)
    }
}

func isPalindrome(_ s: [String]) -> Int {
    return recursion(s, 0, s.count - 1)
}

let caseCount = Int(readLine()!)!

for _ in 0..<caseCount {
    let word = readLine()!.map { String($0) }
    count = 0
    print("\(isPalindrome(word))", count)
}
