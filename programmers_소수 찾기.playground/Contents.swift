import Foundation

func solution(_ numbers:String) -> Int {
    
    var arr = [Int](repeating: 0, count: 10000000) // 7자리의 가장 큰 수 9999999까지
    var numArr = numbers.map {String($0)} //배열로 바꿈
    var numCheck = [Int](repeating: 0, count: numArr.count)
    var number = ""
    
    // 숫자 만드는 함수
    func DFS(_ depth: Int, _ numStr: String, _ count: Int) {
        if depth == count { // 모든 숫자 완성
            
        } else { // 숫자만들기
            for i in 0..<numArr.count {
                if numCheck[i] == 0 {
                    number += numArr[i]
                    numCheck[i] = 1
                    DFS(depth + 1, number, count)
                }
            }
        }
    }
    
    
    
    

    return 0
}
solution("1231323")
