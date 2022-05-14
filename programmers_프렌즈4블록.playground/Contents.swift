import Foundation

func solution(_ m:Int, _ n:Int, _ board:[String]) -> Int {

    var block: [[String.Element]] = []
    var count: Int = 0
    // 2차원 배열로 만들어줌
    for i in board {
        block.append(Array(i))
    }
    // m, n 을 이용해 중첩 for문을 돌려서 4개를 만족하면 temp에 넣어주고 값을 O로 바꿔줌. 블록을 다시 배열하는 함수를 구현 후 다시 반복
    // 탐색해서 지우는 함수와 배열하는 함수 구현
    
    // 탐색하는 함수
    func check(_ arr: [[String.Element]], _ m: Int, _ n: Int) -> [[String.Element]] {
        
        var delete: [String] = []
        var newArr: [[String.Element]] = arr
        
        // m 높이, n 폭인데 마지막 칸의 오른쪽과 아래를 확인하면 범위를 벗어나므로
        for i in 0..<m-1 {
            for j in 0..<n-1 {
                // 빈 칸은 "X"로 할 예정이기 때문
                if newArr[i][j] != "X" {
                    let temp = newArr[i][j]
                    // 네 칸이 다 같은 경우
                    if newArr[i][j+1] == temp && newArr[i+1][j] == temp && newArr[i+1][j+1] == temp {
                        delete.append("arr[\(i)][\(j)]")
                        delete.append("arr[\(i+1)][\(j)]")
                        delete.append("arr[\(i)][\(j+1)]")
                        delete.append("arr[\(i+1)][\(j+1)]")
                        // 지운 부분은 "X"로
                        newArr[i][j] = "X"
                        newArr[i+1][j] = "X"
                        newArr[i][j+1] = "X"
                        newArr[i+1][j+1] = "X"
                    } else {
                        continue
                    }
                }
            }
        }
        // delete에서 중복되는 것을 지워준 뒤 count 계산
        count += Set(delete).count
        
        return newArr
    }
    // 새로 배열하는 함수
    func makeNewArr(_ arr: [[String.Element]], _ m: Int, _ n: Int) -> [[String.Element]]{
        
        var newArr: [[String.Element]] = arr
        var checkN: Int = 0
        
        // 새로로 한 줄씩 확인하면서 X인 부분이 있으면 아래로 내려줌
        while checkN < n+1 {
            for i in 0..<m-1 {
                if newArr[checkN][i] != "X" {
                    if newArr[checkN][i+1] == "X" {
                        // 위에를 X로 만들고 아래의 X값을 바꿔줌
                        newArr[checkN][i+1] == newArr[checkN][i]
                        newArr[checkN][i] == "X"
                    }
                }
            }
            
            checkN += 1
        }
        
        
        return newArr
    }
    
    
    return count
}
solution(4, 5, ["CCBDE", "AAADE", "AAABF", "CCBBF"])
