import Foundation

func solution(_ n:Int, _ info:[Int]) -> [Int] {

    var result: [[[Int]]] = [] // [[[과녁],[점수]]]
    var apeach = 0
    for i in 0..<10 {
        if info[i] != 0 {
            apeach -= 10 - i
        }
    }
    var maxScore = 0
    func dfs(_ arr: [Int], _ count: Int, _ score: Int, _ idx: Int) {
        var temp = arr
        if count == n || idx == 10 {
            temp[10] = n - count
            if score > 0 {
                result.append([temp,[score]])
                maxScore = max(maxScore, score)
            }
            return
        }
        //맞췄을 때
        if n - count >= info[idx] + 1 {
            temp[idx] = info[idx] + 1
            if info[idx] == 0 {
                dfs(temp, count + info[idx] + 1, score + 10 - idx, idx + 1)
            } else {
                dfs(temp, count + info[idx] + 1, score + 20 - idx * 2, idx + 1)
            }
        }
        //못
        temp[idx] = 0
        dfs(temp,count, score, idx + 1)
    }
    dfs([0,0,0,0,0,0,0,0,0,0,0],0,apeach,0)
    result = result.filter { $0[1][0] == maxScore }
    if result.count == 0 {
        return [-1]
    }
    for i in stride(from: 10, through: 0, by: -1) {
        var temp = [0,0] //idx,화살수
        for j in 0..<result.count {
            if result[j][0][i] != 0 && temp[1] < result[j][0][i] {
                temp[0] = j
                temp[1] = result[j][0][i]
            }
        }
        if temp != [0,0] {
            return result[temp[0]][0]
        }
    }
    return result[0][0]
}
solution(9, [0,0,1,2,0,1,1,1,1,1])
