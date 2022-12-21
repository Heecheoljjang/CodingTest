import Foundation

let wordCount = Int(readLine()!)!
var result = 0
outerLoop: for _ in 0..<wordCount {
    let word = readLine()!.map { "\($0)"}
    var used: [String] = []
    for i in 0..<word.count {
        if !used.contains(word[i]) {
            used.append(word[i])
        } else {
            if word[i-1] != word[i] {
                continue outerLoop
            }
        }
    }
    result += 1
}
print(result)
//var N = Int(readLine()!)!
//var arr: [String] = []
//var word: String = ""
//
//for _ in 0..<N {
//    let str = readLine()!
//    arr.append(str)
//}
//
//for str in arr {
//    word = ""
//    for char in str {
//        if word.isEmpty {
//            word.append(char)
//        } else {
//            if word.last == char {
//                continue
//            } else {
//                if !word.contains(char) {
//                    word.append(char)
//                } else {
//                    N -= 1
//                    break
//                }
//            }
//        }
//    }
//}
//print(N)
//
