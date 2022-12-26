import Foundation

func solution(_ n:Int) -> Int {
    var ans:Int = 1
    var newN = n
    
    while newN != 1 {
        if newN % 2 != 0 {
            newN -= 1
            ans += 1
        } else {
            newN /= 2
        }
    }
    return ans
}
