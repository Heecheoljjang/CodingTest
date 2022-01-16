import Foundation

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {

    var reportList: [String: String] = [:]
    let setList = Set(report)
    var removedList = Array(setList)
    
    for i in 0..<removedList.count {
        reportList.updateValue(removedList[i].components(separatedBy: " ")[1], forKey: removedList[i].components(separatedBy: " ")[0])
    }
    
    return []
}


