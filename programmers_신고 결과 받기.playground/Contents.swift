import Foundation

//func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
//
//    let setList = Set(report)
//    let removedList = Array(setList) //중복제거
//
//    var reportList: [String: String] = [:]
//    var mail: [String: Int] = [:]
//
//    for i in 0..<id_list.count {
//        mail.updateValue(0, forKey: id_list[i])
//    }
//
//    for i in 0..<removedList.count {
//        reportList.updateValue(removedList[i].components(separatedBy: " ")[1], forKey: removedList[i].components(separatedBy: " ")[0])
//        print(reportList)
//    }
//
//    reportList = reportList.filter{$0.value.count >= k} // 신고횟수가 k번을 넘은 것들만 남김
//    print(reportList)
//    for value in reportList.values {
//        mail[value]! += 1
//    }
//    print(mail)
//    return mail.map{$0.value}
//}
//
//solution(["muzi", "frodo", "apeach", "neo"], ["muzi frodo", "apeach frodo", "frodo neo", "muzi neo", "apeach muzi"], 2)
func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {

    
    
    return []
}
