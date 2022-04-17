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
    
    var result: Int = 0
    let sorted = citations.sorted{$0 > $1}

    if sorted.min()! > sorted.count {
        result = sorted.count
    } else {
        for i in 0..<sorted.count {
            if i+1 > sorted[i] {
                result = i
                break
            }
        }
    }
    return result
}

