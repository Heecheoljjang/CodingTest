import Foundation

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    
    var dic: [String: [[Int]]] = [:]
    var result: [Int] = []
    
    for (index, element) in plays.enumerated() {
        if dic[genres[index]] == nil {
            dic[genres[index]] = [[element, index]]
        } else {
            if var value = dic[genres[index]] {
                value.append([element, index])
                dic[genres[index]] = value
            }
        }
    }
    for value in dic.values.sorted{ $0.reduce(0){ $0 + $1[0] } > $1.reduce(0){ $0 + $1[0] } } {
        let temp = value.sorted{ first, second in
            if first[0] == second[0] {
                return first[1] < second[1]
            }
            return first[0] > second[0]
        }
        if temp.count == 1 {
            result.append(temp[0][1])
        } else {
            for i in 0...1 {
                result.append(temp[i][1])
            }
        }
    }
    return result
}
