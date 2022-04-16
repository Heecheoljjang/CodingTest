import Foundation

//func solution(_ citations:[Int]) -> Int {
//
//    var possible: [Int] = []
//
//    for h in 0...citations.count {
//        if citations.filter {$0 >= h}.count >= h {
//            possible.append(h)
//        }
//    }
//    return possible.max()!
//}

func solution(_ citations:[Int]) -> Int {
    let sorted = citations.sorted(by: >)
    for i in 0..<sorted.count {
        if i >= sorted[i] {
            return i
        }
    }
    return 0
}

