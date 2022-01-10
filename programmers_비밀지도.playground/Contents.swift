import Foundation

func solution(_ n: Int, _ arr1: [Int], _ arr2: [Int]) -> [String] {
    var answer: [String] = []
    
    for i in 0..<n {
        answer.append(String(arr1[i]|arr2[i], radix: 2))
    }
    
    for i in 0..<n {
        if answer[i].count < n {
            answer[i] = " " + answer[i]
        }
    }
    
    for i in 0..<n {
        answer[i] = answer[i].replacingOccurrences(of: "1", with: "#")
        answer[i] = answer[i].replacingOccurrences(of: "0", with: " ")
    }
    
    return answer
}
solution(6, [46,33,33,22,31,50], [27,56,19,14,14,10])
