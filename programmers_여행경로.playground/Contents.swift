import Foundation
func solution(_ tickets:[[String]]) -> [String] {
    
    var result: [String] = []
    var sortedTickets = tickets.sorted { $0[1] < $1[1] }
    var check = [Bool](repeating: false, count: sortedTickets.count)
    
    func dfs(_ start: String) {
        if result.count == sortedTickets.count {
            result.append(start)
            return
        }
        for i in 0..<sortedTickets.count {
            if start == sortedTickets[i][0] && !check[i] {
                check[i] = true
                result.append(start)
                dfs(sortedTickets[i][1])
                if result.count == sortedTickets.count + 1 {
                    return
                }
                result.removeLast()
                check[i] = false
            }
        }
    }
    dfs("ICN")
    return result
}
