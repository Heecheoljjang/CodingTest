import Foundation

func solution(_ sizes:[[Int]]) -> Int {
    
    //가로 세로 회전가능하므로 구분할 필요없이 0번인덱스를 길이가 긴쪽, 1번 인덱스를 길이가 짧은쪽
    var max = 0
    var min = 0
    
    for size in sizes {
        let tempMax = size.sorted(by: >)[0]
        let tempMin = size.sorted(by: >)[1]
        
        if tempMax > max {
            max = tempMax
        }
        if tempMin > min {
            min = tempMin
        }
    }
    
    return max * min
}
