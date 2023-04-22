import Foundation

func solution(_ n:Int, _ wires:[[Int]]) -> Int {
    
    var result = 99999
    
    if n == 2 {
        return 0
    }
    
    for i in 0..<wires.count {
        var dic: [Int: [Int]] = [:]
        var visited = Array(repeating: 0, count: n + 1)
        var newA: [[Int]] = []
        if i == wires.count - 1{
            newA = Array(wires[0..<i])
        } else {
            newA = Array(wires[0..<i] + wires[i+1..<wires.count])
        }
        //딕셔너리 생성
        for j in 0..<newA.count {
            let f = newA[j][0]
            let s = newA[j][1]
            
            if dic[f] == nil {
                dic[f] = [s]
            } else {
                dic[f]!.append(s)
            }
            if dic[s] == nil {
                dic[s] = [f]
            } else {
                dic[s]!.append(f)
            }
        }
        //두 덩어리 개수 각각 구하기
        var queue = [1]
        var count = 1
        visited[1] = 1
        while !queue.isEmpty {
            let cur = queue.removeFirst()
            // print("cur \(cur)")
            // // print("dic \(dic)")
            // print("count \(count)")
            // print("dic[cur] = \(dic[cur])")
            if dic[cur] == nil {
                continue
            }
            var temp = 0
            for num in dic[cur]! {
                if visited[num] == 1 {
                    continue
                }
                // print("num \(num)")
                queue.append(num)
                count += 1
                visited[num] = 1
            }
            // queue.append(contentsOf: dic[cur]!)
            // visited[cur] = 1
            // print("visited \(visited)")
            // count += 1
        }
        // if count == 0 {
        //     result = n - 2
        // } else {
        //     result = min(result,abs(count - (n - count)))
        // }
        result = min(result,abs(count - (n - count)))
        // print("@@@@@@@@@@@@@@@@result@@@@@@@@@@@@@@@@@@")
        // print(result,"\n")
    }
    
    return result
}
