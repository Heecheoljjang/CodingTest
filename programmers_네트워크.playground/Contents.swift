import Foundation

func solution(_ n:Int, _ computers:[[Int]]) -> Int {

    var result = 0
    var visited = Array(repeating: false, count: n)
    var queue: [Int] = []
    
    for i in 0..<n {
        if visited[i] {
            continue
        }
        result += 1
        queue.append(i)
        visited[i] = true
        var idx = 0
        while idx < queue.count {
            let current = queue[idx]
            idx += 1
            for j in 0..<n {
                if computers[current][j] == 1 && !visited[j] {
                    queue.append(j)
                    visited[j] = true
                }
            }
        }
    }
    return result
}
