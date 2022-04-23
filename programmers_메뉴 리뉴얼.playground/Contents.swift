import Foundation

func solution(_ orders:[String], _ course:[Int]) -> [String] {

    var menu: [String: Int] = [:]
    var sortedOrder: [String] = []
    var result: [String] = []
    //combination
    func combi(_ target: String, _ targetNum: Int, _ index: Int, _ tempStr: String) {
        if tempStr.count == targetNum {
            if menu.keys.contains(tempStr) {
                menu[tempStr]! += 1
            } else {
                menu.updateValue(1, forKey: tempStr)
            }
            return
        }
        for i in index..<target.count {
            combi(target, targetNum, i + 1, tempStr + target[String.Index(utf16Offset: i, in: target)...String.Index(utf16Offset: i, in: target)])
        }
    }

    // orders의 각 원소 정렬
    for i in orders {
        var temp = String(i.sorted(by: <))
        sortedOrder.append(temp)
    }
    
    for i in sortedOrder {
        for j in course {
            combi(i, j, 0, "")
        }
    }
    for i in course {
        if let max = menu.filter {$0.key.count == i}.values.max() {
            for j in menu.filter {$0.key.count == i} {
                if j.value == max {
                    if j.value >= 2 {
                        result.append(j.key)
                    }
                }
            }
        }
    }
    return result.sorted(by: <)
}

solution(["ABCDE", "AB", "CD", "ADE", "XYZ", "XYZ", "ACD"], [2,3,5])


//
//var a = "1234567890"
//print(a[String.Index(utf16Offset: 5, in: a)])

