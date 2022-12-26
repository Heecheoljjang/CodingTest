import Foundation

func solution(_ n:Int, _ a:Int, _ b:Int) -> Int {
    var answer = 1
    var newA = a
    var newB = b

    if newA < newB {
        while true {
            if newA + 1 == newB && newB % 2 == 0 {
                break
            }
            if newA % 2 == 0 {
                newA /= 2
            } else {
                newA = (newA + 1) / 2
            }
            if newB % 2 == 0 {
                newB /= 2
            } else {
                newB = (newB + 1) / 2
            }
            answer += 1
        }
    } else {
        while true {
            if newB + 1 == newA && newA % 2 == 0 {
                break
            }
            if newA % 2 == 0 {
                newA /= 2
            } else {
                newA = (newA + 1) / 2
            }
            if newB % 2 == 0 {
                newB /= 2
            } else {
                newB = (newB + 1) / 2
            }
            answer += 1
        }
    }
    
    return answer
}
