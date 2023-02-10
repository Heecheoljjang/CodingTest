import Foundation

func solution(_ today:String, _ terms:[String], _ privacies:[String]) -> [Int] {
    
    var result: [Int] = []
    var termDate: [String:String] = [:]
    let todayArr = today.split(separator: ".")
    print(todayArr)
    let todayYear = Int(todayArr[0])!; let todayMonth = Int(todayArr[1])!; let todayDay = Int(todayArr[2])!
    print(todayYear,todayDay,todayMonth)
    for i in 0..<terms.count {
        //빼고 +1
        var temp = ""
        let term = String(terms[i].split(separator: " ")[0])
        let num = Int(terms[i].split(separator: " ")[1])!
        print(num)
        var newYear = todayYear
        var newMonth = todayMonth
        var newDay = todayDay
        if todayMonth - (num % 12) >= 1 {
            newMonth -= (num % 12)
            newYear -= (num / 12)
            if newDay == 28 {
                newDay = 1
                if newMonth == 12 {
                    newMonth = 1
                    newYear += 1
                } else {
                    newMonth += 1
                }
            } else {
                newDay += 1
            }
        } else {
            newMonth -= (num % 12) - 12
            newYear -= (num / 12) + 1
            if newDay == 28 {
                newDay = 1
                if newMonth == 12 {
                    newMonth = 1
                    newYear += 1
                } else {
                    newMonth += 1
                }
            } else {
                newDay += 1
            }
        }
        temp += "\(newYear)."
        if newMonth < 10 {
            temp += "0\(newMonth)."
        } else {
            temp += "\(newMonth)."
        }
        if newDay < 10 {
            temp += "0\(newDay)"
        } else {
            temp += "\(newDay)"
        }
        termDate[term] = temp
    }
    print(termDate)
    for i in 0..<privacies.count {
        let term = String(privacies[i].split(separator: " ")[1])
        let date = privacies[i].split(separator: " ")[0]
        if termDate[term]! > date {
            result.append(i + 1)
        }
    }
    print(result)
    return result
}
solution("2022.12.08", ["A 6"], ["2022.06.08 A"])
