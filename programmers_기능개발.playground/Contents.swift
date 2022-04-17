import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {

    var revProgress: [Int] = progresses.reversed()
    let revSpeed: [Int] = speeds.reversed()
    var result: [Int] = []
    var count = 0
    
    if revProgress.count == 1{
        result = [1]
    } else {
        while revProgress.count != 1 {
            revProgress = zip(revProgress, revSpeed).map {$0 + $1}
            if revProgress.last! >= 100 {
                while revProgress.last! >= 100 {
                    revProgress.popLast()
                    count += 1
                    if revProgress.count == 1{
                        break
                    }
                }
                result.append(count)
                count = 0
            }
        }
        if revProgress[0] >= 100 {
            if var last = result.last {
                last += 1
                result.popLast()
                result.append(last)
            }
        } else {
            result.append(1)
        }
    }
    return result
}
