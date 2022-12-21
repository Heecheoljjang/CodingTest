import Foundation

//let caseCount = Int(readLine()!)!
let caseCount = 1
for i in 0..<caseCount {
//    let input = readLine()!.components(separatedBy: " ")
//    let number = Int(input[0])!
//    let word = input[1].map { "\($0)" }
    let number = 5
    let word = "/THP".map { "\($0)" }
    var temp: String = ""
    for char in word {
        var count = 0
        while count != number {
            temp += char
            count += 1
        }
    }
    print(temp)
}
