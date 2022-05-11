import Foundation
import Darwin

func solution(_ left:Int, _ right:Int) -> Int {
    
    var count: Int = 0
    var result: Int = 0
    
    for i in left...right {
        count = 0
        for j in 1...i {
            if i % j == 0 {
                count += 1
            }
        }
        //짝수
        if count % 2 == 0 {
            result += i
        } else {
            result -= i
        }
    }
    return result
}
solution(24, 27)
