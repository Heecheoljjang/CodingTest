import Foundation

func solution(_ rows:Int, _ columns:Int, _ queries:[[Int]]) -> [Int] {
    
    var matrix: [[Int]] = []
    var number: Int = 1
    var result: [Int] = [] // 가장 작은 수들을 담을 배열
    
    //행렬 만들기
    for _ in 0..<rows {
        var temp: [Int] = []
        for _ in 0..<columns {
            temp.append(number)
            number += 1
        }
        matrix.append(temp)
    }
    
    // 각 줄마다 마지막 요소를 빼고 밀기
    for query in queries {
        var tempFirst: Int = 0
        var tempSecond: Int = 0
        //윗줄
        tempFirst = matrix[query[0]][query[3]] // 윗 줄의 가장 오른쪽 요소
        
        
    }
    
    return []
}
solution(6, 6, [[]])
