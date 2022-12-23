import Foundation

func solution(_ s:String) -> [Int] {
    
    var result: [Int] = [0,0]
    var newS = s
    var count = 0
    while newS != "1" {
        count += 1
        let temp = newS.map { String($0) }
        result[1] += temp.filter { $0 == "0" }.count
        newS = newS.replacingOccurrences(of: "0", with: "")
        newS = String(Int(String(newS.count, radix: 2), radix: 2)!, radix: 2)
    }
    result[0] = count
    return result
}
