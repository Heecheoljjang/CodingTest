import Foundation

func solution(_ n:Int, _ costs:[[Int]]) -> Int {
    var parent = Array(repeating: 0, count: n)
    for i in 0..<n {
        parent[i] = i
    }
    
    func findParent(_ element: Int) -> Int {
        if parent[element] != element {
            return findParent(parent[element])
        } else {
            return element
        }
    }
    
    func union(_ first: Int, _ second: Int) {
        let fP = findParent(first)
        let sP = findParent(second)
        if fP < sP {
            parent[sP] = fP
        } else {
            parent[fP] = sP
        }
    }
    
    var result = 0
    for cost in costs.sorted(by: { $0[2] < $1[2] }) {
        if findParent(cost[0]) != findParent(cost[1]) {
            union(cost[0], cost[1])
            result += cost[2]
        }
    }
    return result
}
solution(4, [[0,1,1],[0,2,2],[1,2,5],[1,3,1],[2,3,8]])
