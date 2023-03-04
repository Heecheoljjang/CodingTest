import Foundation

var words: [String] = []
let input = readLine()!; let inputArr = input.map { String($0) }
for i in 0..<inputArr.count {
    words.append(Array(inputArr[i..<inputArr.count]).joined())
}
words.sort { $0 < $1 }
var answer = ""
for word in words {
    answer += "\(word)\n"
}
print(answer)
