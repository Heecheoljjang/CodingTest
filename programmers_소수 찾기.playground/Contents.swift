import Foundation

func solution(_ numbers:String) -> Int {
    
    var arr = [Int](repeating: 0, count: 10000000) // 7자리의 가장 큰 수 9999999까지
    var numArr: String = ""
    var numCount: Int = 1
    
    // 숫자리를 한자리씩 numArr에 넣음
    for i in numbers {
        if !numArr.contains(i) {
            numArr.append(i)
        }
    }
    // 만들 수 있는 수
    while numCount != numArr.count {
        
    }
    

    return 0
}
solution("1231323")
