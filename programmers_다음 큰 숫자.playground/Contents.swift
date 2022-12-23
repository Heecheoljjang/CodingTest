import Foundation

func solution(_ n:Int) -> Int{
    let oneCount = String(n, radix: 2).map { String($0) }.filter { $0 == "1" }.count
    var newN = n + 1
    while true {
        let temp = String(newN, radix: 2).map { String($0) }.filter { $0 == "1" }.count
        if temp == oneCount {
            break
        }
        newN += 1
    }
    return newN
}
