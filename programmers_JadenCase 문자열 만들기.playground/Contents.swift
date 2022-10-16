import Foundation

func solution(_ s:String) -> String {
    
    let tempArr = s.split(separator: " ")
    var result = ""
    
    for word in tempArr {
        if word.first!.isLetter {
            var temp = word.lowercased()
            var first = "\(word.first!.uppercased())"
            temp.removeFirst()
            first += temp
            result += first
        } else {
            result += word.lowercased()
        }
        result += " "
    }
    result.removeLast()
    
    return result
}

solution("3people unFollowed me")
