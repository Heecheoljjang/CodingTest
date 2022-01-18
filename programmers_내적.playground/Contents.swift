import Foundation

func solution(_ a:[Int], _ b:[Int]) -> Int {
    
    var add: [Int] = []
    
    for i in 0..<a.count {
        add.append(a[i] * b[i])
    }
    return add.reduce(0){$0 + $1}
}
