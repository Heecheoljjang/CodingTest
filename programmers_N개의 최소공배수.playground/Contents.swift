import Foundation

func solution(_ arr:[Int]) -> Int {
    let sorted = arr.sorted { $0 > $1 }
    var value = sorted[0]
    outer: while true {
        for i in 1..<sorted.count {
            if value % sorted[i] != 0 {
                value += sorted[0]
                continue outer
            }
        }
        break
    }
    return value
}
