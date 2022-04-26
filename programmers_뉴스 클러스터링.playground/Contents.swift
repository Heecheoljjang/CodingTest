import Foundation

func solution(_ str1:String, _ str2:String) -> Int {

    let firstStr = Array(str1.lowercased())
    let secondStr = Array(str2.lowercased())
    var temp: String = ""
    var first: [String] = []
    var second: [String] = []
    var intersection: Int = 0
    var union: Int = 0

    // 전부 소문자로 초기화
    for i in 0..<firstStr.count - 1 {
        if firstStr[i].isLetter && firstStr[i+1].isLetter {
            temp.append(firstStr[i])
            temp.append(firstStr[i + 1])
            first.append(temp)
            temp = ""
        }
    }
    temp = ""
    for i in 0..<secondStr.count - 1 {
        if secondStr[i].isLetter && secondStr[i+1].isLetter {
            temp.append(secondStr[i])
            temp.append(secondStr[i + 1])
            second.append(temp)
            temp = ""
        }
    }
    // 모두 공집합인 경우
    if first.count == 0 && second.count == 0 {
        return 65536
    }
    //교집합 구하기
    if first.count <= second.count {
        for i in Array(Set(first)) {
            if second.contains(i) {
                let firstCount: Int = first.filter {$0 == i}.count
                let secondCount: Int = second.filter {$0 == i}.count
                if firstCount <= secondCount {
                    intersection += firstCount
                } else {
                    intersection += secondCount
                }
            }
        }
    } else {
        for i in Array(Set(second)) {
            if first.contains(i) {
                let firstCount: Int = first.filter {$0 == i}.count
                let secondCount: Int = second.filter {$0 == i}.count
                if firstCount <= secondCount {
                    intersection += firstCount
                } else {
                    intersection += secondCount
                }
            }
        }
    }
    //합집합 구하기
    if first.count >= second.count {
        for i in Array(Set(first)) {
            let firstCount: Int = first.filter {$0 == i}.count
            let secondCount: Int = second.filter {$0 == i}.count
            if firstCount <= secondCount {
                union += secondCount
            } else {
                union += firstCount
            }
        }
        for i in second {
            if !first.contains(i) {
                union += 1
            }
        }
    } else {
        for i in Array(Set(second)) {
            let firstCount: Int = first.filter {$0 == i}.count
            let secondCount: Int = second.filter {$0 == i}.count
            if firstCount <= secondCount {
                union += secondCount
            } else {
                union += firstCount
            }
        }
        for i in first {
            if !second.contains(i) {
                union += 1
            }
        }
    }
    return Int((Double(intersection)/Double(union)) * 65536)
}
solution("aabbc", "abbde")

