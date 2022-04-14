import Foundation

func solution(_ numbers:String) -> Int {
    
    var arr = [Int](repeating: 0, count: 10000000) // 7자리의 가장 큰 수 9999999까지
    let numArr = numbers.map {String($0)} //배열로 바꿈 -> map 정리
    var numCheck = [Int](repeating: 0, count: numArr.count)
    var number = ""
    
    // 소수확인 함수
    func isPrime(_ number: Int) {
        if number > 1 {
            
        }
    }
    
    // 숫자 만드는 함수
    func DFS(_ depth: Int, _ numStr: String, _ count: Int) { // -> DFS 알고리즘 정리
        if depth == count { // 숫자 완성(string형태)
            if let number = Int(number) {
                arr[number] = 1
            }
        } else { // 숫자만들기
            for i in 0..<numArr.count {
                if numCheck[i] == 0 {
                    number += numArr[i]
                    numCheck[i] = 1
                    DFS(depth + 1, number, count)
                    numCheck[i] = 0
                    number = ""
                }
            }
        }
    }
    for i in 1...numArr.count {
        DFS(0, number, i)
    }
    // 소수 판별
    arr[0] = 0
    arr[1] = 0

    for i in 2...(arr.count - 1) {
        for j in stride(from: i + i, through: arr.count, by: i) {
            if arr.contains(j) {
                arr[j] = 0
            }
        }
    }
    print("asdf: \(arr.filter{$0 == 1}.count)")
    return arr.filter{$0 == 1}.count
}
solution("1231323")
