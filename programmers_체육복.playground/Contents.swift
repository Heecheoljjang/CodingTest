import Foundation

func solution(_ n: Int, _ lost: [Int], _ reserve: [Int]) -> Int {
    
    var count: Int = n - lost.count
    var reserve: [Int] = reserve
    var lost: [Int] = lost
    
    reserve = reserve.sorted { $0 < $1}
    lost = lost.sorted{$0 < $1}
    
    for i in reserve { //여분이 있는 사람이 도난 당한 경우
        if lost.contains(i) {
            reserve.remove(at: reserve.firstIndex(of: i)!) //reserve에서 지워줌
            lost.remove(at: lost.firstIndex(of: i)!)
            count += 1
        }
    }

    for i in lost {
        if reserve.contains(i - 1) {
            count += 1
            reserve.remove(at: reserve.firstIndex(of: i - 1)!)
        } else if reserve.contains(i + 1){
            count += 1
            reserve.remove(at: reserve.firstIndex(of: i + 1)!)
        } else {
            continue
        }
    }
    return count
}

solution(30, [1,2,7,9,10,11,12,14,15,16,18,20,21,24,25,27], [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,20,22,23,24,25,26,27,28])
