import Foundation

func solution(_ clothes:[[String]]) -> Int {
    var dic: [String: [String]] = [:]
    var result = 1
    for i in clothes {
        if dic[i[1]] == nil {
            dic[i[1]] = [i[0]]
        } else {
            if var temp = dic[i[1]] {
                temp.append(i[0])
                dic[i[1]] = temp
            }
        }
    }
    dic.map { $0.value.count }.forEach {
        result *= ($0 + 1)
    }
    return result - 1
}
