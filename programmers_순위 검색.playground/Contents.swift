import Foundation

func solution(_ info:[String], _ query:[String]) -> [Int] {
    
    var devInfo: [Int: [Int]] = [:]
    var tempInfo: [Int: [Int]] = [:]
    var result: [Int] = []
    
    for i in 0..<info.count {
        let lan = info[i].split(separator: " ")[0]
        let job = info[i].split(separator: " ")[1]
        let career = info[i].split(separator: " ")[2]
        let food = info[i].split(separator: " ")[3]
        let score = info[i].split(separator: " ")[4]
        
        var temp: [Int] = []
        
        switch lan {
        case "cpp":
            temp.append(1)
        case "java":
            temp.append(2)
        case "python":
            temp.append(3)
        default: // '-'인 경우
            temp.append(0)
        }
        
        switch job {
        case "backend":
            temp.append(1)
        case "frontend":
            temp.append(2)
        default:
            temp.append(0)
        }
        
        switch career {
        case "junior":
            temp.append(1)
        case "senior":
            temp.append(2)
        default:
            temp.append(0)
        }
        
        switch food {
        case "chicken":
            temp.append(1)
        case "pizza":
            temp.append(2)
        default:
            temp.append(0)
        }
        
        temp.append(Int(score)!)
        
        devInfo.updateValue(temp, forKey: i)
        temp = []
    }
    print("devInfo: \(devInfo)")
    // query 돌면서 확인
    for query in query {
        let temp = query.split(separator: " ").filter {$0 != "and"}
        var tempInt: [Int] = []
        var tempIndex: [Int] = []
        
        for i in 0..<5 {
            // 언어
            if i == 0 {
                switch temp[i] {
                case "cpp":
                    tempInt.append(1)
                case "java":
                    tempInt.append(2)
                case "python":
                    tempInt.append(3)
                default:
                    tempInt.append(0)
                }
            } else if i == 1 {
                switch temp[i] {
                case "backend":
                    tempInt.append(1)
                case "frontend":
                    tempInt.append(2)
                default:
                    tempInt.append(0)
                }
            } else if i == 2 {
                switch temp[i] {
                case "junior":
                    tempInt.append(1)
                case "senior":
                    tempInt.append(2)
                default:
                    tempInt.append(0)
                }
            } else if i == 3 {
                switch temp[i] {
                case "chicken":
                    tempInt.append(1)
                case "pizza":
                    tempInt.append(2)
                default:
                    tempInt.append(0)
                }
            } else {
                tempInt.append(Int(temp[i])!)
            }
        }
        // 점수로 먼저 필터링하고 다시 필터링. 이때 -인 경우 체크해주기
        // 어떤 값이 0인지 확인해야함
        for (index, i) in tempInt.enumerated() {
            if i != 0 && index != 4{
                tempIndex.append(index)
            }
            print("index: \(index), i: \(i)")
        }
        print(tempIndex)
        tempInfo = devInfo.filter {$0.value[4] >= tempInt[4]}
        print("score: \(tempInt[4]), tempInfo: \(tempInfo)")
        for i in tempIndex {
            print("tempIndex: \(tempIndex), i: \(i)")
            tempInfo = tempInfo.filter {$0.value[i] == tempInt[i]}
            print("afterTempInfo: \(tempInfo)")
        }
        print("lastInfo: \(tempInfo)")
        result.append(tempInfo.count)
        tempInt = []
        tempIndex = []
    }
    return result
}
solution(["java backend junior pizza 150","python frontend senior chicken 210","python frontend senior chicken 150","cpp backend senior pizza 260","java backend junior chicken 80","python backend senior chicken 50"], ["java and backend and junior and pizza 100","python and frontend and senior and chicken 200","cpp and - and senior and pizza 250","- and backend and senior and - 150","- and - and - and chicken 100","- and - and - and - 150"])
// 0인 경우엔 모든 경우가 포함되는 것이므로 다시 생각해야함
