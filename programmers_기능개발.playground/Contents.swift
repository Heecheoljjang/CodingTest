import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {

    var progress = progresses
    let speed = speeds
    var result: [Int] = []
    var temp: [Int] = []
    var count = 0

    while progress.count != 0 {
        progress = zip(progress, speed).map{$0 + $1}
        if progress[0] >= 100 {
            for i in progress {
                if i >= 100 {
                    temp.append(i)
                } else {
                    break
                }
            }
            count = temp.count
            result.append(count)
            progress.removeSubrange(0..<count)
            temp = []
        }
    }
    return result
}

