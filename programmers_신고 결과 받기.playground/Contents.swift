import Foundation

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    
    let report = Array(Set(report)) // 중복제거
    var idIndex: [String: Int] = [:]
    var resultCount = [Int](repeating: 0, count: id_list.count)
    var reported: [String: [String]] = [:]
    
    // id_list의 인덱스 -> for문으로 id_list 돌리면 시간 낭비
    for (i, id) in id_list.enumerated() {
        idIndex[id] = i
    }
    // 신고 당한 횟수 구하기
    for i in report {
        let reportId = i.components(separatedBy: " ")[0]
        let reportedId = i.components(separatedBy: " ")[1]
        if reported[reportedId] == nil {
            reported[reportedId] = [reportId]
        } else {
            reported[reportedId]?.append(reportId)
        }
    }
    for i in reported {
        if i.value.count >= k {
            for j in i.value {
                resultCount[idIndex[j]!] += 1
            }
        }
    }
    return resultCount
}

solution(["muzi", "frodo", "apeach", "neo"], ["muzi frodo","apeach frodo","frodo neo","muzi neo","apeach muzi"], 2)


//enumerate정리
