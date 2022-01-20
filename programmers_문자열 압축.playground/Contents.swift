import Foundation

func solution(_ s: String) -> Int {
    
    var s = s
    var count: Int
    var index: String.Index
    var str: String = ""
    var arr: [String] = []
    
    if s.count == 1 {   //길이가 1일 경우
        return 1
    }
    //일단 문자열 1개 단위로 자르는 경우만 해보기 (i = 1인 경우)
    index = s.index(s.startIndex, offsetBy: 0)
    str.append(contentsOf: s[s.startIndex...index])
    arr.append(str)
    s.removeSubrange(s.startIndex...index)
    str.append(contentsOf: s[s.startIndex...index])
    arr.append(str)
    print(arr)
    
    
    
    return 0
}
solution("xababcdcdababcdcd")
//
//let a = "123456789"
//for i in a {
//    print(i)
//    print(i-1)
//}

