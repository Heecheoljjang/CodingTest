import Foundation

func printStar(_ number: Int, _ pattern: [String]) {
    if number == 1 {
        pattern.forEach {
            print($0)
        }
        return
    }
    let first = pattern.map { $0 + $0 + $0 }
    let second = pattern.map { $0 + String(repeating: " ", count: $0.count) + $0 }
    let new = first + second + first
    printStar(number / 3, new)
}
