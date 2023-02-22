import Foundation

func solution(_ n:Int, _ edge:[[Int]]) -> Int {
    
    var result = 0
    var dic: [Int:[Int]] = [:]
    // var visited = Array(repeating: Array(repeating: -1, count: n + 1), count: n + 1)
    var visited = Array(repeating: false, count: n + 1)
    for i in 0..<edge.count {
        if dic[edge[i][0]] == nil {
            dic[edge[i][0]] = [edge[i][1]]
        } else {
            dic[edge[i][0]]!.append(edge[i][1])
        }
        if dic[edge[i][1]] == nil {
            dic[edge[i][1]] = [edge[i][0]]
        } else {
            dic[edge[i][1]]!.append(edge[i][0])
        }
    }
    print(dic)
    visited[1] = true
    var queue = dic[1]!
    result = queue.count
    while !queue.isEmpty {
        result = queue.count
        print(result)
        var temp: [Int] = []
        var second: [Int] = []
        for i in 0..<queue.count {
            if visited[queue[i]] {
                continue
            }
            if dic[queue[i]] != nil {
                visited[queue[i]] = true
                temp.append(contentsOf: dic[queue[i]]!)
            }
        }
        temp = Array(Set(temp))
        for i in 0..<temp.count {
            if !visited[temp[i]] {
                second.append(temp[i])
            }
        }
        queue = second
    }
    return result
}
solution(6,[[3, 6], [4, 3], [3, 2], [1, 3], [1, 2], [2, 4], [5, 2]])
