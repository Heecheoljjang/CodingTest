import Foundation

func solution(_ nums:[Int]) -> Int {
    
    var number: [Int] = []
    
    func combi(_ target: [Int], _ targetNum: Int, _ index: Int, _ sum: Int, _ count: Int) {
        if count == targetNum {
            for i in 2...Int(sqrt(Double(sum))) {
                if sum % i == 0 {
                    return
                }
            }
            number.append(sum)
            return
        }
        for i in index..<target.count {
            combi(target, targetNum, i + 1, sum + target[i], count + 1)
        }
    }
    
    combi(nums, 3, 0, 0, 0)
    
    return number.count
}

solution([11,30,23,75,95])
