import Foundation

func solution(_ d:[Int], _ budget:Int) -> Int {
    
    var total: Int = 0
    var count: Int = 0
    var d = d
    
    d = d.sorted(by: <) // 정렬시킴
    for i in d {
        total += i // 하나씩 더해주면서 budget을 초과하는지 확인
        count += 1
        if total > budget {
            total -= i
            count -= 1
            break
        }
    }
    return count
}
