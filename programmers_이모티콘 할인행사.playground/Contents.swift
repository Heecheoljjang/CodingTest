import Foundation

func solution(_ users:[[Int]], _ emoticons:[Int]) -> [Int] {

    var result = [0,0]
    var list: [[Int]] = []
    let discount = [10,20,30,40]
    
    func permu(_ arr: [Int]) {
        if arr.count == emoticons.count {
            list.append(arr)
            return
        }
        for i in 0..<4 {
            permu(arr + [discount[i]])
        }
    }
    permu([])
    
    for disCase in list {
        var plusUser = 0
        var total = 0
        for i in 0..<users.count {
            let minDis = users[i][0]
            let minTotal = users[i][1]
            var tempTotal = 0
            for j in 0..<disCase.count {
                if disCase[j] < minDis {
                    continue
                }
                tempTotal += emoticons[j] * (100 - disCase[j]) / 100
            }
            if tempTotal >= minTotal {
                plusUser += 1
            } else {
                total += tempTotal
            }
        }
        if result[0] < plusUser || (result[0] == plusUser && result[1] < total) {
            result = [plusUser,total]
        }
    }
    return result
}
solution([[40, 2900], [23, 10000], [11, 5200], [5, 5900], [40, 3100], [27, 9200], [32, 6900]],[1300, 1500, 1600, 4900])
