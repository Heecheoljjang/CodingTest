import Foundation

func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
    
    var first = Int64(queue1.reduce(0) { $0 + $1 })
    var second = Int64(queue2.reduce(0) { $0 + $1 })
    var firstP = 0
    var secondP = 0
    var count = 0
    var firstQ = queue1
    var secondQ = queue2
    
    while true {
        print(firstP, secondP)
        if first == second {
            return count
        }
        if firstP >= queue1.count && secondP >= queue2.count {
            break
        }
        if firstP == firstQ.count || secondP == secondQ.count {
            break
        }
        if first < second {
            let sFirst = secondQ[secondP]
            firstQ.append(sFirst)
            first += Int64(sFirst)
            second -= Int64(sFirst)
            secondP += 1
        } else {
            let fFirst = firstQ[firstP]
            secondQ.append(fFirst)
            second += Int64(fFirst)
            first -= Int64(fFirst)
            firstP += 1
        }
        count += 1
    }
    return -1
}
solution([1,2,1,2],[1,10,1,2])
