import Foundation

func solution(_ s:String) -> String {
    
    var result: [String] = []
    let wordArray = s.lowercased().components(separatedBy: " ")
    for i in 0..<wordArray.count {
        if wordArray[i].isEmpty {
            result.append("")
            continue
        }
        var temp = wordArray[i].map { String($0) }
        temp[0] = temp[0].uppercased()
        result.append(temp.joined())
    }
    return result.joined(separator: " ")
}

//import Foundation
//
//func solution(_ s:String) -> String {
//
//    let tempArr = s.split(separator: " ")
//    var result = ""
//
//    for word in tempArr {
//        if word.first!.isLetter {
//            var temp = word.lowercased()
//            var first = "\(word.first!.uppercased())"
//            temp.removeFirst()
//            first += temp
//            result += first
//        } else {
//            result += word.lowercased()
//        }
//        result += " "
//    }
//    result.removeLast()
//
//    return result
//}
//
//solution("3people unFollowed me")
