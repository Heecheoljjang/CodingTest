import Foundation

func solution(_ s: String) -> Int {
    // 문자열 단위로 나눠주기 -> 압축하기
    var arr: [String] = []
    var result: String = ""
    var resultCount: [Int] = []
    var count: Int = 1
    var length: Int

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
        length = arr.count
        //
        //문자열을 압축
        for j in 0..<length {
            count = 1
            for k in j+1..<length {
                if arr[j] == arr[k] {
                    count += 1
                    continue
                }
                if arr[j] != arr[k] {
                    if count != 1 {
                        result += "\(count)\(arr[j])"
                        
                        break
                    } else {
                        result += arr[j]
                        
                    }
                }
            }
        }
        resultCount.append(result.count)
        print(resultCount)
        arr = []
    }
    return 0
}
solution("aabbabcc")

