import Foundation

let word = readLine()!.map { String($0) }
let alphabets = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
var result: [String] = []

for alphabet in alphabets {
    result.append(String(word.filter { $0 == alphabet }.count))
}
print(result.joined(separator: " "))
