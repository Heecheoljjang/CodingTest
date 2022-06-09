import Foundation

func solution(_ msg:String) -> [Int] {

    var temp: String = ""
    var result: [Int] = []
    var dictionary: [String: Int] = ["A": 1, "B": 2, "C": 3, "D": 4, "E": 5, "F": 6, "G": 7, "H": 8, "I": 9, "J": 10, "K": 11, "L": 12, "M": 13, "N": 14, "O": 15, "P": 16, "Q": 17, "R": 18, "S": 19, "T": 20, "U": 21, "V": 22, "W": 23, "X": 24, "Y": 25, "Z": 26]
    var num: Int = 27
    let msgArr = Array(msg)
    var index: Int = 0
    
    while true {
        temp.append(msgArr[index])
        if dictionary[temp] == nil {
            dictionary[temp] = num
            num += 1
            temp = ""
        } else {
            while true {
                index += 1
                if index == msgArr.count {
                    break
                } else {
                    if dictionary[temp + String(msgArr[index])] == nil {
                        dictionary[temp + String(msgArr[index])] = num
                        num += 1
                        break
                    } else {
                        temp.append(msgArr[index])
                    }
                }
            }
            result.append(dictionary[temp]!)
            temp = ""
            if index == msgArr.count {
                break
            }
        }
    }
    return result
}
solution("ABABABABABABABAB")
