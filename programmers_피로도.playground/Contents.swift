import Foundation

func solution(_ k:Int, _ dungeons:[[Int]]) -> Int {
    guard dungeons.filter { $0[0] <= k }.count != 0 else { return 0 }
    var result = 0
    var check = [Bool](repeating: false, count: dungeons.count)
    
    func dfs(_ arr: [[Int]], _ k: Int) {
        var temp: [[Int]] = arr
        if arr.count == dungeons.count {
            result = arr.count
            return
        }
        for i in 0..<dungeons.count {
            if !check[i] && dungeons[i][0] <= k {
                check[i] = true
                dfs(temp + [dungeons[i]], k - dungeons[i][1])
                check[i] = false
            } else {
                result = result < arr.count ? arr.count : result
            }
        }
    }
    
    dfs([], k)
    
    return result
}
