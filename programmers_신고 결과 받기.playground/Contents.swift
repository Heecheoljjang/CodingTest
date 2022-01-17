import Foundation

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {

    let setList = Set(report)
    let removedList = Array(setList)

    var reportDic = [String: [String]]()
    var reported: [String] = []
    var arrest: [String] = []
    var mailCount: [String: Int] = [:]
    var count: [Int] = []
    
    for i in 0..<id_list.count {
        mailCount.updateValue(0, forKey: id_list[i])
    }

    for i in 0..<removedList.count {
        reported.append(removedList[i].components(separatedBy: " ")[1])
    }
    for id in reported {
        if reported.filter{$0 == id}.count >= k {
            if !arrest.contains(id){
                arrest.append(id)
            }
        }
    }

    for i in 0..<removedList.count {
        if reportDic.keys.contains(removedList[i].components(separatedBy: " ")[0]) {
            reportDic[removedList[i].components(separatedBy: " ")[0]]?.append(removedList[i].components(separatedBy: " ")[1])
        } else {
            reportDic.updateValue([removedList[i].components(separatedBy: " ")[1]], forKey: removedList[i].components(separatedBy: " ")[0])
        }
    }
    
    for key in reportDic.keys {
        for id in arrest {
            if reportDic[key]!.contains(id) {
                mailCount[key]! += 1
            }
        }
    }
    for id in id_list {
        count.append(mailCount[id]!)
    }
    return count
}

