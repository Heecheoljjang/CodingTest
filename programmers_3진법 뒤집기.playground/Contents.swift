import Foundation

func solution(_ n:Int) -> Int {
    
    var quo: Int = n
    var remain: Int = 0
    var numStr: String = ""
    var newNum: Int = 0
    var mulNum: Int = 1
    
    //3진수 변환
    while quo / 3 != 0 {
        remain = quo % 3
        numStr = String(remain) + numStr
        quo = quo / 3
    }
    numStr = String(quo) + numStr
    
    //뒤집기
    numStr = String(numStr.reversed())

    //10진법표현
    for (i, num) in numStr.enumerated() {
        let count = numStr.count
        if i == count - 1 {
            newNum += Int(String(num))!
        } else {
            for _ in 1..<count - i {
                mulNum *= 3
            }
            newNum += mulNum * Int(String(num))!
        }
        mulNum = 1
    }
    return newNum
}
solution(125)
