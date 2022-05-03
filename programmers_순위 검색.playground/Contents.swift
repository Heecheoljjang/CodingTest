//import Foundation
//
//func solution(_ info:[String], _ query:[String]) -> [Int] {
//
//    var devInfo: [Int: [Int]] = [:]
//    var tempInfo: [Int: [Int]] = [:]
//    var result: [Int] = []
//
//    for i in 0..<info.count {
//        let lan = info[i].split(separator: " ")[0]
//        let job = info[i].split(separator: " ")[1]
//        let career = info[i].split(separator: " ")[2]
//        let food = info[i].split(separator: " ")[3]
//        let score = info[i].split(separator: " ")[4]
//
//        var temp: [Int] = []
//
//        switch lan {
//        case "cpp":
//            temp.append(1)
//        case "java":
//            temp.append(2)
//        case "python":
//            temp.append(3)
//        default: // '-'인 경우
//            temp.append(0)
//        }
//
//        switch job {
//        case "backend":
//            temp.append(1)
//        case "frontend":
//            temp.append(2)
//        default:
//            temp.append(0)
//        }
//
//        switch career {
//        case "junior":
//            temp.append(1)
//        case "senior":
//            temp.append(2)
//        default:
//            temp.append(0)
//        }
//
//        switch food {
//        case "chicken":
//            temp.append(1)
//        case "pizza":
//            temp.append(2)
//        default:
//            temp.append(0)
//        }
//
//        temp.append(Int(score)!)
//
//        devInfo.updateValue(temp, forKey: i)
//        temp = []
//    }
//    print("devInfo: \(devInfo)")
//    // query 돌면서 확인
//    for query in query {
//        let temp = query.split(separator: " ").filter {$0 != "and"}
//        var tempInt: [Int] = []
//        var tempIndex: [Int] = []
//
//        for i in 0..<5 {
//            // 언어
//            if i == 0 {
//                switch temp[i] {
//                case "cpp":
//                    tempInt.append(1)
//                case "java":
//                    tempInt.append(2)
//                case "python":
//                    tempInt.append(3)
//                default:
//                    tempInt.append(0)
//                }
//            } else if i == 1 {
//                switch temp[i] {
//                case "backend":
//                    tempInt.append(1)
//                case "frontend":
//                    tempInt.append(2)
//                default:
//                    tempInt.append(0)
//                }
//            } else if i == 2 {
//                switch temp[i] {
//                case "junior":
//                    tempInt.append(1)
//                case "senior":
//                    tempInt.append(2)
//                default:
//                    tempInt.append(0)
//                }
//            } else if i == 3 {
//                switch temp[i] {
//                case "chicken":
//                    tempInt.append(1)
//                case "pizza":
//                    tempInt.append(2)
//                default:
//                    tempInt.append(0)
//                }
//            } else {
//                tempInt.append(Int(temp[i])!)
//            }
//        }
//        // 점수로 먼저 필터링하고 다시 필터링. 이때 -인 경우 체크해주기
//        // 어떤 값이 0인지 확인해야함
//        for (index, i) in tempInt.enumerated() {
//            if i != 0 && index != 4{
//                tempIndex.append(index)
//            }
//            print("index: \(index), i: \(i)")
//        }
//        print(tempIndex)
//        tempInfo = devInfo.filter {$0.value[4] >= tempInt[4]}
//        print("score: \(tempInt[4]), tempInfo: \(tempInfo)")
//        for i in tempIndex {
//            print("tempIndex: \(tempIndex), i: \(i)")
//            tempInfo = tempInfo.filter {$0.value[i] == tempInt[i]}
//            print("afterTempInfo: \(tempInfo)")
//        }
//        print("lastInfo: \(tempInfo)")
//        result.append(tempInfo.count)
//        tempInt = []
//        tempIndex = []
//    }
//    return result
//}
//solution(["java backend junior pizza 150","python frontend senior chicken 210","python frontend senior chicken 150","cpp backend senior pizza 260","java backend junior chicken 80","python backend senior chicken 50"], ["java and backend and junior and pizza 100","python and frontend and senior and chicken 200","cpp and - and senior and pizza 250","- and backend and senior and - 150","- and - and - and chicken 100","- and - and - and - 150"])
// 0인 경우엔 모든 경우가 포함되는 것이므로 다시 생각해야함
// 위의 방법은 for문을 이용해서 모든 경우를 따지는 방법이었다. 효율성에서 시간 초과가 나왔기때문에 다른 방법으로 풀어야 될 것이다. 위에선 개발자들의 정보를 딕셔너리에 저장을 해서 조건에 해당하는 사람을 찾는 방식이었지만 효율성을 해결해야하므로 info에 주어진 정보로 만들 수 있는 모든 쿼리를 만들어놓고 이진탐색을 통해 점수 조건을 만족하는 count를 찾는 방법을 구현 -> 검색한 자료 참고

