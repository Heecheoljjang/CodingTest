import Foundation

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    
    var reported: [String] = []
    var temp: [String: Int] = [:]
    var result: [String: Int] = [:]
    var resultCount: [Int] = []
    
    for i in report {
        reported.append(i.components(separatedBy: " ")[1])
    }
    
    for i in reported {
        if temp.keys.contains(i) {
            temp[i]! += 1
        } else {
            temp.updateValue(1, forKey: i)
        }
    }
    reported = []
    for i in temp {
        if i.value >= k {
            reported.append(i.key)
        }
    }
    print(reported)
    for i in report {
        if reported.contains(i.components(separatedBy: " ")[1]) {
            if result.keys.contains(i.components(separatedBy: " ")[0]) {
                result[i.components(separatedBy: " ")[0]]! += 1
            } else {
                result.updateValue(1, forKey: i.components(separatedBy: " ")[0])
            }
        }
    }
    for i in id_list {
        if result.keys.contains(i) {
            resultCount.append(result[i]!)
        } else {
            resultCount.append(0)
        }
    }
    
    return resultCount
}
solution(["muzi", "frodo", "apeach", "neo"], ["muzi frodo","apeach frodo","frodo neo","muzi neo","apeach muzi"], 2)
