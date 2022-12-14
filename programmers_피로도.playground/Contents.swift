import Foundation

func solution(_ k:Int, _ dungeons:[[Int]]) -> Int {
    guard dungeons.filter { $0[0] <= k }.count != 0 else { return 0 }
    var result = 0
    var check = [Bool](repeating: false, count: dungeons.count)
    
    func dfs(_ arr: [[Int]], _ currentCheck: [Bool], _ k: Int) {
        var currentCheck = currentCheck
        var temp: [[Int]] = arr
        if arr.count == dungeons.count {
            result = arr.count
            return
        }
        for i in 0..<dungeons.count {
            if !currentCheck[i] && dungeons[i][0] <= k {
                currentCheck[i] = true
                dfs(temp + [dungeons[i]], currentCheck, k - dungeons[i][1])
                currentCheck[i] = false
            } else {
                result = result < arr.count ? arr.count : result
            }
        }
    }
    
    dfs([], check, k)
    
    return result
}
