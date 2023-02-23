import Foundation

func solution(_ n:Int, _ results:[[Int]]) -> Int {
    
    var win: [Int: [Int]] = [:] //이기는 애들
    var lose: [Int: [Int]] = [:] //지는 애들
    var result = 0
    
    for result in results {
        let winner = result[0]; let loser = result[1]
        if win[winner] == nil {
            win[winner] = [loser]
        } else {
            win[winner]!.append(loser)
        }
        if lose[loser] == nil {
            lose[loser] = [winner]
        } else {
            lose[loser]!.append(winner)
        }
    }
    print(win)
    print(lose)
    for i in 1...n {
        var tempCount = 0
        //이긴거
        var queue = win[i] ?? []
        var idx = 0
        while idx < queue.count {
            let cur = queue[idx]
            idx += 1
            if win[cur] != nil {
                queue.append(contentsOf: win[cur]!)
            }
        }
        print(queue)
        tempCount += Set(queue).count
        //진거
        queue = lose[i] ?? []
        idx = 0
        while idx < queue.count {
            let cur = queue[idx]
            idx += 1
            if lose[cur] != nil {
                queue.append(contentsOf: lose[cur]!)
            }
        }
        tempCount += Set(queue).count
        if tempCount == n - 1 {
            result += 1
        }
    }
    return result
}
solution(5, [[3, 5], [4, 2], [4, 5], [5, 1], [5, 2]])
//print(solution(5, [[4, 3], [4, 2], [3, 2], [1, 2], [2, 5]]), 2)
//print(solution(7, [[4, 3], [4, 2], [3, 2], [1, 2], [2, 5], [5,6], [6,7]]), 4)
//print(solution(6, [[1,2], [2,3], [3,4], [4,5], [5,6]]), 6)
//print(solution(5, [[1, 4], [4, 2], [2, 5], [5, 3]]), 5)
//print(solution(5, [[3, 5], [4, 2], [4, 5], [5, 1], [5, 2]]), 1)
//print(solution(3, [[1,2],[1,3]]), 1)
//print(solution(6, [[1,6],[2,6],[3,6],[4,6]]), 0)
//print(solution(8, [[1,2],[3,4],[5,6],[7,8]]),0)
//print(solution(9, [[1,2],[1,3],[1,4],[1,5],[6,1],[7,1],[8,1],[9,1]]), 1)
//print(solution(6, [[1,2],[2,3],[3,4],[4,5],[5,6],[2,4],[2,6]]), 6)
//print(solution(4, [[4,3],[4,2],[3,2],[3,1],[4,1], [2,1]]), 4)
//print(solution(3,[[3,2],[3,1]]), 1)
//print(solution(4, [[1,2],[1,3],[3,4]]), 1)
