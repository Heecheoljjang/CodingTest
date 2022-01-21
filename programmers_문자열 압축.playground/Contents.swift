import Foundation

func solution(_ s: String) -> Int {
    // 문자열 단위로 나눠주기 -> 압축하기
    var arr: [String] = []
    var result: String = ""
    var resultCount: [Int] = []
    var count: Int = 1
    var temp: String = ""
    
    if s.count <= 2 {
        return s.count
    }
    
    for i in 1...s.count/2 {
        var s = s
        var str = ""
        //단위에 따라 문자열 자르고 배열에 추가
        for j in s{
            str.append(j)
            s.removeFirst()
            if s.isEmpty {
                arr.append(str)
                continue
            }
            if str.count == i {
                arr.append(str)
                str = ""
            }
        }
        print(arr)
        //
        //문자열을 압축
        for element in arr {
            print("temp: \(temp), element:\(element), count: \(count)")
            
            if temp == "" {
                temp = element
                continue
            }
            if temp == element {
                count += 1
                continue
            } else {
                if count == 1 {
                    result += temp
                    temp = element
                } else {
                    result += "\(count)\(temp)"
                    temp = element
                    count = 1
                }
            }
        }
        if count == 1 && !temp.isEmpty {
            result += temp
        } else if count >= 2 {
            result += "\(count)\(temp)"
        }
        print(result)
        count = 1
        temp = ""
        resultCount.append(result.count)
        result = ""
        arr = []
    }
    return resultCount.sorted { $0 < $1}[0]
}
solution("ababcdcdababcdcd")

