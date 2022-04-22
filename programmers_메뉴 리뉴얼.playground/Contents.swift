import Foundation

func solution(_ orders:[String], _ course:[Int]) -> [String] {
    
    
    var menu: [String: Int] = [:]
    var sortedOrder: [String] = []
    
    for i in orders {
        var temp = i.sorted(by: <)
        sortedOrder.append(temp)
    }
    
    
    return []
}

solution(["ABCDE", "AB", "CD", "ADE", "XYZ", "XYZ", "ACD"], [2,3,5])
