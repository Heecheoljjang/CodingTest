import Foundation

func solution(_ dartResult: String) -> Int {

    var result: String = dartResult
    var results: [String] = []
    var arr1: String = ""
    var arr2: String = ""
    var arr3: String = ""
    var num: Int = 0
    var score: [Int] = []

    for i in result {
        arr1.append(i)
        if (arr1.last)!.isNumber && arr1.filter({$0.isNumber}).count >= 2 {
            if arr1.count > 2 {
                arr1.removeLast()
                break
            }
        }
        result.remove(at: result.startIndex)
    }
    for i in result {
        arr2.append(i)
        if (arr2.last)!.isNumber && arr2.filter({$0.isNumber}).count >= 2 {
            if arr2.count > 2 {
                arr2.removeLast()
                break
            }
        }
        result.remove(at: result.startIndex)
    }
    for i in result {
        arr3.append(i)
        if (arr3.last)!.isNumber && arr1.filter({$0.isNumber}).count >= 2 {
            if arr3.count > 2 {
                arr3.removeLast()
                break
            }
        }
    }
    results.append(arr1)
    results.append(arr2)
    results.append(arr3)

    for i in 0...2 {
        if results[i].filter({$0.isNumber}).count == 2 {
            score.append(10)
        } else {
            score.append(Int(results[i].filter({$0.isNumber}))!)
        }
        switch results[i].filter({$0.isLetter}) {
        case "S":
            score[i] += 0
        case "D":
            score[i] *= score[i]
        case "T":
            score[i] = score[i] * score[i] * score[i]
        default:
            break
        }
        if results[i].last == "*" {
            score[i] *= 2
            if i > 0 {
                score[i-1] *= 2
            }
        } else {
            score[i] *= -1
        }
    }

    for i in 0...2 {
        num += score[i]
    }
    
    return num
}

solution("1S2D*3T")
