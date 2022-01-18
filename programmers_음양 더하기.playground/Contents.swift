import Foundation

func solution(_ absolutes:[Int], _ signs:[Bool]) -> Int {
    
    var result: Int = 0
    
    for i in 0..<absolutes.count {
        if signs[i] == false {
            result += -Int(absolutes[i])
        } else {
            result += Int(absolutes[i])
        }
    }
    return result
}
