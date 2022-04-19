import Foundation

func solution(_ record:[String]) -> [String] {
    
    var result: [String] = []
    
    for i in record {
        if i.components(separatedBy: " ")[0] == "Enter" {
            result.append("\(i.components(separatedBy: " ")[3])님이 들어왔습니다. \(i.components(separatedBy: " "))")
        }
    }
    
    return []
}