import Foundation

func solution(_ info:[String], _ query:[String]) -> [Int] {

    var devData: [String: [Int]] = [:]
    var result: [Int] = []

    // 모든 경우 구함
    for i in info {
        let lan = i.split(separator: " ")[0]
        let job = i.split(separator: " ")[1]
        let career = i.split(separator: " ")[2]
        let food = i.split(separator: " ")[3]
        let score = i.split(separator: " ")[4]
        // 많지 않으므로 전부 직접 작성 -> 16가지
        let str: [String] = ["\(lan) and \(job) and \(career) and \(food)", "- and \(job) and \(career) and \(food)", "\(lan) and - and \(career) and \(food)", "\(lan) and \(job) and - and \(food)", "\(lan) and \(job) and \(career) and -", "- and - and \(career) and \(food)", "- and \(job) and - and \(food)", "- and \(job) and \(career) and -", "\(lan) and - and - and \(food)", "\(lan) and - and \(career) and -", "\(lan) and \(job) and - and -", "- and - and - and \(food)", "- and - and \(career) and -", "- and \(job) and - and -", "\(lan) and - and - and -", "- and - and - and -"
        ]
        for string in str {
            if devData[string] == nil {
                devData[string] = [Int(score)!]
            } else {
                devData[string]?.append(Int(score)!)
            }
        }
    }
    // 아래 query반복문에서 sort를 매번했을땐 시간초과였음. devData도 클 것 같아 큰 차이 없을 것 같았지만 반복문을 한 번 더 이용하더라도 시간이 덜 걸리는 것을 확인함.
    for i in devData {
        let sorted = i.value.sorted(by: <)
        devData[i.key] = sorted
    }
    //쿼리를 돌며 count 계산 -> 점수 넘는 사람
    for query in query {
        var split = query.split(separator: " ")
        let score:Int = Int(split.removeLast())!
        let key = String(split.joined(separator: " "))
        //let key = query.replacingOccurrences(of: String(score), with: "")
        
        if devData[key] == nil {
            result.append(0)
        } else {
            result.append(bs(devData[key]!, score))
        }
    }
    return result
}
//이진탐색 함수 구현
func bs(_ scores: [Int], _ targetScore: Int) -> Int {
    
    if scores.count == 1 && scores[0] >= targetScore {
        return 1
    }
    if scores.first! >= targetScore {
        return scores.count
    }
    if scores.last! < targetScore {
        return 0
    }
    var start: Int = 0
    var end: Int = scores.count - 1
    
    while start < end {
        let mid = (start + end) / 2
        
        if scores[mid] >= targetScore {
            end = mid
        } else {
            start = mid + 1
        }
    }
    return scores.count - start
}
solution(["java backend junior pizza 150","python frontend senior chicken 210","python frontend senior chicken 150","cpp backend senior pizza 260","java backend junior chicken 80","python backend senior chicken 50"], ["java and backend and junior and pizza 100","python and frontend and senior and chicken 200","cpp and - and senior and pizza 250","- and backend and senior and - 150","- and - and - and chicken 100","- and - and - and - 150"])
