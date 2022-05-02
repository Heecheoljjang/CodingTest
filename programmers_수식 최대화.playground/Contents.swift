import Foundation

func solution(_ expression:String) -> Int64 {
    
    var temp: String = ""
    var arr: [String] = []
    var tempArr: [String] = []
    var intValue: Int64 = 0
    var result: [Int64] = []
    
    // +, -, *
    for i in expression {
        if i.isNumber {
            temp.append(i)
        } else {
            arr.append(temp)
            arr.append(String(i))
            temp = ""
        }
    }
    arr.append(temp) // 위 반복문에서 마지막 원소는 포함되지 않으므로
    
    // 6가지 경우의 결과값을 구한 뒤 비교
    // 세 가지 경우뿐이므로 직접 여섯 경우 작성
    let priorities: [[String]] = [["+", "-", "*"], ["+", "*", "-"], ["-", "+", "*"], ["-", "*", "+"], ["*", "-", "+"], ["*", "+", "-"]]
    for priority in priorities {
        tempArr = arr
        for opSign in priority {
            while tempArr.contains(opSign) {
            loop: for i in 0..<tempArr.count {
                    if tempArr[i] == opSign {
                        switch tempArr[i] {
                        case "+":
                            intValue = Int64(tempArr[i-1])! + Int64(tempArr[i+1])!
                            tempArr.removeSubrange(i-1...i+1)
                            tempArr.insert(String(intValue), at: i-1)
                            break loop
                        case "-":
                            intValue = Int64(tempArr[i-1])! - Int64(tempArr[i+1])!
                            tempArr.removeSubrange(i-1...i+1)
                            tempArr.insert(String(intValue), at: i-1)
                            break loop
                        case "*":
                            intValue = Int64(tempArr[i-1])! * Int64(tempArr[i+1])!
                            tempArr.removeSubrange(i-1...i+1)
                            tempArr.insert(String(intValue), at: i-1)
                            break loop
                        default:
                            continue
                        }
                    }
                }
            }
            
        }
        result.append(abs(Int64(tempArr[0])!))
    }
    return result.max()!
}
solution("50*6-3*2")
