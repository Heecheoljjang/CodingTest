import Foundation

func solution(_ numbers:[Int], _ target:Int) -> Int {
    
    var count: Int = 0

    func dfs(_ index: Int, _ sum: Int) {
        if index <= numbers.count {
            if index == numbers.count - 1 {
                if sum == target {
                    count += 1
                }
                return
            }
            dfs(index + 1, sum + numbers[index + 1])
            dfs(index + 1, sum - numbers[index + 1])
        }
    }
    dfs(-1, 0)
    return count
}

solution([4,1,2,1], 4)
