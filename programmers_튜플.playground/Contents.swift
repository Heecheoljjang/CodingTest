import Foundation

func solution(_ s:String) -> [Int] {

    var temp: String = ""
    var tempArr: [Int] = []
    var arr: [[Int]] = []
    var result: [Int] = []

    // 배열로 바꾸기
    for i in s {
        if i.isNumber {
            temp += String(i)
        } else if i == "," {
            if temp != "" {
                tempArr.append(Int(temp)!)
                temp = ""
            }
        } else if i == "}" {
            if temp != "" {
                tempArr.append(Int(temp)!)
                arr.append(tempArr)
                temp = ""
                tempArr = []
            }
        }
    }
    // 반복문 이용해서 길이가 짧은 배열부터 확인
    let maxCount: Int = arr.sorted {$0.count > $1.count}[0].count
    for i in 1...maxCount {
        let temp = arr.filter {$0.count == i}[0]
        for num in temp {
            if !result.contains(num) {
                result.append(num)
            }
        }
    }
    return result
}

solution("{{4,2,3},{3},{2,3,4,1},{2,3}}")

