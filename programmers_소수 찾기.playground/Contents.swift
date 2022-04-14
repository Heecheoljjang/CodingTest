import Foundation

func solution(_ numbers:String) -> Int {

    let numArr = numbers.map {String($0)} //배열로 바꿈 -> map 정리
    var strNumArr: [String] = []
    var numCheck = [Int](repeating: 0, count: numArr.count)
    var number = ""
    var primeBool = true
    var result: [Int] = []

    for i in numArr {
        strNumArr.append(i)
    }
    strNumArr = strNumArr.sorted {$0 < $1}
    // 소수확인 함수
    func isPrime(_ number: Int) {
        if number == 2 || number == 3 || number == 5 {
            primeBool = true
        } else if number == 0 || number == 1 {
            primeBool = false
        } else {
            for i in 2...Int(sqrt(Double(number))) {
                if number % i == 0 {
                    primeBool = false
                    break
                }
            }
        }

    }

    // 숫자 만드는 함수
    func DFS(_ depth: Int, _ numStr: String, _ count: Int) { // -> DFS 알고리즘 정리
        if depth == count { // 숫자 완성(string형태)
            if let number = Int(number) {
                isPrime(number)
                if primeBool == true && !result.contains(number) {
                    result.append(number)
                }
                primeBool = true
            }
        } else { // 숫자만들기
            for i in 0..<numArr.count {
                if numCheck[i] == 0 {
                    number += numArr[i]
                    numCheck[i] = 1
                    DFS(depth + 1, number, count)
                    numCheck[i] = 0
                    number = numStr
                }
            }
        }
    }
    for i in 1...strNumArr.count {
        DFS(0, "", i)
    }
    return result.count
}

