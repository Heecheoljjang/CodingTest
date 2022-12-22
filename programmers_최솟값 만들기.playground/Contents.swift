import Foundation

func solution(_ A:[Int], _ B:[Int]) -> Int {
    
    let newA = A.sorted { $0 < $1 }
    let newB = B.sorted { $0 > $1 }
    var result = 0
    
    for i in 0..<A.count {
        result += (newA[i] * newB[i])
    }
    return result
}
