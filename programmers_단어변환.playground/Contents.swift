import Foundation

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    
    guard words.contains(target) else { return 0 }
    var result: [[String]] = []
    var check = [Bool](repeating: false, count: words.count)
    
    func dfs(_ used: [String]) {
        if used.last! == target {
            result.append(used)
            return
        }
        for i in 0..<words.count {
            if !check[i] {
                var count = 0
                let nextArr = words[i].map { "\($0)" }
                let lastArr = used.last!.map { "\($0)" }
                for j in 0..<lastArr.count {
                    if lastArr[j] == nextArr[j] {
                        count += 1
                    }
                }
                if count == nextArr.count - 1 {
                    check[i] = true
                    dfs(used + [words[i]])
                    check[i] = false
                }
            }
        }
    }
    dfs([begin])
    return result.map { $0.count }.min()! - 1
}
