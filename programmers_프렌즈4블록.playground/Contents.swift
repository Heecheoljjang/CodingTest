import Foundation

func solution(_ m:Int, _ n:Int, _ board:[String]) -> Int {

    var block: [[String.Element]] = []
    var count: Int = 0
    // while문을 끝내기 위해
    var checkSame: Int = 0
    // 2차원 배열로 만들어줌
    for i in board {
        block.append(Array(i))
    }
    // m, n 을 이용해 중첩 for문을 돌려서 4개를 만족하면 temp에 넣어주고 값을 O로 바꿔줌. 블록을 다시 배열하는 함수를 구현 후 다시 반복
    // 탐색해서 지우는 함수와 배열하는 함수 구현
    
    // 탐색하는 함수
    func check(_ arr: [[String.Element]], _ m: Int, _ n: Int) -> [[String.Element]]{
        
        var delete: [[Int]] = []
        var newArr: [[String.Element]] = arr
        
        // m 높이, n 폭인데 마지막 칸의 오른쪽과 아래를 확인하면 범위를 벗어나므로
        for i in 0..<m-1 {
            for j in 0..<n-1 {
                // 빈 칸은 "X"로 할 예정이기 때문
                if newArr[i][j] != "X" {
                    let temp = newArr[i][j]
                    // 네 칸이 다 같은 경우
                    if newArr[i][j+1] == temp && newArr[i+1][j] == temp && newArr[i+1][j+1] == temp {
                        delete.append([i,j])
                        delete.append([i+1,j])
                        delete.append([i,j+1])
                        delete.append([i+1,j+1])
                        
                    } else {
                        continue
                    }
                }
            }
        }
        // delete에서 중복되는 것을 지워준 뒤 count 계산
        count += Set(delete).count
        // 지운 부분은 "X"로
        for i in delete {
            newArr[i[0]][i[1]] = "X"
        }
        if newArr == arr {
            checkSame = 1
        }
        return newArr
    }
    // 새로 배열하는 함수
    func makeNewArr(_ arr: [[String.Element]], _ m: Int, _ n: Int) -> [[String.Element]] {
        
        var newArr: [[String.Element]] = arr
        var tempNum: Int = 0
        
        // 세로로 한 줄씩 확인. 이때 아래에서부터 확인해야 더 간단함.
        for i in 0..<n {
            for j in (1..<m).reversed() {
                if newArr[j][i] == "X" {
                    tempNum = j
                    while tempNum >= 0 {
                        if newArr[tempNum][i] != "X" {
                            newArr[j][i] = newArr[tempNum][i]
                            newArr[tempNum][i] = "X"
                            break
                        } else {
                            tempNum -= 1
                        }
                    }
                }
            }
        }
        return newArr
    }
    while checkSame != 1 {
        block = check(block, m, n)
        block = makeNewArr(block, m, n)
    }
    return count
}
solution(4, 5, ["CCBDE", "AAADE", "AAABF", "CCBBF"])
