import Foundation

let caseCount = Int(readLine()!)!
outer: for _ in 0..<caseCount {
    let command = readLine()!
    let _ = Int(readLine()!)!
    var numbers = readLine()!.dropFirst().dropLast().split(separator: ",")
    
    var isR = false
    var head = 0
    var tail = numbers.count - 1
    
    for char in command {
        if char == "R" {
            isR.toggle()
        } else {
            if tail < head {
                print("error")
                continue outer
            }
            if isR {
                tail -= 1
            } else {
                head += 1
            }
        }
    }
    if head > tail {
        print("[]")
    } else {
        if isR {
            numbers = numbers[head...tail].reversed()
        } else {
            numbers = Array(numbers[head...tail])
        }
        print("[\(numbers.joined(separator: ","))]")
    }
}
