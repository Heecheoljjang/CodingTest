import Foundation

func solution(_ operations:[String]) -> [Int] {
    
    var queue: [Int] = []
    
    for i in 0..<operations.count {
        let input = operations[i].components(separatedBy: " ")
        if input[0] == "I" {
            queue.append(Int(input[1])!)
            queue.sort { $0 > $1 }
        } else if input[0] == "D" {
            if queue.count == 0 {
                continue
            }
            if input[1] == "1" {
                queue.removeFirst()
            } else {
                queue.removeLast()
            }
        }
    }
    
    let count = queue.count
    if count == 0 {
        return [0,0]
    } else if count == 1 {
        return [queue[0], queue[0]]
    } else {
        return [queue[0], queue[count - 1]]
    }
}
