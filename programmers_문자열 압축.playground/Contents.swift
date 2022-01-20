import Foundation

func solution(_ s: String) -> Int {
    // 문자열 단위로 나눠주기 -> 압축하기
    var str: String = ""
    var arr: [String] = []
    
    
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
        arr = []
    }
    return 0
}
solution("xaavkdsjviajidjmcioaa")
