import Foundation

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    
    var result: [Int] = [0,0]
    var divisor: [Int] = []
    var width: Int = 0
    var height: Int = 0
    
    //약수 구하는 함수
    func getDivisor(_ number: Int) {
        
        var result: [Int] = []
                
        for i in 2...Int(sqrt(Double(number))) {
            if number % i == 0 {
                result.append(i)
            }
        }
        divisor = result
    }
    
    if yellow == 1 {
        result = [3, 3]
    } else {
        //약수 구하기
        getDivisor(yellow)
        if divisor.count == 0 {
            // 약수가 없으면 가로로만 쭉 나열한 경우밖에 없음
            result = [yellow + 2, 3]
        } else {
            for i in divisor {
                height = i
                width = yellow / i
                
                if brown == (height + 2) * 2 + 
            }
        }
    }
    return result
}
