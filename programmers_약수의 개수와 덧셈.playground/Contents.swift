import Foundation

func solution(_ left:Int, _ right:Int) -> Int {
    
    var result: Int = 0
    var temp: Int = 0

    if left == 1 {
        for i in 2...right {
            for j in 1...i/2 {
                if i % j == 0 && j != 1{
                    temp += 1
                }
            }
            temp += 2
            if temp % 2 == 0 {
                result += i
            } else {
                result -= i
            }
            temp = 0
        }
    } else {
        for i in left...right {
            for j in 1...i/2 {
                if i % j == 0 {
                    temp += 1
                }
            }
            temp += 1
            if temp % 2 == 0 {
                result += i
            } else {
                result -= i
            }
            temp = 0
        }
    }
    return result
}
solution(1, 2)
