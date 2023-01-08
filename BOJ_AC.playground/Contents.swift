//import Foundation
//
////let caseCount = Int(readLine()!)!
//let caseCount = 1
//let input = [["DDDD", "2", "[1,2]"]]
//outer: for i in 0..<caseCount {
//    //    let command = readLine()!.map { $0 }
//    //    let n = Int(readLine()!)!
//    let command = input[i][0]
//    let n = Int(input[i][1])!
//    var numbers = input[i][2].dropFirst().dropLast().split(separator: ",").map { Int(String($0))! }
//    var isR = false
//    var head = 0
//    var tail = numbers.count - 1
//    for char in command {
//        if char == "R" {
//            isR.toggle()
//        } else {
//            if tail < head {
//                print("error")
//                continue outer
//            }
//            if isR {
//                tail -= 1
//            } else {
//                head += 1
//            }
//        }
//    }
//    if head > tail {
//        print("[]")
//    } else {
//        if isR {
//            numbers = numbers[head...tail].reversed()
//        } else {
//            numbers = Array(numbers[head...tail])
//        }
//        print("[\(numbers.map { String($0) }.joined(separator: ","))]")
//    }
//}
//

var a = [1,2,3]
a = Array(a[1...2])
print(a)
