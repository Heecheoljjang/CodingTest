//import Foundation
//
//func solution(_ numbers:[Int]) -> String {
//
//    var result: String = ""
//    let numbers = numbers.map{String($0)}
//
//    return result
//}

let a = ["123", "45", "23", "987"]
print(a.sorted{$0.first! > $1.first!})
